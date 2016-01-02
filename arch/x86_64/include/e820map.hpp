/*
 *	arch/x86_64/include/e820map.hpp
 *
 *	x86 BIOS E820 memory map
 */
#pragma once

#include <memory/memmap.hpp>
#include <stdint.h>

#define MAX_E820_ENTRIES 24
#define E820_MAX MAX_E820_ENTRIES

#define E820_AVAILABLE 	1
#define E820_RESERVED 	2
#define E820_ACPI		3
#define E820_NVS		4

namespace kernel {
	namespace memory {
		struct e820entry {
			mmap_entry* e;
			
			e820entry() = delete;
			e820entry(mmap_entry* p) : e(p) {} 
			uint64_t addr() { return e->addr; }
			uint64_t start() { return e->addr; }
			uint32_t type() { return e->type; }
			uint64_t length() { return e->len; }
			uint64_t end() { return e->addr + e->len; }
		};
		
		struct e820map_struct {
			unsigned nr_entries;
		#ifdef LINUX_STYLE_E820
			mmap_entry map[MAX_E820_ENTRIES];
		#else
			mmap_entry* map;
		#endif	
			int setup();
			void print(const char* who = "bootloader") const;
		//	int copy_from_and_sanitize(mmap_entry* old_map, unsigned& nr_entries);
			e820entry operator[](unsigned idx)
			{
				return e820entry(map + idx);
			}
			
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