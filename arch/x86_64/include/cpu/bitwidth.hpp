/*
 *	arch/x86_64/include/cpu/bitwidth.hpp
 *
 *	...
 */
#pragma once

#define BITS_PER_BYTE 8
#define BITS_PER_WORD 16
#define BITS_PER_DWORD 32
#define BITS_PER_QWORD 64

#define BITS_PER_CHAR 8 
#define BITS_PER_SHORT 16
#define BITS_PER_INT 32
#define BITS_PER_LONG 64
#define BITS_PER_LONG_LONG 64
#define BITS_PER_FLOAT 32
#define BITS_PER_DOUBLE 64 
#define BITS_PER_LONG_DOUBLE 80
// TODO: do some static check to ensure some value are equal

namespace ARCH {
	constexpr unsigned bits_per_char = sizeof(char);
	constexpr unsigned bits_per_short = sizeof(short);
	constexpr unsigned bits_per_int = sizeof(int);
	constexpr unsigned bits_per_long = sizeof(long);
	constexpr unsigned bits_per_long_long = sizeof(long long);
	constexpr unsigned bits_per_float = sizeof(float);
	constexpr unsigned bits_per_double = sizeof(double);
	constexpr unsigned bits_per_long_double = sizeof(long double);
}

