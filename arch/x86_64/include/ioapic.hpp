/*
 *	arch/x86_64/include/ioapic.hpp
 *
 *	IO APIC related operations
 */
#pragma once

namespace ARCH {

struct io_apic {
	static constexpr unsigned long DEFAULT_BASE = 0xfec00000;
	
	unsigned long base(void)
	{
		
	}		
};
	
extern struct io_apic ioapic;

}
