/*
 *	compiler.h
 *
 *	compiler configuration
 */
#pragma once

// #include <compiler-gcc.h> // should we have this?
// other options: #include <compiler-clang.h>
#ifndef __GNUC__
#	error You must use a gcc compatible comiler to compile.(gcc, clang/llvm)
#endif

#define likely(x) __builtin_expect(!!(x), 1)
#define unlikely(x) __builtin_expect(!!(x), 0)

#define is_constant(x) __builtin_constant_p(x)

#define __always_inline __attribute__((always_inline)) inline
#define __force_inline __attribute__((always_inline)) inline
#define __noinline __attribute__((noinline))
#define __noreturn __attribute__((noreturn))

#define __weak __attribute__((weak))
#define __weakref __attribute__((weakref))

#define __packed __attribute__((packed))

#define __used __attribute__((used))
#define __unused __attribute__((unused))

#define __aligned(x) __attribute__((aligned(x)))
#define __alignof(x) __attribute__((alignof(x)))

#define __section(x) __attribute__((section(x)))

#define __user __attribute__((noderef, address_space(1)))
#define __kernel __attribute__((noderef, address_space(0)))
#define __mmio __attribute__((noderef, address_space(2)))

#define __percpu __section(".percpu")

#define _AC(x, y) x##y