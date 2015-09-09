/*
 *	include/lib/kitoa.h
 *
 *	this file is a part of kernel c library
 */
#pragma once

#ifdef __cplusplus
extern "C" {
#endif

char* kitoa(int num, char* buf, unsigned int radix);
char* klltoa(long long num, char* buf, unsigned int radix);

char* kuitoa(unsigned int num, char* buf, unsigned int radix);
char* kulltoa(unsigned long long num, char* buf, unsigned int radix);

#ifdef __cplusplus
}
#endif
