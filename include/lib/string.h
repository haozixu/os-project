/*
 *	include/lib/string.h
 *
 *	this file is a part of kernel c library
 *	note: not fully implemented
 */
#pragma once

#include <stddef.h>

#ifdef __cplusplus
extern "C" {
#endif

extern void* memcpy(void* dst, const void* src, size_t size);
extern void* memmove(void* dst, const void* src, size_t size);
extern void* memset(void* s, int c, size_t n);

extern char* strcpy(char* dst, const char* src);
extern size_t strlen(const char* s);
extern int strcmp(const char* s1, const char* s2);

#ifdef __cplusplus
}
#endif
