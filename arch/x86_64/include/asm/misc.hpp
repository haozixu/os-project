/*
 *	arch/x86_64/include/asm/misc.hpp
 *
 *	miscellaneous asm operations
 */
#pragma once

#include <compiler.h>

namespace ARCH {

static __always_inline void pause(void)
{
	asm volatile ("pause");
}

static __always_inline void hlt(void)
{
	asm volatile ("hlt");
}

// namespace ARCH interface

/*
 *	@function: relax_cpu
 *	@description: ...
 *	@input: no
 */
static __always_inline void relax_cpu(void)
{
	pause();
}

/*
 *	@function: io_pause
 *	@description: execute a suitable cpu pause for io operations
 *	@input: no
 */
static __always_inline void io_pause(void)
{
	pause();
	pause();
	pause();
	pause();
}

/*
 *	@function: halt_cpu
 *	@description: halt the cpu
 *	@input: no
 */
static __always_inline void halt_cpu(void)
{
	hlt();
}

}

