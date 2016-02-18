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

	struct mapping_descriptor {
		unsigned long phys_addr;
		unsigned long virt_addr;
		uint64_t page_attr; // page_attr = page_size | bit0: cache disable
		size_t nr_pages;
		
		unsigned long phys_end() const
		{
			return phys_addr + nr_pages * (page_attr & PAGE_MASK);
		}
		
		unsigned long virt_end() const
		{
			return virt_addr + nr_pages * (page_attr & PAGE_MASK);
		}
		
		void fixed_set(unsigned long start, unsigned long end, uint64_t attr)
		{
			phys_addr = start;
			virt_addr = __va(start);
			page_attr = attr;
			if (start < end) {
				size_t nr_pages = (end - start) / (attr & PAGE_MASK);
				this->nr_pages = (nr_pages != 0) ? nr_pages : 1;
			} else {
				this->nr_pages = 0;
			}
		}
		
		void set(unsigned long pa, unsigned long va, uint64_t attr, size_t nr_pages)
		{
			phys_addr = pa;
			virt_addr = va;
			page_attr = attr;
			this->nr_pages = nr_pages;
		}
		
	};
	
	struct __fixed_mapping_info {
		mapping_descriptor* descs;
		unsigned count;
		
		static constexpr auto MAX_NR_DESCS = PAGE_SIZE / sizeof(mapping_descriptor);
		
		inline void print() const;
		inline int insert(unsigned index, const mapping_descriptor& md);
		inline int remove(unsigned index);
		inline void replace(const mapping_descriptor& md);
		
	};
	extern __fixed_mapping_info fixed_mapping_info;

	void init_memory_mapping();
	static void init_kernel_physical_mapping();
	static void split_mapping_range(mapping_descriptor* md, unsigned& nr_mapinfo,
								unsigned long start, unsigned long end, unsigned extra_attr);
}
