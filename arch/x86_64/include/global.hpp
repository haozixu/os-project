/*
 *	arch/x86_64/include/global.hpp
 *
 *	architectural global data
 */
#pragma once

/*
 *	WARNING: This file will be deprecated soon.
 */

#include <apic.hpp>
#include <cpu.hpp>
#include <gdt.hpp>
#include <ioport.hpp>
#include <lib/spinlock.hpp>

namespace ARCH {
	extern lib::spinlock data_lock;
}
