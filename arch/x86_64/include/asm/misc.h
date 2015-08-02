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

#undef inline

#endif

