/*
 *	include/lib/ksprintf.h
 *
 * 	kernel library
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