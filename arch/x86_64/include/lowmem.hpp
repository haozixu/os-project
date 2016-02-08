/*
 *	arch/x86_64/include/lowmem.hpp
 *
 *	a simple early memory allocator
 */
#pragma once

#include <lib/misc.hpp>

namespace ARCH {
	namespace lowmem {
		constexpr auto LIMIT = 640KiB;
		constexpr auto END_ADDRESS = 0x100000UL;
		
		extern unsigned long free_area;
		
		void init();
		void* alloc(unsigned size);
		void free(unsigned size);
		void* __alloc_pages(unsigned nr_pages);
		void __free_pages(void* addr, unsigned nr_pages); 
		void* __alloc_page();
		void __free_page(void* addr);
		
		template<typename T>
		T* allocate()
		{
			return reinterpret_cast<T*>(alloc(sizeof(T)));
		}
		
		template<typename T>
		void free()
		{
			free(sizeof(T));
		}
		
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
	}
}

