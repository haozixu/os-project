/*
 *	init.cpp
 *
 *	do the initialization & constructor work
 */

#include <kernel/init.h>
#include <stddef.h>

extern constructor_t __CTOR_LIST__[];
extern initcall_t __initcall_start, __initcall_end;

inline void __do_global_ctors(void)
{
	size_t nptrs = reinterpret_cast<size_t>(__CTOR_LIST__[0]);

	for (size_t i = nptrs; i >= 1; --i)
		__CTOR_LIST__[i] ();
}

inline void do_initcalls(void)
{
	for (initcall_t call = __initcall_start; \
			call != __initcall_end; ++call) {
		(*call) ();
	}
}

