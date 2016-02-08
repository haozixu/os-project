/*
 *	arch/x86_64/global.cpp
 *
 *	global data
 */
#include <global.hpp>

/*
 *	WARNING: This file will be deprecated soon.
 */

namespace ARCH {

lib::spinlock data_lock;
gdt_struct gdt;
cpu_info_struct cpu_info;

}
