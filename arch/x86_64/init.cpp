/*
 *	arch/x86_64/init.cpp
 *
 *	architectural initilization
 */

#include <arch/init.hpp>
#include <kernel/init.h>

#include <global.hpp>

#include <kernel/logging.hpp>
#include <lib/misc.hpp> // for string literal operator
#include <lib/kassert.h>
#include <lib/string.h> // for memcpy

#include <mminit.hpp>
#include <e820map.hpp>
#include <lowmem.hpp>

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
		"movl %%ebx, 0(%%rsi) \n\t"
		"movl %%edx, 4(%%rsi) \n\t"
		"movl %%ecx, 8(%%rsi) \n\t"
		:"=a"(cpu_info.max_cpuid_func_number)
		:"S"(cpu_info.vendor_id)
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
		"movl %%eax,  0(%%rsi) \n\t"
		"movl %%ebx,  4(%%rsi) \n\t"
		"movl %%ecx,  8(%%rsi) \n\t"
		"movl %%edx, 12(%%rsi) \n\t"
		"movl $0x80000003, %%eax \n\t"
		"cpuid \n\t"
		"movl %%eax, 16(%%rsi) \n\t"
		"movl %%ebx, 20(%%rsi) \n\t"
		"movl %%ecx, 24(%%rsi) \n\t"
		"movl %%edx, 28(%%rsi) \n\t"
		"movl $0x80000004, %%eax \n\t"
		"cpuid \n\t"
		"movl %%eax, 32(%%rsi) \n\t"
		"movl %%ebx, 36(%%rsi) \n\t"
		"movl %%ecx, 40(%%rsi) \n\t"
		"movl %%edx, 44(%%rsi) \n\t"
		: /* no output */
		:"S"(cpu_info.model_name)
		:"eax", "ecx", "edx", "ebx"
	);
#endif
}

void __init init()
{
	
	//init_percpu_section();
	e820map.setup();
	lowmem::init();
	//paging::init();
	gdt.init();
	init_memory_mapping();
	//init_idt();
	//init_apic();
	//init_processors();
	////copy_ap_startup_code();
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