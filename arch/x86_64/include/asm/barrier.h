/*
 * 	arch/x86_64/include/asm/barrier.h
 *
 * 	memory barrier
 */
#ifndef _ASM_BARRIER_H
#define _ASM_BARRIER_H

#include <compiler.h>

static __always_inline void lfence(void)
{
	asm volatile ("lfence":::"memory");
}

static __always_inline void sfence(void)
{
	asm volatile ("sfence":::"memory");
}

static __always_inline void mfence(void)
{
	asm volatile ("mfence":::"memory");
}

#endif
