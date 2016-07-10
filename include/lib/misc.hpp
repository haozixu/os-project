/*
 *	include/lib/misc.hpp
 *
 *	...
 */
#pragma once

#include <compiler.h>
#include <stddef.h>

/*
 *	get rid of min & max and put them in algorithm.hpp
 */
#ifdef CONFIG_USE_MACRO // may be found in kernel/config.h

#define array_length(array) (sizeof(array) / sizeof(array[0]))
#define align_up(n, align) ({ n = (n + align - 1) & static_cast<decltype(n)>(-align); })
#define align_down(n, align) ({ n = n & static_cast<decltype(n)>(-align); })

#else

template<typename T, size_t N>
static inline constexpr size_t array_length(T (&)[N])
{
	return N;
}

template<typename Uint, typename Int> // Uint stands for unsigned integer
static inline constexpr Uint align_up(Uint n, Int align)
{
	return (n + align - 1) & ~(static_cast<Uint>(align) - 1);
}

template<typename Uint, typename Int> // Uint stands for unsigned integer
static inline constexpr Uint align_down(Uint n, Int align)
{
	return n & ~(static_cast<Uint>(align) - 1);
}

#endif // CONFIG_USE_MACRO

constexpr unsigned long long operator"" KiB(unsigned long long x)
{
	return x * 1024; // 0x400
}

constexpr unsigned long long operator"" MiB(unsigned long long x)
{
	return x * 1048576; // 0x100000
}

constexpr unsigned long long operator"" GiB(unsigned long long x)
{
	return x * 0x40000000; // 1073741824
}

template<typename T>
static inline T STR_VAL(const char* str)
{
	return *reinterpret_cast<const T*>(str);	
}