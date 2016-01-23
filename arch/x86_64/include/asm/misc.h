/*
 * arch/x86_64/include/asm/misc.h
 *
 * miscellaneous asm operations
 */
#ifndef _ASM_MISC_H
#define _ASM_MISC_H

#include <compiler.h>

static __always_inline void pause(void)
{
	asm volatile ("pause");
}

static __always_inline void hlt(void)
{
	asm volatile ("hlt");
}

static __always_inline void io_pause(void)
{
	pause();
	pause();
	pause();
	pause();
}

#endif

