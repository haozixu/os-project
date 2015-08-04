/*
 *	boot.2.c
 *
 *	the C entry point(boot)
 */

#include <boot/multiboot2.h>
#include <compiler.h>
#include <stdarg.h>

#include <paging.h>
#include <msr-index.h>
#include <asm/system.h>
#include <asm/msr.h>

#define __boot __section(".boot.text")
#define __bootdata __section(".boot.data")
#define __fastcall __attribute__((fastcall))

typedef unsigned uint_ptr;

static __bootdata volatile short *print_pos = (short *)0xb8000;

__boot void c_start(void); // the entry point
static __boot void printf(const char *fmt, ...);
static __boot inline void putchar(char c, unsigned char color);
static __boot __fastcall void itoa(char *buf, int base, int d);
static __boot __fastcall void clear_4k_pages(void *addr, unsigned count);
static __boot void newline(void);

static __bootdata char m_size[] = "mbi size: %u bytes\n",
                       m0[] = "0x%08x ",
                       m_tag[] = "tag %u, size %u\n",
                       m_loader_name[] = "boot loader name: %s\n",
                       m_basic_mem[] = "memlower: %uKiB memupper: %uKiB\n",
                       m_mmap[] = "memory map:\n";

static __bootdata char m_mmap_entry[] = "base_addr: 0x%08x%08x length: 0x%08x%08x type: %s\n";
static __bootdata char mmap_type1[] = "usable",
				       mmap_type2[] = "reserved",
					   mmap_type3[] = "ACPI reclaim",
					   mmap_type4[] = "ACPI NVS";
/*
static __bootdata const char const *mmap_type1_ptr = mmap_type1,
				                   *mmap_type2_ptr = mmap_type2,
					               *mmap_type3_ptr = mmap_type3,
					               *mmap_type4_ptr = mmap_type4;
static __bootdata const char const *m_mmap_type[] = {mmap_type1_ptr, mmap_type2_ptr, 
	                                                 mmap_type3_ptr, mmap_type4_ptr};
*/
void __noreturn c_start(void)
{
	unsigned *mbi = (unsigned *)0x500;
	struct multiboot_tag *tag;
	unsigned int i;

	printf(m_size, mbi[0]); 

	/*
	for (i = 0; i < mbi[0] / 4; ++i) {
		if (i % 7 == 0)
			newline();
		printf(m0, mbi[i]);
	}
	*/

	newline();

	for (tag = (struct multiboot_tag *)(mbi + 2);
		 tag->type != MULTIBOOT_TAG_TYPE_END;
		 tag = (struct multiboot_tag *)((char *) tag
						+ ((tag->size + 7) & ~7))) {
		printf(m_tag, tag->type, tag->size);
		
		switch (tag->type) {
		case MULTIBOOT_TAG_TYPE_BOOT_LOADER_NAME:
			printf(m_loader_name,
						((struct multiboot_tag_string *) tag)->string);
			break;
		case MULTIBOOT_TAG_TYPE_BASIC_MEMINFO:
			printf(m_basic_mem,
						((struct multiboot_tag_basic_meminfo *) tag)->mem_lower,
						((struct multiboot_tag_basic_meminfo *) tag)->mem_upper);
			break;
		case MULTIBOOT_TAG_TYPE_MMAP:
			{
				multiboot_memory_map_t *mmap;
				
				printf(m_mmap);

				for (mmap = ((struct multiboot_tag_mmap *) tag)->entries;
						(char *)mmap < (char *)tag + tag->size;
						mmap = (multiboot_memory_map_t *)
						((unsigned long) mmap
						 + ((struct multiboot_tag_mmap *) tag)->entry_size)) {
					uint_ptr m_mmap_type;

					switch (mmap->type) {
					case MULTIBOOT_MEMORY_AVAILABLE:
						m_mmap_type = (uint_ptr)mmap_type1;
						break;
					case MULTIBOOT_MEMORY_RESERVED:
					default:
						m_mmap_type = (uint_ptr)mmap_type2;
						break;
					case MULTIBOOT_MEMORY_ACPI_RECLAIMABLE:
						m_mmap_type = (uint_ptr)mmap_type3;
						break;
					case MULTIBOOT_MEMORY_NVS:
						m_mmap_type = (uint_ptr)mmap_type4;
						break;
					}

					printf(m_mmap_entry,	(unsigned)(mmap->addr >> 32), 
											(unsigned)(mmap->addr & 0xffffffff),
											(unsigned)(mmap->len >> 32),
											(unsigned)(mmap->len & 0xffffffff),
											(char *)m_mmap_type);
				}
			}
		default:
			break;
		}
	}
	
	/*
	asm volatile(
		"movl $0xc0000080, %%ecx \n\t"
		"rdmsr \n\t"
		"orl $0x901, %%eax \n\t"
		"wrmsr \n\t"

		"movl $0x2000, %%eax \n\t"
		"movl %%eax, %%cr3 \n\t"

		"movl %%cr0, %%eax \n\t"
		"orl $0x80000000, %%eax \n\t"
		"movl %%eax, %%cr0 \n\t"
	);
	*/

halt:
	asm("hlt");
	goto halt;
}

static inline void putchar(char c, unsigned char color)
{
	if (unlikely(c == 10)) {
		newline();
		return;
	}
	*print_pos++ = color << 8 | c;
}

static inline void newline(void)
{
	unsigned tmp = (unsigned)print_pos - 0xb8000;
	tmp = ((tmp / 160) + 1) * 160;
	print_pos = (short *)(tmp + 0xb8000);
}

static __fastcall void itoa(char *buf, int base, int d)
{
	char *p1, *p2, *p = buf;
	unsigned ud = d;
	int divisor = 10;

	if (base == 'd' && d < 0) {
		*p++ = '-';
		buf++;
		ud = -d;
	} else if (base == 'x') {
		divisor = 16;
	}

	do {
		int remainder = ud % divisor;

		*p++ = (remainder < 10) ? remainder + '0' : remainder + 'a' - 10;
	} while (ud /= divisor);

	*p = 0;

	p1 = buf, p2 = p - 1;
	while (p1 < p2) {
		char tmp = *p1;
		*p1 = *p2;
		*p2 = tmp;
		p1++, p2--;
	}
}

static void printf(const char *fmt, ...)
{
	va_list ap;
	int c;
	char buf[16];

	va_start(ap, fmt);

	while ((c = *fmt++) != 0) {
		if (c != '%')
			putchar(c, 0x0f);
		else {
			char *p, *p2;
			int pad0 = 0, pad = 0;

			c = *fmt++;
			
			if (c == '0') {
				pad0 = 1;
				c = *fmt++;
			}

			if (c >= '0' && c <= '9') {
				pad = c - '0';
				c = *fmt++;
			}

			switch (c) 
			{
			case 'd':
			case 'u':
			case 'x':
				itoa(buf, c, va_arg(ap, int));
				p = buf;
				goto string;
				break;

			case 's':
				p = va_arg(ap, char*);
				if (!p)
					break;

			string:
				for (p2 = p; *p2; p2++);
				for (; p2 < p + pad; p2++)
					putchar(pad0 ? '0' : ' ', 0x0e);
				while (*p)
					putchar(*p++, 0x0e);
				break;

			default:
				putchar(va_arg(ap, int), 0x0f);
				break;
			}
		}
	}

	va_end(ap);
}


static __fastcall void clear_4k_pages(void *addr, unsigned count)
{
	asm volatile (
		"pxor %%xmm0, %%xmm0 \n\t"
		"1: \n\t"
		"movntdq %%xmm0, (%0)    \n\t"
		"movntdq %%xmm0, 16(%0)  \n\t"
		"movntdq %%xmm0, 32(%0)	 \n\t"
		"movntdq %%xmm0, 48(%0)  \n\t"
		"movntdq %%xmm0, 64(%0)  \n\t"
		"movntdq %%xmm0, 80(%0)  \n\t"
		"movntdq %%xmm0, 96(%0)  \n\t"
		"movntdq %%xmm0, 112(%0) \n\t"
		"addl $128, %0 \n\t"
		"subl $128, %1 \n\t"
		"jnz 1b \n\t"
	: /* no output */
	: "r"(addr), "r"(count * 4096)
	: "xmm0");
}
