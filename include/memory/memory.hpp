/*
 *	include/memory/memory.hpp
 *
 *	memory stuff
 */
#pragma once

#include <kernel/kernel.h>

namespace kernel {
	namespace memory {
		struct sys_memory_desc {
			unsigned long long max_low_addr, max_high_addr,
						  mmio_start, mmio_end;
		};

	}
}

