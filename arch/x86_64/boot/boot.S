# arch/x86_64/boot/boot.S

#define ASM_FILE
#include <multiboot2.h>

.section ".boot", "ax"

.global _start
.type _start, @function

.extern __kernel_pre_start
# .extern _ZN6kernel5startEv
#.extern phys_pdt_system_base

.extern __multiboot_load_end
# defined in build/kernel.lds

.set PAGE_OFFSET, 0xffffff0000000000
.set MBI_ADDR, 0x500
.set GDT_BASE, 0x1000
.set PML4T_BASE, 0x2000
.set BOOT_PAGE_PDT_BASE, 0x8000 # 32k

multiboot_header: # see multiboot2 spec
    .long MULTIBOOT2_HEADER_MAGIC                 # magic
    .long MULTIBOOT_ARCHITECTURE_I386             # ISA: MULTIBOOT_ARCHITECTURE_I386
    .long multiboot_header_end - multiboot_header # header length
    .long -(MULTIBOOT2_HEADER_MAGIC + MULTIBOOT_ARCHITECTURE_I386 +(multiboot_header_end - multiboot_header))
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

framebuffer_tag_start:
    .short MULTIBOOT_HEADER_TAG_FRAMEBUFFER
    .short MULTIBOOT_HEADER_TAG_OPTIONAL
    .long framebuffer_tag_end - framebuffer_tag_start
    .long 1024, 768
    .long 32
    .long 0
framebuffer_tag_end:

    .short 0, 0     # end tag
    .long 8
multiboot_header_end:

gdt0:
    .quad 0x0000000000000000    # dummy
    .quad 0x00209a0000000000    # code64
    .quad 0x0020920000000000    # data64

temp_gdt_ptr:
    .short (3 * 8 - 1)
    .quad GDT_BASE

gdt_ptr:
    .short (3 * 8 - 1)
    .quad (GDT_BASE + PAGE_OFFSET)

.code32

.align 64

_start:
#ifdef DO_BOOTLOADER_CHECK
    cmpl $0x36d76289, %eax
    je 1f
    hlt
    jmp .
#endif
1:
    movw %ds, %ax
    movw %ax, %es           # make sure they're the same

    # copy the bootinfo to a known place  
    movl (%ebx), %ecx       # ecx: the total size of bootinfo
    shrl $2, %ecx           # ecx /= 4
    movl %ebx, %esi
    movl $MBI_ADDR, %edi
    rep movsl               

    # copy the gdt
    movl $gdt0, %esi
    movl $GDT_BASE, %edi
    movl $6, %ecx
    rep movsl

    movl $1, %eax
    cpuid                   # get logical processor count
    shrl $16, %ebx
    andl $0xff, %ebx        # ebx = logical processor count

    movl $0x1000, %eax
    mulw %bx                # eax = nr_cpu * 4k
    addl $0xc000, %eax      # preserve interrupt stack area
    movl %eax, %esp         # set bsp's stack pointer

    movl $0x5000, %eax
    mulw %bx
    addl $0x8000, %eax
    pushl $0
    pushl %eax              # save system_pdt base

    # setup temporary kernel pdt
    movl $BOOT_PAGE_PDT_BASE, %eax
    movl $(1048576 * 0 | 0x83),   (%eax)
    movl $(1048576 * 2 | 0x83),  8(%eax)
    movl $(1048576 * 4 | 0x83), 16(%eax)
    movl $(1048576 * 6 | 0x83), 24(%eax)

    xorl %edx, %edx
    movl %edx,  4(%eax)
    movl %edx, 12(%eax)
    movl %edx, 20(%eax)
    movl %edx, 28(%eax)

    # setup kernel pdpt
    orb $3, %al

    movl $0x3000, %esi      
    movl %eax,  (%esi)
    movl %edx, 4(%esi)

    movl $0x4000, %edi
    movl %eax,  (%edi)
    movl %edx, 4(%edi)

    # setup system pml4t
    movl $PML4T_BASE, %eax
    movl $0x3007,     (%eax)    # pml4t[0] user
    movl %edx,       4(%eax)    
    movl $0x4003, 4080(%eax)    # pml4t[510] kernel (510 * sizeof(pml4e) = 4080)
    movl %edx,    4084(%eax)   
    movl $0x5003, 4088(%eax)    # pml4t[511] reserved (511 * 8 = 4088)
    movl %edx,    4092(%eax)    

    movl %eax, %cr3         # CR3 = PML4T_BASE

    movl %cr4, %eax
    orl $0x6a0, %eax        # set CR4.PAE & CR4.PGE & CR4.OSFXSR & CR4.OSXMMEXCPT
    movl %eax, %cr4

    movl $0xc0000080, %ecx
    rdmsr
    orl $0x901, %eax        # set IA32_EFER.NXE & IA32_EFER.LME & IA32_EFER.SCE
    wrmsr

    movl %cr0, %eax
    andl $0x1ffffffb, %eax  # clear CR0.CD & CR0.NW & CR0.EM Coprocessor Emulation
    orl $0x80000002, %eax   # set CR0.PG & CR0.MP Coprocessor Monitoring
    movl %eax, %cr0

    lgdt (temp_gdt_ptr)
    ljmp $8, $2f

.code64
2:
    movabs $(start64), %rcx
    jmp *%rcx

.text
.code64

.align 16

start64:
    lgdt (gdt_ptr)

	movw $16, %ax
	movw %ax, %ds
	movw %ax, %es
	movw %ax, %ss
    
    movabs $PAGE_OFFSET, %rdx
    addq %rdx, %rsp         # adjust rsp

    popq %rsi

	jmp __kernel_pre_start

    cli
    hlt
