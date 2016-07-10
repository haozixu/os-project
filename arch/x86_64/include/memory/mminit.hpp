/*
 *	arch/x86_64/include/memory/mminit.hpp
 *
 *	memory management initialization
 */
#pragma once

#include <memory/pgtable.hpp>

#include <compiler.h>
#include <stddef.h>
#include <stdint.h>

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
			virt_addr = va(start);
			page_attr = attr;
			if (start < end) {
				size_t nr_pages = (end - start) / (attr & PAGE_MASK);
				this->nr_pages = (nr_pages != 0) ? nr_pages : 1;
			} else {
				this->nr_pages = 0;
			}
		}
		
		void set(unsigned long paddr, unsigned long vaddr, uint64_t attr, size_t nr_pages)
		{
			phys_addr = paddr;
			virt_addr = vaddr;
			page_attr = attr;
			this->nr_pages = nr_pages;
		}
		
	};
	
	struct fixed_mapping_info_t {
		mapping_descriptor* descs;
		unsigned count;
		
		static constexpr auto max_descs = PAGE_SIZE / sizeof(mapping_descriptor);
		
		inline void print() const;
		inline int insert(unsigned index, const mapping_descriptor& md);
		inline int remove(unsigned index);
		inline void replace(const mapping_descriptor& md);
		
	};
	extern fixed_mapping_info_t fixed_mapping_info;

	void init_memory_mapping();
	static void init_kernel_physical_mapping();
	static void split_mapping_range(mapping_descriptor* md, unsigned& nr_mapinfo,
								unsigned long start, unsigned long end, unsigned extra_attr);
}
