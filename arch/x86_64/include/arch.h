/*
 *	arch/x86_64/include/arch.h
 *	
 *	architectural definitions
 */
#pragma once

#include <.config.h>

#undef __x86_64__
#undef __x86__

#define __x86_64__ "x86_64"
#define __x86__	   "x86"	// should we define this too?

#ifdef __x86_64__
#	define KERNEL_BASE 0xffffff0000100000UL
#	define PHYS_KERNEL_BASE 0x100000UL
#	define __KERNEL_WORD_SIZE 8
	typedef unsigned long long __kernel_word_t;
	typedef long long __signed_kernel_word_t;
#else
#	define __KERNEL_WORD_SIZE 4
	typedef unsigned long __kernel_word_t;
	typedef long __signed_kernel_word_t;	
#endif // __x86_64__

