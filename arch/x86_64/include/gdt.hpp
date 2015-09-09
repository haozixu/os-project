/*
 *	arch/x86_64/include/gdt.hpp
 *
 *	...
 */
#pragma once

#include <asm/system.h>
#include <kernel/config.h>

namespace arch {
	__always_inline void lgdt(uint16_t size, unsigned long addr)
	{
		__lgdt(size, addr);
	}
	
	__always_inline void lgdt(const dt_ptr& desc_ptr)
	{
		__lgdt_p(&desc_ptr);
	}
	
	struct gdt_struct {	
		using segment_desc = descriptor_t;
		using system_desc = ldttss_desc_t;
		
		/*
		 *	set the entry of the given index.
		 *	@idx/sys_idx: the index(meaning is different for different entry type)
		 *	@desc: type segment_desc or system_desc
		 *	@retval: return -1 if idx exceed the limit, otherwise return 0
		 *	[warn]: this function DOES NOT GUARANTEE THE ENTRY WILL NOT BE MODIFIED!!
		 */
		int set(unsigned idx, segment_desc desc)
		{
		#if CONFIG_DO_RANGE_CHECK == YES
			if ((idx + 1) * 8 > (2048 - system_index * 16))
				return -1;
		#endif
			*reinterpret_cast<segment_desc*>(base + idx * 8) = desc;
			return 0;
		}
		
		int set(unsigned sys_idx, system_desc desc)
		{
		#if CONFIG_DO_RANGE_CHECK == YES
			if ((2048 - (sys_idx + 1) * 16) < index * 8)
				return -1;
		#endif
			*reinterpret_cast<system_desc*>(base + 2048 - (sys_idx + 1) * 16) = desc;
			return 0;
		}
		
		/*
		 *	append an entry.
		 *	@desc: the entry
		 *	@retval: return -1 if exceed the limit, otherwise return the index of the appended entry
		 */
		int append(segment_desc desc)
		{
		#if CONFIG_DO_RANGE_CHECK == YES
			if ((index + 1) * 8 > (2048 - system_index * 16))
				return -1;
		#endif
			*reinterpret_cast<segment_desc*>(base + index * 8) = desc;
			return index++;
		}
		
		int append(system_desc desc)
		{
		#if CONFIG_DO_RANGE_CHECK == YES
			if ((2048 - (system_index + 1) * 16) < index * 8)
				return -1;
		#endif
			*reinterpret_cast<system_desc*>(base + 2048 - (system_index + 1) * 16) = desc;		
			return system_index++;
		}
		
		segment_desc& operator[](unsigned idx)
		{
		#if CONFIG_DO_RANGE_CHECK == YES
			if ((idx + 1) * 8 > (2048 - system_index * 16))
				return -1;
		#endif
			return static_cast<segment_desc&>(*reinterpret_cast<segment_desc*>(base + idx * 8));
		}
		// sys_idx(-1) <==> system_index(0)
		// sys_idx(-2) <==> system_index(1)
		// sys_idx(x)  <==> system_index(~x)
		system_desc& operator[](signed sys_idx)
		{
		#if CONFIG_DO_RANGE_CHECK == YES
			if ((2048 + sys_idx * 16) < index * 8)
				return -1;
		#endif
			return static_cast<system_desc&>(*reinterpret_cast<system_desc*>(base + 2048 + sys_idx * 16));			
		}
		
		void init()
		{
			// do nothing because the work is already done
		}
	  private:
	    const unsigned long base = 0xffffff0000001000;
	    unsigned index = 3; // note: index start with 0
		unsigned system_index = 0;
	};
}