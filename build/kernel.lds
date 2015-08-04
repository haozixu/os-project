OUTPUT_FORMAT("elf64-x86-64", "elf64-x86-64", "elf64-x86-64")
OUTPUT_ARCH(i386:x86-64)
ENTRY(_start)

KERNEL_PAGE_OFFSET = 0xffffff0000000000;
PHYS_KERNEL_BASE = 0x100000;
KERNEL_BASE = KERNEL_PAGE_OFFSET + PHYS_KERNEL_BASE;

SECTIONS {
	. = KERNEL_PHYSICAL_BASE;
	.boot : AT( ADDR(.boot) - KERNEL_PHYSICAL_BASE) {
		*(.multiboot.head)
		*(.boot.text)
		*(.boot.data)
	}
	. = ALIGN(4K);

	. += KERNEL_PAGE_OFFSET;
	
	.init : AT( ADDR(.init) - KERNEL_BASE) {
		*(.ctor)

		__initcall_start = .;

		*(.initcall0)
		*(.initcall1)
		*(.initcall2)
		*(.initcall3)
		*(.initcall4)
		
		__initcall_end = .;

		*(.init.text)

		. = ALIGN(8);

		*(.init.data)
	}

	/*
	.ctor : AT( ADDR(.ctor) - KERNEL_BASE) {
		*(.ctor)
	}
	*/

	. = ALIGN(4K);
	
	_text = .;
	.text : AT( ADDR(.text) - KERNEL_BASE) {
		*(.text*)
	}
	. = ALIGN(8);
	_etext = .;

	. = ALIGN(4K);
	
	_rodata = .;
	.rodata : AT( ADDR(.rodata) - KERNEL_BASE) {
		*(.rodata*)
	}
	_erodata = .;

	_data = .;
	.data : AT( ADDR(.data) - KERNEL_BASE) {
		*(.data)
	}
	. = ALIGN(16);
	_edata = .;

	_bss = .;	
	.bss : AT( ADDR(.bss) - KERNEL_BASE) {
		*(.bss)
	}
	. = ALIGN(8);
	_ebss = .;

	. = ALIGN(4K);
	
	_end = .;
	
	__kernel_end = .;
	
	__multiboot_load_end = . - KERNEL_PAGE_OFFSET;

	/DISCARD/ : { *.* }
}
