/*
 *	arch/x86_64/kernel/init.cpp
 *
 *	architectural initilization
 */

#include <arch/kernel/init.hpp>
#include <kernel/init.h>

//#include <kernel/global.hpp>

#include <kernel/logging.hpp>
#include <kernel/acpi.hpp>
#include <kernel/gdt.hpp>

#include <lib/misc.hpp> // for string literal operator
#include <lib/kassert.h>
#include <lib/string.h> // for memcpy

#include <memory/mminit.hpp>
#include <memory/e820map.hpp>
#include <memory/lowmem.hpp>

#include <cpu/cpu.hpp>
#include <io/pci.hpp>
#include <interrupt/apic.hpp>
#include <interrupt/ioapic.hpp>

static void __init init_percpu_section();

namespace ARCH {

void __init pre_init(unsigned long arch_data)
{
	// store it!
	lowmem::free_area = arch_data;
#if 0
	// get vendor ID and the largest cpuid basic function number 
	asm volatile (
		"xorl %%eax, %%eax \n\t"
		"cpuid \n\t"
		"movl %%ebx, 0(%%rdi) \n\t"
		"movl %%edx, 4(%%rdi) \n\t"
		"movl %%ecx, 8(%%rdi) \n\t"
		:"=a"(cpu_info.max_cpuid_func_number)
		:"D"(cpu_info.vendor_id)
		:"ecx", "edx", "ebx"
	);
	// get logical processor count
	asm volatile (
		"movl $1, %%eax \n\t"
		"cpuid \n\t"
		"shrl $16, %%ebx \n\t"
		"andl $0xff, %%ebx \n\t"
		:"=b"(cpu_info.nr_processors)
		: /* no input */
		:"eax", "ecx", "edx"
	);
	
//	KASSERT(cpu_info.nr_processors <= 8,
//		 "this version of kernel does not support cpu with more than 8 threads.\n");
	
	// get the largest cpuid extended function number
	asm volatile (
		"movl $0x80000000, %%eax \n\t"
		"cpuid \n\t"
		:"=a"(cpu_info.max_cpuid_ext_func_number)
		: /* no input */
		:"ecx", "edx", "ebx"
	);
	// get cpu brand
	asm volatile (
		"movl $0x80000002, %%eax \n\t"
		"cpuid \n\t"
		"movl %%eax,  0(%%rdi) \n\t"
		"movl %%ebx,  4(%%rdi) \n\t"
		"movl %%ecx,  8(%%rdi) \n\t"
		"movl %%edx, 12(%%rdi) \n\t"
		"movl $0x80000003, %%eax \n\t"
		"cpuid \n\t"
		"movl %%eax, 16(%%rdi) \n\t"
		"movl %%ebx, 20(%%rdi) \n\t"
		"movl %%ecx, 24(%%rdi) \n\t"
		"movl %%edx, 28(%%rdi) \n\t"
		"movl $0x80000004, %%eax \n\t"
		"cpuid \n\t"
		"movl %%eax, 32(%%rdi) \n\t"
		"movl %%ebx, 36(%%rdi) \n\t"
		"movl %%ecx, 40(%%rdi) \n\t"
		"movl %%edx, 44(%%rdi) \n\t"
		: /* no output */
		:"D"(cpu_info.model_name)
		:"eax", "ecx", "edx", "ebx"
	);
#endif
}

void __init init()
{
	e820map.setup();
	lowmem::init();
	gdt.init();
	init_memory_mapping();
	//idt.init();
	apic.init();
	acpi::init();
	io_apic.init();
	//init_processors();
	////copy_ap_startup_code();
	//init_percpu_section();
}

}

extern "C" char *__percpu_section_start, *__percpu_section_end;

static void __init init_percpu_section()
{	
	unsigned length = __percpu_section_end - __percpu_section_start; // percpu section length
	unsigned nr_prcsr = ARCH::cpu_info.nr_processors;
	
	KASSERT(length < 20KiB, "percpu section exceeds 20KiB limit!\n");
	
	unsigned long address = 32KiB + 8KiB * nr_prcsr;
	
	for (auto i = 0; i < nr_prcsr; ++i) {
		memcpy(reinterpret_cast<void*>(address), __percpu_section_start, length);
		address += 24KiB;
	}
	
}
