/*
 *	arch/x86_64/include/memory/e820map.hpp
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
// TODO: remove these old style macros?

namespace ARCH {
	using kernel::memory::mmap_entry;
	
	struct e820 {
		struct entry {
		  public:
			entry() = delete;
			entry(mmap_entry* p) : e(p) {}
			
			uint64_t addr() const { return e->addr; }
			uint64_t start() const { return e->addr; }
			uint32_t type() const { return e->type; }
			uint64_t length() const { return e->len; }
			uint64_t end() const { return e->addr + e->len; }
		  private:
		  	mmap_entry *e;
		};

		e820(const e820&) = default; // TODO: to some real copy work here
		e820(e820&&) = default;

		entry operator[](unsigned index) const
		{
			return entry(map + index); // use RVO
		}

		static e820& instance()
		{
			static e820 __e820map;
			return __e820map;
		}
		
		void init(mmap_entry* map, uint32_t nr_entries)
		{
			this->map = map;
			this->nr_entries = nr_entries;
		}
		
		uint32_t num_entries() const
		{
			return nr_entries;
		}
		
		int setup();
		void print(const char* who = "bootloader") const;
	//	int copy_from_and_sanitize(mmap_entry* old_map, uint32_t& nr_entries);
		unsigned long end_address(uint32_t type, unsigned long limit = ~0UL);	
		static inline const char* type_to_string(uint32_t type)
		{
			switch (type) {
			case e820::available:
				return "available";
				break;
			case e820::acpi:
				return "ACPI data";
				break;
			case e820::acpi_nvs:
				return "ACPI Non-Volatile Storage";
				break;
			case e820::reserved:
			default:
				return "reserved";
				break;
			}
		}

		static constexpr uint32_t max_entries = E820_MAX;
		static constexpr uint32_t available = E820_AVAILABLE;
		static constexpr uint32_t reserved = E820_RESERVED;
		static constexpr uint32_t acpi = E820_ACPI;
		static constexpr uint32_t acpi_nvs = E820_NVS;
		
	  private:
	  	e820() {}
	  
	  	uint32_t nr_entries;
	#ifndef LINUX_STYLE_E820
		mmap_entry *map;
	#else
		mmap_entry map[max_entries];
	#endif
	};
		
	extern e820 &e820map;
	
	// this idea is borrowed from Linux
	struct change_member {
		e820::entry *p_entry; // pointer to original entry
		unsigned long addr; // address for this change point 
	};
	// TODO: get rid of this.
}
