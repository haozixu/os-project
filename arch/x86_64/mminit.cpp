/*
 *	arch/x86_64/mminit.cpp
 *
 *	memory management initialization
 */
#include <mminit.hpp>
#include <lowmem.hpp>
#include <e820map.hpp>

#include <asm/paging.hpp>
#include <lib/algorithm.hpp>
#include <lib/misc.hpp>
#include <lib/string.h>
#include <kernel/init.h>
#include <kernel/logging.hpp>

namespace ARCH {

__fixed_mapping fixed_mapping;

static inline unsigned e820type_to_fixed_attr(uint32_t type)
{
	return 2 | (((type == e820::RESERVED) | (type == e820::ACPI_NVS)) ? 1 : 0);
}

static inline const char* page_size_to_string(unsigned size)
{
	if (size == 1GiB)
		return "1GiB";
	if (size == 2MiB)
		return "2MiB";
	return "4KiB";
}

void __init init_memory_mapping()
{
//	unsigned long map_end = 
//		lib::max(e820map.end_address(e820::AVAILABLE), e820map.end_address(e820::RESERVED));
	
	// allocate space for mapping info
	fixed_mapping.mapinfo = lowmem::alloc_page<mapping_info>();
	fixed_mapping.count = 0;
	
	for (auto i = 0; i < e820map.nr_entries; ++i) {
	//	if (unlikely(e820map[i].end() >= map_end))
	//		break;

		split_mapping_range(fixed_mapping.mapinfo, fixed_mapping.count,
			e820map[i].start(), e820map[i].end(), 
			e820type_to_fixed_attr(e820map[i].type()));
	}
	
}

void __init split_mapping_range(mapping_info* mi, int& nr_mapinfo,
								unsigned long start, unsigned long end, unsigned extra_attr)
{
	unsigned long addr, limit;
	int i, oldval = nr_mapinfo;

	addr = start = align_down(start, PAGE_SIZE);
	limit = align_down(end, PAGE_SIZE);

	// head: if not 2M page aligned, use 4K page
	end = align_up(addr, LARGE_PAGE_SIZE);
	if (end > limit)
		end = limit;
	if (start < end) {
		mi[nr_mapinfo++].fixed_set(start, end, PAGE_SIZE | extra_attr);
		addr = end;
	}
	
	// 2M page range 
	start = align_up(addr, LARGE_PAGE_SIZE);
	end = align_up(addr, HUGE_PAGE_SIZE);
	if (end > align_down(limit, LARGE_PAGE_SIZE))
		end = align_down(limit, LARGE_PAGE_SIZE);
	if (start < end) {
		mi[nr_mapinfo++].fixed_set(start, end, LARGE_PAGE_SIZE | extra_attr);
		addr = end;
	}
	
	// 1G page range
	start = align_up(addr, HUGE_PAGE_SIZE);
	end = align_down(limit, HUGE_PAGE_SIZE);
	if (start < end) {
		mi[nr_mapinfo++].fixed_set(start, end, HUGE_PAGE_SIZE | extra_attr);
		addr = end;
	}
	
	// tail is not 1G alignment
	start = align_up(addr, LARGE_PAGE_SIZE);
	end = align_down(limit, LARGE_PAGE_SIZE);
	if (start < end) {
		mi[nr_mapinfo++].fixed_set(start, end, LARGE_PAGE_SIZE | extra_attr);
		addr = end;
	}
	
	// tail is not 2M alignment
	start = addr;
	end = limit;
	if (start < end) {
		mi[nr_mapinfo++].fixed_set(start, end, PAGE_SIZE | extra_attr);
	}
	
	for (i = 0; nr_mapinfo > 1 && i < nr_mapinfo - 1; ++i) {
		if ((mi[i].vaddr + mi[i].nr_pages * (mi[i].page_attr & PAGE_MASK))
			!= mi[i + 1].vaddr || mi[i].page_attr != mi[i + 1].page_attr)
			continue;
			
		mi[i + 1].paddr = mi[i].paddr;
		mi[i + 1].vaddr = mi[i].vaddr;
		mi[i + 1].nr_pages += mi[i].nr_pages;	
		memmove(&mi[i], &mi[i + 1], (nr_mapinfo - 1 - i) * sizeof(mi[i]));
		--i, --nr_mapinfo;		
	}
	
	for (i = oldval; i < nr_mapinfo; ++i) {
		kernel::debug::log_format("memory mapping [%016lx - %016lx) %s page\n",
			mi[i].vaddr, mi[i].vaddr + mi[i].nr_pages * (mi[i].page_attr & PAGE_MASK),
			page_size_to_string(static_cast<unsigned>(mi[i].page_attr & PAGE_MASK)));
	}
}

}
