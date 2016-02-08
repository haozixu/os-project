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

namespace ARCH {
	using kernel::memory::mmap_entry;
	
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
	
	struct e820 {
		static constexpr uint32_t MAX_ENTRIES = E820_MAX;
		static constexpr uint32_t AVAILABLE = E820_AVAILABLE;
		static constexpr uint32_t RESERVED = E820_RESERVED;
		static constexpr uint32_t ACPI = E820_ACPI;
		static constexpr uint32_t ACPI_NVS = E820_NVS;
		
		uint32_t nr_entries;
	#ifdef LINUX_STYLE_E820
		mmap_entry map[MAX_E820_ENTRIES];
	#else
		mmap_entry* map;
	#endif	
		int setup();
		void print(const char* who = "bootloader") const;
	//	int copy_from_and_sanitize(mmap_entry* old_map, uint32_t& nr_entries);
		e820entry operator[](unsigned idx)
		{
			return e820entry(map + idx);
		}
		
		unsigned long end_address(uint32_t type, unsigned long limit = ~0UL)
		{
			unsigned long last_addr = 0;
			
			for (auto i = 0; i < nr_entries; ++i) {
				if (map[i].type != type)
					continue;
				if (map[i].addr >= limit)
					continue;
					
				unsigned long end = map[i].addr + map[i].len;
				if (end > limit) {
					last_addr = limit;
					break;
				}
				if (end > last_addr)
					last_addr = end;
			}
			
			return last_addr;
		}
		
		static inline const char* type_to_string(uint32_t type)
		{
			switch (type) {
			case e820::AVAILABLE:
				return "available";
				break;
			case e820::ACPI:
				return "ACPI data";
				break;
			case e820::ACPI_NVS:
				return "ACPI Non-Volatile Storage";
				break;
			case e820::RESERVED:
			default:
				return "reserved";
				break;
			}
		}
	};
		
	extern e820 e820map;
	
	// this idea is borrowed from Linux
	struct change_member {
		e820entry *p_entry; // pointer to original entry
		unsigned long long addr; // address for this change point 
	};
}
