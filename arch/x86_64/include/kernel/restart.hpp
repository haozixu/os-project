/*
 *	arch/x86_64/include/kernel/restart.hpp
 *
 *	system restart & hardware reset
 */
#pragma once

#include <io/ports.hpp>
#include <stdint.h>

#include <asm/misc.hpp>

namespace ARCH {

void direct_restart()
{
	uint8_t val = ports_byte[0xcf9] & ~6;
	ports_byte[0xcf9] = val | 2;
	io_delay();
	ports_byte[0xcf9] = val | 6;
	halt_cpu();
	
	__builtin_unreachable();
}

}