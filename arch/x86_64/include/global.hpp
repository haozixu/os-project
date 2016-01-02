/*
 *	arch/x86_64/include/global.hpp
 *
 *	architectural global data
 */
#pragma once

#include <cpu.hpp>
#include <gdt.hpp>
#include <lib/spinlock.hpp>

namespace arch {
	extern lib::spinlock arch_data_lock;
	extern cpu_info_struct cpu_info;
	extern gdt_struct gdt;
	extern unsigned long low_free_area;
}