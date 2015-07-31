/*
 *	arch/arch.h
 *	
 *	architectural definitions
 */
#pragma once

#define __x86_64__ "x86_64"
#define __x86__	   "x86"	// should we define this too?

#if defined(__x86_64__)
#define __KERNEL_WORD_SIZE 8
	typedef unsigned long long __kernel_word_t;
	typedef long long __signed_kernel_word_t;
#else
#define __KERNEL_WORD_SIZE 4
	typedef unsigned long __kernel_word_t;
	typedef long __signed_kernel_word_t;	
#endif // __x86_64__
//#include "arch_types.h" // not yet

