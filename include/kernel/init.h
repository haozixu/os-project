/*
 * 	include/kernel/init.h
 *
 * 	should this file become a part of compiler.h?
 */
#pragma once

typedef int (*initcall_t)(void);
typedef void (*constructor_t)(void);

#define __init __attribute__((section(".init.text"))
#define __initdata __attribute__((section(".init.data")
#define __ctor __attribute__((constructor))

#define __initcall __attribute__((section(".init.text"), constructor))

#define register_initcall(level, f) \
		static initcall_t __initcall_##f \
		__attribute__((used, section(".initcall" level)) = f

//extern constructor_t __CTOR_LIST__[];
extern initcall_t __initcall_start, __initcall_end;

static inline void __do_global_ctors(void)
{
/*
	size_t nptrs = reinterpret_cast<size_t>(__CTOR_LIST__[0]);

	for (size_t i = nptrs; i >= 1; --i)
		__CTOR_LIST__[i] ();
*/
}

static inline void do_initcalls(void)
{
	for (initcall_t call = __initcall_start; \
			call != __initcall_end; ++call) {
		(*call) ();
	}
}
