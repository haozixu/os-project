/*
 *	arch/x86_64/global.cpp
 *
 *	global data
 */
#include <global.hpp>

namespace ARCH {

lib::spinlock arch_data_lock;
gdt_struct gdt;
cpu_info_struct cpu_info;
unsigned long low_free_area;

}