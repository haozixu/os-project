/*
 * As you see, it's strange enough.
 */
#ifdef __USE_ARCH_INIT_IMPL

#include <kernel/arch-init.hpp>
#include <stdint.h>
#include <paging.h>

namespace arch {

// will be removed from here later
uint8_t nr_cpus; 
uint64_t pdt_system_base;
uint32_t max_cpuid_function;
uint32_t max_cpuid_ext_function;
char cpu_vendor[12];
char cpu_brand[48];

void pre_init(unsigned long arch_data)
{
	pdt_system_base = arch_data;
	asm volatile(
		"movl $1, %%eax \n\t"
		"cpuid \n\t"
		"shrl $16, %%ebx \n\t"
		"andl $0xff, %%ebx \n\t"
		:"=b"(nr_cpus)::"eax"
	);
}

}
#endif