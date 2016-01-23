/*
 *	arch/x86_64/include/asm/cpuid.h 
 *
 * 	cpuid related 
 */
#ifndef _ASM_CPUID_H
#define _ASM_CPUID_H

#include <compiler.h>
#include <stdint.h>

struct cpuid_regs {
	uint32_t eax, ecx, edx, ebx;
};

static __always_inline void __cpuid(uint32_t function, struct cpuid_regs *regs)
{
	asm volatile (
		"cpuid \n\t"
		:"=a"(regs->eax),"=c"(regs->ecx),"=d"(regs->edx),"=b"(regs->ebx)
		:"a"(function)
	);
}

#endif
