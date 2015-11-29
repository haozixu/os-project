/*
 *	arch/x86_64/include/e820map.hpp
 *
 *	x86 BIOS E820 memory map
 */
#pragma once

#include <memory/memmap.hpp>

#define MAX_E820_ENTRIES 18
#define E820_MAX MAX_E820_ENTRIES

#define E820_AVAILABLE 	1
#define E820_RESERVED 	2
#define E820_ACPI		3
#define E820_NVS		4

namespace kernel {
	namespace memory {
		typedef mmap_entry e820entry;
		
		struct e820map_struct {
			unsigned nr_entries;
			e820entry map[MAX_E820_ENTRIES];
			
			int setup();
			void print(const char* who = "bootloader") const;
			int copy_from_and_sanitize(mmap_entry* old_map, unsigned& nr_entries);
			
			static inline const char* type_to_string(unsigned type);
		};
		
		extern e820map_struct e820map;
		
		// this idea is borrowed from Linux
		struct change_member {
			e820entry *p_entry; // pointer to original entry
			unsigned long long addr; // address for this change point 
		};
	}
}