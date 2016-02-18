/*
 *	include/kernel/kernel.h
 *
 *	...
 */
#pragma once

#define __KERNEL__ SOME_VERSION_NUMBER_ETC

#include <kernel/config.h>
#include <kernel/types.h>

#ifdef __cplusplus
extern "C" {
#endif

extern unsigned long _text, _etext, _rodata, _erodata, __kernel_end;

#ifdef __cplusplus
}
#endif

static inline bool is_kernel_text(unsigned long start, unsigned long end)
{
	return (start >= _text) && (end <= _etext);
}

static inline bool is_kernel_rodata(unsigned long start, unsigned long end)
{
	return (start >= _rodata) && (end <= _erodata);
}

static inline bool is_kernel_data(unsigned long start, unsigned long end)
{
	return (start > _erodata) && (end <= __kernel_end);
}

