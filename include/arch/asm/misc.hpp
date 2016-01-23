/*
 *	include/arch/asm/misc.hpp
 *
 *	miscellaneous arch-related asm operations
 */
#pragma once

namespace ARCH {
	#include <asm/misc.h>
}

namespace arch {
	static inline void relax_cpu()
	{
		ARCH::pause();
	}
}

