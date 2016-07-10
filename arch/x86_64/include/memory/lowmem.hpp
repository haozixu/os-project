/**
 *	@file arch/x86_64/include/memory/lowmem.hpp
 *
 *	@brief a simple early memory allocator
 */
#pragma once

#include <lib/misc.hpp>

namespace ARCH {
	namespace lowmem {
		constexpr auto limit = 640KiB;
		constexpr auto end_address = 0x100000UL;
		
		extern unsigned long free_area;
		
		void init();
		void* __alloc_page();
		void* __alloc_pages(unsigned nr_pages);
		void __free_pages(void* page_addr); 
		
		template<typename T>
		T* alloc_pages(unsigned nr_pages)
		{
			return reinterpret_cast<T*>(__alloc_pages(nr_pages));
		}
		
		template<typename T>
		T* alloc_page()
		{
			return reinterpret_cast<T*>(__alloc_page());
		}
		
		template<typename T>
		void free_pages(T* page_addr)
		{
			__free_pages(static_cast<void*>(page_addr));
		}
	}
}

