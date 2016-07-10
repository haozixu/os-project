/**
 *	@file include/kernel/kernel.h
 *
 *	@brief kernel version & section
 */
#pragma once

#define __KERNEL__ 0.00.1.3

#include <kernel/config.h>
#include <kernel/types.h>

#ifdef __cplusplus
extern "C" {
#endif

extern uint8_t _text, _etext, _rodata, _erodata,
	   _bss, _ebss, __kernel_end;

#ifdef __cplusplus
}
#endif

static inline bool is_kernel_text(unsigned long start, unsigned long end)
{
	return ((uint8_t *)start >= &_text) && ((uint8_t *)end <= &_etext);
}

static inline bool is_kernel_rodata(unsigned long start, unsigned long end)
{
	return ((uint8_t *)start >= &_rodata) && ((uint8_t *)end <= &_erodata);
}

static inline bool is_kernel_data(unsigned long start, unsigned long end)
{
	return ((uint8_t *)start > &_erodata) && ((uint8_t *)end <= &__kernel_end);
}

