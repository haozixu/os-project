/*
 *	arch/x86_64/include/early_memalloc.hpp
 *
 *	a simple early memory allocator
 */
#pragma once

namespace arch {
	namespace early_memalloc {
		void init();
		void* alloc(unsigned size);
		void free(unsigned size);
	}
}

