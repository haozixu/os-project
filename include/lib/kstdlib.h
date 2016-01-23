/*
 *	include/lib/kstdlib.h
 *
 *	kernel non-standard "standard library"
 *	this file is a part of kernel c library
 */
#pragma once

#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

// integer to ascii
extern char* kitoa(int num, char* buf, unsigned radix);
extern char* klltoa(long long num, char* buf, unsigned radix);

extern char* kuitoa(unsigned int num, char* buf, unsigned radix);
extern char* kulltoa(unsigned long long num, char* buf, unsigned radix);

extern char* kuitoa_reverse(unsigned int num, char* buf, unsigned radix);
extern char* kulltoa_reverse(unsigned long long num, char* buf, unsigned radix);

// kernel RNG
extern void srand(int seed);
extern int rand();

#ifdef __cplusplus
}
#endif
