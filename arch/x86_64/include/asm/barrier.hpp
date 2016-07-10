/**
 *	@file arch/x86_64/include/asm/barrier.hpp
 *
 *	@brief memory barrier
 */
#pragma once

#include <compiler.h>

namespace ARCH {

/// load fence
static __always_inline void lfence()
{
	asm volatile ("lfence":::"memory");
}

/// store fence
static __always_inline void sfence()
{
	asm volatile ("sfence":::"memory");
}

/// memory fence
static __always_inline void mfence()
{
	asm volatile ("mfence":::"memory");
}

/// namespace ARCH interface

/**
 *	@function: read_barrier
 *	@brief: synchronize all read operations
 */
static __always_inline void read_barrier()
{
	lfence();
}

/**
 *	@function: write_barrier
 *	@brief: synchronize all write operations
 */
static __always_inline void write_barrier()
{
	sfence();
}

/**
 *	@function: memory_barrier
 *	@brief: synchronize all memory operations
 */
static __always_inline void memory_barrier()
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
