/*
 * 	arch/x86_64/include/asm/barrier.hpp
 *
 * 	memory barrier
 */
#pragma once

#include <compiler.h>

namespace ARCH {

// load fence
static __always_inline void lfence(void)
{
	asm volatile ("lfence":::"memory");
}

// store fence
static __always_inline void sfence(void)
{
	asm volatile ("sfence":::"memory");
}

// memory fence
static __always_inline void mfence(void)
{
	asm volatile ("mfence":::"memory");
}

// namespace ARCH interface

/*
 *	@function: read_barrier
 *	@description: synchronize all read operations
 */
static __always_inline void read_barrier(void)
{
	lfence();
}

/*
 *	@function: write_barrier
 *	@description: synchronize all write operations
 */
static __always_inline void write_barrier(void)
{
	sfence();
}

/*
 *	@function: memory_barrier
 *	@description: synchronize all memory operations
 */
static __always_inline void memory_barrier(void)
{
	mfence();
}

}

/*
 *	#GENERIC
 *	gcc implemented compiler barrier
 *	use compiler_barrier() instead of using __sync_synchronize() directly
 */
static __always_inline void compiler_barrier()
{
	__sync_synchronize();
}
