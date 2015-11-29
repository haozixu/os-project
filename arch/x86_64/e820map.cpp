/*
 *	arch/x86_64/e820map.cpp
 *
 *	x86 BIOS E820 memory e820map
 */
#include <e820map.hpp>
#include <kernel/init.h>
#include <kernel/logging.hpp>
#include <lib/sort.hpp>

namespace kernel {
namespace memory {
	
	using kernel::debug::log_format;
	#define L log_format
	
	int __init e820map_struct::copy_from_and_sanitize(mmap_entry* old_map, unsigned& nr_entries)
	{
		static change_member change_point_list[E820_MAX * 2] __initdata;
		static change_member *change_point[E820_MAX * 2] __initdata;
		mmap_entry *overlap_list[E820_MAX];
		unsigned i, nr_chg, chgidx;

        // to see if there are any unreasonable entry
		for (i = 0; i < nr_entries; ++i)
			if (old_map[i].addr + old_map[i].len < old_map[i].addr)
				return -1;
		
		for (i = 0; i < 2 * nr_entries; ++i) {
			change_point[i] = &change_point_list[i];
		}
			
		// record all known change-points (starting and ending addresses),
		// omitting those that are for empty memory regions
		chgidx = 0;
		for (i = 0; i < nr_entries; ++i) {
			if (old_map[i].len != 0) {
				change_point[chgidx]->addr = old_map[i].addr;
				change_point[chgidx++]->p_entry = &old_map[i];
				change_point[chgidx]->addr = old_map[i].addr + old_map[i].len;
				change_point[chgidx++]->p_entry = &old_map[i];
			}
		}
		nr_chg = chgidx;

		// sort by address (low -> high)
		lib::sort<change_member*>(change_point, nr_chg, 
			[](change_member* &a, change_member* &b)->int {
				if (a->addr != b->addr)
					return a->addr > b->addr ? 1 : -1;
				return (a->addr != a->p_entry->addr) - (b->addr != b->p_entry->addr);
			});
 
		// create a new bios memory map, removing overlaps
		unsigned overlap_entries = 0,	// number of entries in the overlap table 
			new_entry = 0,				// index for creating new map entries
			current_type = 0,			// current memory type
			last_type = 0;				// start with undefined memory type
		unsigned long last_addr = 0; // start with 0 as last starting address

		// loop through change-points, determining affect on the new bios map
		for (chgidx = 0; chgidx < nr_chg; ++chgidx) {
			// keep track of all overlapping bios entries 
			if (change_point[chgidx]->addr == change_point[chgidx]->p_entry->addr) {
			// add map entry to overlap list (> 1 entry implies an overlap)
				overlap_list[overlap_entries++] = change_point[chgidx]->p_entry;
			} else {
			// remove entry from list (order independent, so swap with last)
				for (i = 0; i < overlap_entries; ++i) {
					if (overlap_list[i] == change_point[chgidx]->p_entry)
						overlap_list[i] = overlap_list[overlap_entries - 1];
				}
				--overlap_entries;
			}

			// if there are overlapping entries, decide which "type" to use 
			// (larger value takes precedence -- 1 = usable, 2,3,4,4+ = unusable
			for (i = 0; i < overlap_entries; ++i)
				if (overlap_list[i]->type > current_type)
					current_type = overlap_list[i]->type;
			// continue building up new bios map based on this information
			if (current_type != last_type) {
				if (last_type != 0) {
					this->map[new_entry].len = change_point[chgidx]->addr - last_addr;
					// move forward only if the new size was non-zero
					if (this->map[new_entry].len != 0)
						if (++new_entry >= E820_MAX)
							break;
				}

				if (current_type != 0) {
					this->map[new_entry].addr = change_point[chgidx]->addr;
					this->map[new_entry].type = current_type;
					last_addr = change_point[chgidx]->addr;
				}
				last_type = current_type;
			}
		}

		this->nr_entries = nr_entries = new_entry;
		
		return 0;
	}
	
	
	int __init e820map_struct::setup()
	{
		int err;
		 
		if (mmap_info.nr_entries < 2) {
			// if there's only one entry, just copy
			this->map[0] = mmap_info.original_map[0];
		} else {
			err = copy_from_and_sanitize(mmap_info.original_map, mmap_info.nr_entries);
		}
		
		if (err)
			return err;
		
		print();
		
		return 0;
		
	}
	
	void e820map_struct::print(const char* who) const
	{
		using kernel::debug::log_format;
		
		log_format("%s provided E820 memory map with %u entries:\n", who, nr_entries);
		for (auto i = 0; i < nr_entries; ++i) {
			log_format("memory [%016lx - %016lx] %s\n",
				map[i].addr,
				map[i].addr + map[i].len - 1,
				type_to_string(map[i].type));
		}
	}
	
	inline const char* e820map_struct::type_to_string(unsigned type)
	{
		switch (type) {
		case E820_AVAILABLE:
			return "available";
			break;
		case E820_ACPI:
			return "ACPI data";
			break;
		case E820_NVS:
			return "ACPI Non-Volatile Storage";
			break;
		case E820_RESERVED:
		default:
			return "reserved";
			break;
		}
	}
	
	mmap_info_struct mmap_info;
	e820map_struct e820map;
}
}
