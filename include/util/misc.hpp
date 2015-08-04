/*
 *	include/util/misc.hpp
 *
 *	...
 */
#pragma once

#include <compiler.h>
#include <stddef.h>

#ifdef USE_MACRO // may be found in kernel/config.h

#define max(a, b) ((a) > (b) ? (a) : (b))
#define min(a, b) ((a) < (b) ? (a) : (b))
#define array_length(arr) (sizeof(arr) / sizeof(arr[0]))

#else // not defined USE_MACRO

template<typename T>
static constexpr T max(T a, T b)
{
	return a > b ? a : b;
}

template<typename T>
static constexpr T min(T a, T b)
{
	return a < b ? a : b;
}

template<typename T, size_t N>
static constexpr size_t array_length(T (&)[N])
{
	return N;
}

#endif // USE_MACRO
