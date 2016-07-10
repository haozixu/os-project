/**
 *	@file arch/x86_64/include/asm/misc.hpp
 *
 *	@brief miscellaneous assembly operations
 */
#pragma once

#include <compiler.h>

namespace ARCH {

static __always_inline void pause()
{
	asm volatile ("pause");
}

static __always_inline void hlt()
{
	asm volatile ("hlt");
}

/// namespace ARCH interface

/**
 *	@function: relax_cpu
 *	@brief: ...
 *	@input: no
 */
static __always_inline void relax_cpu()
{
	pause();
}

/**
 *	@function: halt_cpu
 *	@brief: halt the cpu
 *	@input: no
 */
static __always_inline void halt_cpu()
{
	hlt();
}

}

