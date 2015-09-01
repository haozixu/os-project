/*
 * arch/x86_64/include/asm/barrier.h
 *
 * memory barrier
 */
#ifndef _ASM_BARRIER_H
#define _ASM_BARRIER_H

#include <always_inline.h>

static inline void lfence(void)
{
	asm volatile("lfence":::"memory");
}

static inline void sfence(void)
{
	asm volatile("sfence":::"memory");
}

static inline void mfence(void)
{
	asm volatile("mfence":::"memory");
}

#undef inline

#endif
