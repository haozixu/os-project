/*
 *	arch/x86_64/include/gdt.hpp
 *
 *	Global Descriptor Table
 */
#pragma once

#include <kernel/config.h>

#include <asm/system.hpp>

namespace ARCH {
	static __always_inline void lgdt(uint16_t size, unsigned long addr)
	{
		__lgdt(size, addr);
	}
	
	static __always_inline void lgdt(const dt_ptr& desc_ptr)
	{
		__lgdt(&desc_ptr);
	}
	
	struct gdt_struct {	
		using segment_desc = descriptor_t;
		using system_desc = ldttss_desc_t;
		
		/*
		 *	set the entry of the given index.
		 *	@idx/sys_idx: the index(meaning is different for different entry type)
		 *	@desc: type segment_desc or system_desc or some value
		 *	@retval: return -1 if idx exceed the limit, otherwise return 0
		 *	[warn]: this function DOES NOT GUARANTEE THE ENTRY WILL NOT BE MODIFIED!!
		 */
		template<typename Desc>
		int set(unsigned idx, Desc desc)
		{
		#if CONFIG_DO_RANGE_CHECK == YES
			if (idx * 8 > 2040)
				return -1;
		#endif
			*reinterpret_cast<Desc*>(base + idx * 8) = desc;
			return 0;
		}
		
		/*
		 *	append an entry.
		 *	@desc: the entry
		 *	@retval: return -1 if exceed the limit, otherwise return the index of the appended entry
		 */
		template<typename Desc>
		int append(Desc desc)
		{
		#if CONFIG_DO_RANGE_CHECK == YES
			if (index * 8 > 2040)
				return -1;
		#endif
			*reinterpret_cast<Desc*>(base + index * 8) = desc;
			return index++;
		}
		
		template<typename Desc>
		Desc& operator[](unsigned idx)
		{
		#if CONFIG_DO_RANGE_CHECK == YES
			if (idx * 8 > 2040)
				return -1;
		#endif
			return static_cast<Desc&>(*reinterpret_cast<Desc*>(base + idx * 8));
		}
		
		void init()
		{
			// do nothing because the work is already done
		}
		
	    static constexpr unsigned long base = 0xffffff0000001000UL;
	  private:
	    unsigned index = 3; // note: index start with 0
	};

	extern gdt_struct gdt;
}
