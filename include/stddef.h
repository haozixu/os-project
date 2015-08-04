/*
 *	include/stddef.h
 *
 *	...
 */
#pragma once

#include <arch/arch.h>

typedef __kernel_word_t         size_t;
typedef __signed_kernel_word_t  ptrdiff_t;

#define offsetof(type, member) __builtin_offsetof(type, member)

#ifdef __cplusplus
	typedef decltype(nullptr) nullptr_t;
#endif // __cplusplus
