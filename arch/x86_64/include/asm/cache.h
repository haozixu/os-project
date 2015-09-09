/*
 * 	arch/x86_64/include/asm/cache.h
 *
 * 	cache, TLB related operations
 */
#ifndef _ASM_CACHE_H
#define _ASM_CACHE_H

#include <compiler.h>

#define CACHELINE_SIZE 64

#define __cacheline_aligned __aligned(CACHELINE_SIZE)

static __always_inline void flush_tlb_single(void *addr)
{
	asm volatile("invlpg (%0)"::"r"(addr):"memory");
}

#undef inline

#endif
