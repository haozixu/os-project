/*
 *	arch/x86_64/include/interrupt/idt.hpp
 *
 *	IDT (Interrput Descriptor Table) related operatios
 */
#pragma once

#include <asm/system.hpp>
#include <kernel/config.h>

namespace ARCH {
	struct IDT {
	  public:	
		using descriptor = gate_t;
		
		// note: descriptors are regarded as value so we pass them by value in functions
		
		IDT(const IDT&) = delete;
		IDT(IDT&&) = default;
		
		static IDT& instance()
		{
			static IDT __idt;
			return __idt;
		}
		
		/*
		 *	set the entry of the given index.
		 *	@idx: the entry index
		 *	@desc: type seg_descriptor or sys_descriptor or some value
		 *	@retval: return false if idx exceeds the limit, otherwise return true
		 *	[warn]: this function DOES NOT GUARANTEE THE ENTRY WILL NOT BE MODIFIED!!
		 */
		template<typename Desc>
		bool set(unsigned idx, Desc desc)
		{
		#if CONFIG_DO_RANGE_CHECK == YES
			if (idx * sizeof(Desc) > size - sizeof(Desc))
				return false;
		#endif
			*reinterpret_cast<Desc*>(base + idx * sizeof(Desc)) = desc;
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
			if (index * sizeof(Desc) > size - sizeof(Desc))
				return -1;
		#endif
			*reinterpret_cast<Desc*>(base + index * sizeof(Desc)) = desc;
			return index++;
		}
		
		template<typename Desc>
		Desc& operator[](unsigned idx)
		{
		#if CONFIG_DO_RANGE_CHECK == YES
			if (idx * sizeof(Desc) > size - sizeof(Desc))
				return -1;
		#endif
			return static_cast<Desc&>(*reinterpret_cast<Desc*>(base + idx * sizeof(Desc)));
		}
		
		void init()
		{
			// do nothing because the work is already done
		}
		
	    static constexpr unsigned long base = 0xffffff0000001800UL;
		static constexpr unsigned size = 2048;
	  private:
	  	IDT() {}
	    unsigned index = 3; // note: index start with 0
	};

	extern IDT &idt;
}
