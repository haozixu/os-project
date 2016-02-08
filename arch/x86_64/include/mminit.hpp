/*
 *	arch/x86_64/include/mminit.hpp
 *
 *	memory management initialization
 */
#pragma once

#include <stdint.h>
#include <stddef.h>
#include <compiler.h>

#include <pgtable.hpp>

namespace ARCH {

	struct mapping_info {
		unsigned long paddr;
		unsigned long vaddr;
		uint64_t page_attr; 
		// page_attr = page_size | bit0: cache disable | bit1: global
		size_t nr_pages;
		
		void fixed_set(unsigned long start, unsigned long end, uint64_t attr)
		{
			paddr = start;
			vaddr = __va(start);
			page_attr = attr;
			nr_pages = (end - start) / (attr & PAGE_MASK);
		}
	};
	
	struct __fixed_mapping {
		mapping_info* mapinfo;
		int count;
	};
	extern __fixed_mapping fixed_mapping;

	void init_memory_mapping();
	void split_mapping_range(mapping_info* mi, int& nr_mapinfo,
								unsigned long start, unsigned long end, unsigned extra_attr);
}
