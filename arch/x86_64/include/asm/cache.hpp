/*
 * 	arch/x86_64/include/asm/cache.hpp
 *
 * 	cache, TLB related operations
 */
#pragma once

#include <compiler.h>

namespace ARCH {

#define CACHELINE_SIZE 64

#define __cacheline_aligned __aligned(CACHELINE_SIZE)

// namespace ARCH interface
/*
 *	@function(overload): flush_tlb
 *	@description: invalidate page TLB
 *	@input: addr=address of the page
 */
static __always_inline void flush_tlb(void *addr)
{
	asm volatile ("invlpg (%0)"::"r"(addr):"memory");
}

/*
 *	@function(overload): flush_tlb
 *	@description: invalidate all TLB
 *	@input: no
 */
static __always_inline void flush_tlb(void)
{
	asm volatile (
			"movq %%cr3, %%rax \n\t"
			"movq %%rax, %%cr3 \n\t"
			:::"rax");
}

}
