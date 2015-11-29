/*
 *	include/memory/memmap.hpp
 *
 *	memory map
 */
 
/*
 *	note: this memmap structure is designed for x86
 *	in order to adapt other architectures, some changes must be made
 */
#pragma once

#include <boot/multiboot2.h>

namespace kernel {
	namespace memory {
		using mmap_entry = multiboot_memory_map_t;
		
		struct mmap_info_struct {
			unsigned nr_entries;
			mmap_entry* original_map;
		};
		
		extern mmap_info_struct mmap_info;
		// the instance mmap_info should be able to found in arch related code
	}
}