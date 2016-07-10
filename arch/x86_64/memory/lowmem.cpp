/**
 *	@file arch/x86_64/lowmem.cpp
 *
 *	@brief a simple early memory allocator
 */
#include <memory/lowmem.hpp>
#include <memory/e820map.hpp>
#include <memory/pgtable.hpp>

#include <kernel/logging.hpp>
#include <kernel/init.h>
#include <compiler.h>

namespace ARCH {
namespace lowmem {

constexpr auto max_pages = limit / PAGE_SIZE;

unsigned long free_area, alloc_base;
uint8_t record[max_pages] = {0};
unsigned total_pages, next_index;
bool first_round = true;
	
using ARCH::e820map;

void __init init()
{	
	auto i = 0;
	auto max_low_start = 0UL, alloc_limit = 0UL;
	
	do {
		if (e820map[i].type() == e820::available) {
			max_low_start = e820map[i].start();
			alloc_limit = va(e820map[i].end());
		}
		++i;
	} while (e820map[i].addr() < end_address);
	
	if (free_area < max_low_start)
		free_area = max_low_start;
		
	alloc_base = align_up(free_area, PAGE_SIZE);
	alloc_limit = align_down(alloc_limit, PAGE_SIZE);
	total_pages = (alloc_limit - alloc_base) / PAGE_SIZE; 
	
	kernel::debug::logfl("lowmem: %d pages available. page allocation base: %p",
		total_pages, alloc_base);
}

void* __alloc_page()
{
	auto i = next_index;
	while (i < total_pages) {
		if (likely(record[i] == 0)) {
			record[i] = 1;
			next_index = i + 1;
			return vptr<void*>(alloc_base + i * PAGE_SIZE);
		} else {
			i += record[i];
		}
	}

	i = 0;
	while (i < next_index) {
		if (record[i] == 0) {
			record[i] == 1;
			next_index = i + 1;
			return vptr<void*>(alloc_base + i * PAGE_SIZE);
		} else {
			i += record[i];
		}
	}

	return nullptr;
}

void* __alloc_pages(unsigned nr_pages)
{
	if (unlikely(nr_pages > total_pages))
		return nullptr;
	if (unlikely(nr_pages == 1))
		return __alloc_page();

	auto i = next_index;
	while (i < total_pages) {
		if (likely(record[i] == 0)) {
			if (likely(first_round)) {
				if (unlikely(i + nr_pages >= total_pages))
					goto start_over;
				record[i] = nr_pages;
				next_index = i + nr_pages;
				return vptr<void*>(alloc_base + i * PAGE_SIZE);
			} else {
				auto j = i + 1;
				while (j < i + nr_pages) {
					if (record[j] != 0 || j >= total_pages) {
						i = j + record[j];
						goto loop1_end;
					}
					++j;
				}
				record[i] = nr_pages;
				next_index = i + nr_pages;
				return vptr<void*>(alloc_base + i * PAGE_SIZE);
			}
		} else {
			i += record[i];
		}
	loop1_end: ;
	}
start_over:
	first_round = false, i = 0;
	while (i < next_index) {
		if (record[i] == 0) {
			auto j = i + 1;
			while (j < i + nr_pages) {
				if (record[j] != 0 || j >= total_pages) {
					i = j + record[j];
					goto loop2_end;
				}
				++j;
			}
			record[i] = nr_pages;
			next_index = i + nr_pages;
			return vptr<void*>(alloc_base + i * PAGE_SIZE);
		} else {
			i += record[i];
		}
	loop2_end: ;
	}

	return nullptr;
}


void __free_pages(void* page_addr)
{
	auto addr = reinterpret_cast<unsigned long>(page_addr);
	if (addr % PAGE_SIZE != 0)
		return;
	record[(addr - alloc_base) / PAGE_SIZE] = 0;
}

}
}
