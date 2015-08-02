# arch/x86_64/boot/boot.S

#define ASM_FILE
#include <multiboot2.h>

.section ".boot.head", "ax" 

.global _start

.extern c_start

.extern __multiboot_load_end
.extern KERNEL_BASE
# defined in build/kernel.lds 

multiboot_header: # see multiboot2 spec
  .long MULTIBOOT2_HEADER_MAGIC                 # magic
  .long MULTIBOOT_ARCHITECTURE_I386             # ISA: MULTIBOOT_ARCHITECTURE_I386
  .long multiboot_header_end - multiboot_header # header length
  .long -(MULTIBOOT2_HEADER_MAGIC + MULTIBOOT_ARCHITECTURE_I386 + \
			  (multiboot_header_end - multiboot_header))
  # header checksum
 
address_tag_start:
  .short MULTIBOOT_HEADER_TAG_ADDRESS
  .short MULTIBOOT_HEADER_TAG_OPTIONAL
  .long address_tag_end - address_tag_start
  .long multiboot_header
  .long multiboot_header
  .long __multiboot_load_end
  .long 0 # no "bss"
address_tag_end:

entry_tag_start:
  .short MULTIBOOT_HEADER_TAG_ENTRY_ADDRESS
  .short MULTIBOOT_HEADER_TAG_OPTIONAL
  .long entry_tag_end - entry_tag_start
  .long _start
  .long 0
entry_tag_end:

#framebuffer_tag_start:
#  .short MULTIBOOT_HEADER_TAG_FRAMEBUFFER
#  .short MULTIBOOT_HEADER_TAG_OPTIONAL
#  .long framebuffer_tag_end - framebuffer_tag_start
#  .long 1024, 768
#  .long 32
#  .long 0
#framebuffer_tag_end:

  .short 0, 0          # end tag
  .long 8
multiboot_header_end:

.code32

.align 64

_start:

#ifdef DO_BOOTLOADER_CHECK
	cmpl $MULTIBOOT2_BOOTLOADER_MAGIC, %eax
	jne die
#endif

	movw %ds, %ax
	movw %ax, %es		# make sure they're the same		

	movl $temp_stack_top, %esp
	
	movl (%ebx), %ecx	# ecx: the total size of bootinfo
	shrl $2, %ecx		# ecx /= 4
	movl %ebx, %esi
	movl $0x500, %edi
	rep movsl			# move the bootinfo to a known place

	movl %cr0, %eax
	andl $0xfffffffb, %eax
						# clear CR0.EM Coprocessor Emulation
	orl $2, %eax		# set CR0.MP Coprocessor Monitoring
	movl %eax, %cr0
	movl %cr4, %eax
	orl $0x600, %eax	# set CR4.OSFXSR & CR4.OSXMMEXCPT
	movl %eax, %cr4

#ifdef DO_ARCH_CHECK
	pushfl
	movl (%esp), %ecx
	xorl $0x200000, (%esp)
	popfl
	pushfl
	popl %edx
	cmpl %ecx, %edx
	je die				# check if support cpuid

	movl $0x80000000, %eax
	cpuid
	cmpl $0x80000004, %eax
	jb die

	movl $0x80000001, %eax
	cpuid				# check if it supports x86_64
	btl $29, %edx
	jnc die
#endif /* DO_ARCH_CHECK */

	jmp c_start

#if defined(DO_ARCH_CHECK) || defined(DO_BOOTLOADER_CHECK)
die:
	movl $message, %esi
	movb $0x04, %ah
	call print_with_color
	cli
	hlt
	jmp .

message:
  .asciz "[halt]:Your machine do not support x86_64. Please consider changing your machine."
#endif

.section ".boot.stack", "aw"
  .fill 0x400, 1, 0
temp_stack_top:

