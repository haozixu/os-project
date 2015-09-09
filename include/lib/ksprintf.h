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

int ksprintf(char *buffer, const char *format, ...);
int kvsprintf(char *buffer, const char *format, va_list args);

#ifdef __cplusplus
}
#endif