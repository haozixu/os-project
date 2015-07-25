/*
 *	boot.2.c
 *
 *	the C entry point(boot)
 */

#include <boot/multiboot2.h>
#include <compiler.h>
#include <stdint.h>

#define __boot __section(".boot.text")
#define __bootdata __section(".boot.data")

static __bootdata uint16_t *print_pos = (uint16_t *)0xb8000;

__boot void c_start(void); // the entry point
static __boot void printf(const char *fmt, ...);
static __boot inline void putchar(char c, int8_t color);
static __boot void newline(void);
static __boot void itoa(char *buf, int base, int32_t d);

static __bootdata char msg[] = "hello! %x\n";
static __bootdata char null_str[] = "(NULL)";

__section(".boot.stack") char temp_stack[1024] = {};

void c_start(void)
{
	printf(msg, 0xdeadbeef);

loop:
	goto loop;
}

static inline void putchar(char c, int8_t color)
{
	if (unlikely(c == 10))
		newline();
	*print_pos++ = color << 8 | c;
}

static inline void newline(void)
{
	print_pos = (uint16_t *)((((uint32_t)print_pos / 160) + 1) * 160);
}

static void itoa(char *buf, int base, int32_t d)
{
	char *p1, *p2, *p = buf;
	uint32_t ud = d;
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
	char **arg = (char **) &fmt;
	int c;
	char buf[16];

	++arg;

	while ((c = *fmt++) != 0) {
		if (c != '%')
			putchar(c, 0x0f);
		else {
			char *p, *p2;
			// int pad0 = 0, pad = 0;

			c = *fmt++;
			/*
			if (c == '0') {
				pad0 = 1;
				c = *fmt++;
			}

			if (c >= '0' && c <= '9') {
				pad = c - '0';
				c = *fmt++;
			}
			*/

			switch (c) 
			{
			case 'd':
			case 'u':
			case 'x':
				itoa(buf, c, *((int *) arg++));
				p = buf;
				goto string;
				break;

			case 's':
				p = *arg++;
				if (!p)
					p = null_str;

			string:
				for (p2 = p; *p2; p2++);
				//for (; p2 < p + pad; p2++)
				//	putchar(pad0 ? '0' : ' ', 0x0e);
				while (*p++)
					putchar(*p, 0x0e);
				break;

			default:
				putchar(*((int *) arg++), 0x0f);
				break;
			}
		}
	}
}



