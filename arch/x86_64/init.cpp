/*
 *	arch/x86_64/init.cpp
 *
 *	architectural initilization
 */

#include <arch/init.hpp>
#include <stdint.h>
#include <asm/paging.h>

namespace arch {

// ??? will be removed from here later
struct {
	uint8_t nr_processors; // threads
	uint32_t max_cpuid_func_number;
	uint32_t max_cpuid_ext_func_number;
	char vendor_id[12];
	char brand[48];
} cpu_info;

unsigned long pdt_system_base;

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
		:"=a"(cpu_info.max_cpuid_func_number)
		:"S"(cpu_info.vendor_id)
	);
	// get logical processor count
	asm volatile(
		"movl $1, %%eax \n\t"
		"cpuid \n\t"
		"shrl $16, %%ebx \n\t"
		"andl $0xff, %%ebx \n\t"
		:"=b"(cpu_info.nr_processors)::"eax"
	);
	// get the largest cpuid extended function number
	asm volatile(
		"movl $0x80000000, %%eax \n\t"
		"cpuid \n\t"
		:"=a"(cpu_info.max_cpuid_ext_func_number)
	);
	// get cpu brand
	asm volatile(
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
		:"S"(cpu_info.brand)
		:"eax", "ebx", "ecx", "edx"
	);
}

void init()
{
	//init_gdt();
	//init_idt();
	//init_paging();
}

}
