/*
 *	arch/x86_64/restart.cpp
 *
 *	system restart & hardware reset
 */
#include <io.hpp>
#include <stdint.h>

#include <asm/misc.h>

namespace ARCH {

void direct_restart()
{
	uint8_t val = ports_byte[0xcf9] & ~6;
	ports_byte[0xcf9] = val | 2;
	io_pause();
	ports_byte[0xcf9] = val | 6;
	hlt();
	
	__builtin_unreachable();
}

}
