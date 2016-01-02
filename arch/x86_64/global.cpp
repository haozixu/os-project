/*
 *	arch/x86_64/global.cpp
 *
 *	global data
 */
#include <global.hpp>

namespace arch {

lib::spinlock arch_data_lock;
cpu_info_struct cpu_info;
unsigned long low_free_area;

}