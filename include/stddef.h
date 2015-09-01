/*
 *	include/stddef.h
 *
 *	...
 */
#pragma once

typedef unsigned long	size_t;
typedef long			ptrdiff_t;
typedef unsigned long 	uintptr_t;
typedef long			intptr_t;

#define offsetof(type, member) __builtin_offsetof(type, member)

#ifdef __cplusplus
	typedef decltype(nullptr) nullptr_t;
#endif // __cplusplus
