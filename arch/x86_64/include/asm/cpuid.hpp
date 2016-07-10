/**
 *	@file arch/x86_64/include/asm/cpuid.hpp
 *
 * 	@brief CPUID related operations
 */
#pragma once

#include <compiler.h>
#include <stdint.h>

namespace ARCH {

struct cpuid_regs {
	uint32_t eax, ecx, edx, ebx;
};

/**
 *	@brief encapsulated CPUID instruction call
 */
static __always_inline void cpuid(uint32_t function, struct cpuid_regs& regs)
{
	asm volatile (
		"cpuid \n\t"
		:"=a"(regs.eax),"=c"(regs.ecx),"=d"(regs.edx),"=b"(regs.ebx)
		:"a"(function)
	);
}

}
