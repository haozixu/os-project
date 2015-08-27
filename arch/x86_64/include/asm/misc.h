/*
 * arch/x86_64/include/asm/misc.h
 *
 * miscellaneous asm operations
 */
#ifndef _ASM_MISC_H
#define _ASM_MISC_H

#include <always_inline.h>

static inline void pause(void)
{
	asm volatile("pause");
}

static inline void hlt(void)
{
	asm volatile("hlt");
}

static inline void io_pause(void)
{
	pause();
	pause();
	pause();
	pause();
}

#undef inline

#endif

