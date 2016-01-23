/*
 *	arch/x86_64/include/lowmem.hpp
 *
 *	a simple early memory allocator
 */
#pragma once

#include <lib/misc.hpp>

namespace arch {
	namespace lowmem {
		constexpr auto lowmem_limit = 640KiB;
		
		void init();
		void* alloc(unsigned size);
		void free(unsigned size);
		void* alloc_pages(unsigned nr_pages);
		void free_pages(void* addr, unsigned nr_pages); 
		void* alloc_page();
		void free_page(void* addr);
	}
}

