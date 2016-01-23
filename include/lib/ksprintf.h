/*
 *	include/lib/ksprintf.h
 *
 * 	this file is a part of kernel c library
 */
#pragma once

#include <stdarg.h>

#ifdef __cplusplus
extern "C" {
#endif

extern int ksprintf(char* buffer, const char* format, ...);
extern int kvsprintf(char* buffer, const char* format, va_list args);

#ifdef __cplusplus
}
#endif