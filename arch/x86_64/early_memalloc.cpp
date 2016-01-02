/*
 *	arch/x86_64/early_memalloc.cpp
 *
 *	asimple early memory allocator
 */
#include <early_memalloc.hpp>
#include <global.hpp>
#include <e820map.hpp>
#include <kernel/logging.hpp>
#include <paging-const.h>

namespace arch {
namespace early_memalloc {

unsigned long alloc_start = 0, alloc_end = 0, alloc_current = 0;

void init()
{
	using kernel::memory::e820map;
	
	auto i = 0, max_low_start = 0;
	
	do {
		if (e820map[i].type() == E820_AVAILABLE) {
			max_low_start = e820map[i].start();
			alloc_end = e820map[i].end() + PAGE_OFFSET;
		}
		++i;
	} while (e820map[i].addr() < 0x100000);
	
	if (low_free_area < max_low_start)
		low_free_area = max_low_start;
		
	alloc_start = alloc_current = low_free_area;
	
	kernel::debug::log_format("early_memalloc: start: %p, end: %p\n", alloc_start, alloc_end);
}

void* alloc(unsigned size)
{	
	if (alloc_current + size > alloc_end) {
		kernel::debug::PANIC("early_memalloc: alloc() exceed limit!");
	}
	auto addr = alloc_current;
	alloc_current += size;
	return reinterpret_cast<void*>(addr);
}


void free(unsigned size)
{
	if (alloc_current - size < alloc_start) {
		kernel::debug::PANIC("early_memalloc: free() exceed limit!");
	}
	alloc_current -= size;
}

}
}
