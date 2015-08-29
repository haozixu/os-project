/*
 *	arch/x86_64/init.cpp
 *
 *	architectural initilization
 */

#include <arch/init.hpp>
#include <stdint.h>
#include <asm/paging.h>

namespace arch {

// will be removed from here later
uint8_t nr_cpus; 
uint64_t pdt_system_base;
uint32_t max_cpuid_func_number;
uint32_t max_cpuid_ext_func_number;
char cpu_vendor[12];
char cpu_brand[48];

void pre_init(unsigned long arch_data)
{
	// store it!
	pdt_system_base = arch_data;
	// get vendor ID and the largest cpuid basic function number 
	asm volatile(
		"xorl %%eax, %%eax \n\t"
		"cpuid \n\t"
		"movl %%ebx, 0(%%rsi) \n\t"
		"movl %%edx, 4(%%rsi) \n\t"
		"movl %%ecx, 8(%%rsi) \n\t"
		:"=a"(max_cpuid_func_number)
		:"S"(cpu_vendor)
	);
	// get logical processor count
	asm volatile(
		"movl $1, %%eax \n\t"
		"cpuid \n\t"
		"shrl $16, %%ebx \n\t"
		"andl $0xff, %%ebx \n\t"
		:"=b"(nr_cpus)::"eax"
	);
}

}
