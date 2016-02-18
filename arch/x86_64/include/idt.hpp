/*
 *	arch/x86_64/include/idt.hpp
 *
 *	IDT (Interrput Descriptor Table) related operatios
 */
#pragma once

#include <asm/system.hpp>

namespace ARCH {
	struct __idt {
		
		/*
		 *	set the entry of the given index.
		 *	@idx: the entry index
		 *	@desc: type segment_desc or system_desc or some value
		 *	@retval: return false if idx exceeds the limit, otherwise return true
		 *	[warn]: this function DOES NOT GUARANTEE THE ENTRY WILL NOT BE MODIFIED!!
		 */
		template<typename Desc>
		bool set(unsigned idx, Desc desc)
		{
		#if CONFIG_DO_RANGE_CHECK == YES
			if (idx * sizeof(Desc) > SIZE - sizeof(Desc))
				return false;
		#endif
			*reinterpret_cast<Desc*>(BASE + idx * sizeof(Desc)) = desc;
			return true;
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
			if (index * sizeof(Desc) > SIZE - sizeof(Desc))
				return -1;
		#endif
			*reinterpret_cast<Desc*>(BASE + index * sizeof(Desc)) = desc;
			return index++;
		}
		
		template<typename Desc>
		Desc& operator[](unsigned idx)
		{
		#if CONFIG_DO_RANGE_CHECK == YES
			if (idx * sizeof(Desc) > SIZE - sizeof(Desc))
				return -1;
		#endif
			return static_cast<Desc&>(*reinterpret_cast<Desc*>(BASE + idx * sizeof(Desc)));
		}
		
		static constexpr unsigned long BASE = 0xffffff0000001800UL;
		static constexpr unsigned SIZE = 2048;
	  private:
	  	unsigned index = 0;

	};

	extern struct __idt idt;
}
