/*
 *	arch/x86_64/lowmem.cpp
 *
 *	a simple early memory allocator
 */
#include <lowmem.hpp>

#include <kernel/logging.hpp>
#include <lib/bitmap.h>
#include <global.hpp>
#include <e820map.hpp>
#include <pgtable.hpp>

namespace ARCH {
namespace lowmem {

unsigned long free_area;

constexpr auto bits_of_bitmap = align_up(LIMIT / PAGE_SIZE, BITS_PER_LONG);

unsigned long pgalloc_start, end, alloc_current;
unsigned long bitmap[bits_of_bitmap / BITS_PER_LONG];

using ARCH::e820map;

void init()
{	
	auto i = 0;
	auto max_low_start = 0UL;
	
	do {
		if (e820map[i].type() == E820_AVAILABLE) {
			max_low_start = e820map[i].start();
			end = __va(e820map[i].end());
		}
		++i;
	} while (e820map[i].addr() < END_ADDRESS);
	
	if (free_area < max_low_start)
		free_area = max_low_start;
		
	alloc_current = free_area;
	pgalloc_start = free_area + align_up(end - free_area, PAGE_SIZE * 32) / 32;
	
	bitmap_clear_all(bitmap, bits_of_bitmap);
	
	kernel::debug::log_format("lowmem: start: %p, end: %p, page allocation start: %p\n",
		free_area, end, pgalloc_start);
}

void* alloc(unsigned size)
{	
	if (alloc_current + size > pgalloc_start) {
		kernel::debug::log_format("lowmem: alloc() exceed limit!");
		return nullptr;
	}
	auto addr = alloc_current;
	alloc_current += size;
	return reinterpret_cast<void*>(addr);
}


void free(unsigned size)
{
	if (alloc_current - size < free_area) {
		kernel::debug::log_format("lowmem: free() exceed limit!");
		return;
	}
	alloc_current -= size;
}

void* __alloc_page()
{
	size_t first = bitmap_find_first_zero_bit(bitmap);
	if (first >= bits_of_bitmap)
		return nullptr;
	bitmap_set(bitmap, first);
	return reinterpret_cast<void*>(pgalloc_start + first * PAGE_SIZE);	
}

void* __alloc_pages(unsigned nr_pages)
{
	size_t first, limit, total, i, offset = 0;
	unsigned long *bmp;
	
	while (true) {
	loop:
		bmp = bitmap + offset;
		first = bitmap_find_first_zero_bit(bmp);
		if (first >= bits_of_bitmap)
			return nullptr;
		
		i = __which_word(first);
		limit = __builtin_ffsl(bmp[i] & (1 << __which_bit(first)));
		if (limit) {
			if (limit - 1 - __which_bit(first) >= nr_pages) {
				// we have enougn space in this entry
				bitmap_set_bits(bmp, first, nr_pages);
				return reinterpret_cast<void*>(pgalloc_start + 
					(offset * BITS_PER_LONG + first) * PAGE_SIZE);
			}
			// not enough
			total = 0;
		} else {
			// limit not found: the space is usable
			total = BITS_PER_LONG - 1 - __which_bit(first);
			if (total >= nr_pages) {
				bitmap_set_bits(bmp, first, nr_pages);
				return reinterpret_cast<void*>(pgalloc_start + 
					(offset * BITS_PER_LONG + first) * PAGE_SIZE);				
			}
		}
		
		++i;
		while (total < nr_pages) {
			limit = __builtin_ffsl(bmp[i]);
			if (limit) {
				total += limit - 1;
				if (total >= nr_pages) {
					bitmap_set_bits(bmp, first, nr_pages);
					return reinterpret_cast<void*>(pgalloc_start +
						(offset * BITS_PER_LONG + first) * PAGE_SIZE);
				}
				offset += i + 1;
				goto loop;
			}
			total += BITS_PER_LONG;
			++i;
		}
		bitmap_set_bits(bmp, first, nr_pages);
		return reinterpret_cast<void*>(pgalloc_start +
			(offset * BITS_PER_LONG + first) * PAGE_SIZE);
	}
	__builtin_unreachable();
}

void free_page(void* addr)
{
	size_t offset = (align_down(reinterpret_cast<unsigned long>(addr), PAGE_SIZE) - pgalloc_start) / PAGE_SIZE;
	bitmap_clear(bitmap, offset);
}

void free_pages(void* addr, unsigned nr_pages)
{
	size_t offset = (align_down(reinterpret_cast<unsigned long>(addr), PAGE_SIZE) - pgalloc_start) / PAGE_SIZE;
	bitmap_clear_bits(bitmap, offset, nr_pages);
}

}
}
