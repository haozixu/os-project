/*
 *	include/memory/mmap.hpp
 *
 *	memory map
 */
#pragma once

#include <boot/multiboot2.h>

namespace kernel {
	namespace memory {
		using mmap_entry = multiboot_memory_map_t;
		
		struct {
			unsigned nr_entries;
			mmap_entry* map;
		} mmap_control_block;
	}
}