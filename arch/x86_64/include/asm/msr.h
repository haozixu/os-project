/*
 * arch/x86_64/include/asm/msr.h
 *
 * Model Specific Registers(MSR) operation
 */
#ifndef _ASM_MSR_H
#define _ASM_MSR_H

#include <stdint.h>
#include <compiler.h>

static __always_inline uint64_t rdmsr(unsigned index)
{
	uint64_t val;
	asm volatile ("rdmsr":"=A"(val):"c"(index));
	return val;
}

static __always_inline void wrmsr(unsigned index, uint64_t val)
{
	asm volatile ("wrmsr"::"A"(val),"c"(index));
}

#endif

