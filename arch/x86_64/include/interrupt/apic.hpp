/**
 *	@file arch/x86_64/include/interrupt/apic.hpp
 *
 *	@brief xAPIC related stuff.(Advanced Programmable Interrupt Controller)
 */
#pragma once

#include <asm/cpuid.hpp>
#include <kernel/msr.hpp>

namespace ARCH {

namespace apic_reg {
	enum index : unsigned {
		id = 0x20,
		version = 0x30,
		TPR = 0x80,
		APR = 0x90,
		PPR = 0xA0,
		EOI = 0xB0,
		RRD = 0xC0,
		LDR = 0xD0,
		DFR = 0xE0,
		SVR = 0xF0,
		ISR0 = 0x100,
		ISR1 = 0x110,
		ISR2 = 0x120,
		ISR3 = 0x130,
		ISR4 = 0x140,
		ISR5 = 0x150,
		ISR6 = 0x160,
		ISR7 = 0x170,
		TMR0 = 0x180,
		TMR1 = 0x190,
		TMR2 = 0x1A0,
		TMR3 = 0x1B0,
		TMR4 = 0x1C0,
		TMR5 = 0x1D0,
		TMR6 = 0x1E0,
		TMR7 = 0x1F0,
		IRR0 = 0x200,
		IRR1 = 0x210,
		IRR2 = 0x220,
		IRR3 = 0x230,
		IRR4 = 0x240,
		IRR5 = 0x250,
		IRR6 = 0x260,
		IRR7 = 0x270,
		ESR = 0x280, 
		LVT_CMCI = 0x2F0,
		ICR0 = 0x300,
		ICR1 = 0x310,
		LVT_TIMER = 0x320,
		LVT_THERMAL = 0x330,
		LVT_PERFMON = 0x340,
		LVT_LINT0 = 0x350,
		LVT_LINT1 = 0x360,
		LVT_ERROR = 0x370,
		TIMER_ICR = 0x380,
		TIMER_CCR = 0x390,
		TIMER_DCR = 0x3E0,			
	};
}

struct APIC {
  private:
	template<typename T>
	struct value_object {
 		volatile T *ptr;
		
		value_object() = delete;
		value_object(const value_object&) = delete;
		value_object(value_object&&) = default;
		value_object(T* p) : ptr(p) {}
			
		operator T() { return *ptr; }
		T operator()() { return *ptr; }
		void operator=(const value_object&) = delete;
	//	value_object& operator=(value_object&&) = default;
		void operator=(T val) { *ptr = val; }
		void operator&=(T val) { *ptr &= val; }
		void operator|=(T val) { *ptr |= val; }
		
		T read() { return *ptr; }
		void write(T val) { *ptr = val; }
	};
	
	APIC() {}
	
	unsigned long base_addr;
	
  public:
  	APIC(const APIC&) = delete;
	APIC(APIC&&) = default;
	
	value_object<uint64_t> operator[](unsigned offset)
	{
		return value_object<uint64_t>(reinterpret_cast<uint64_t*>(base_addr + offset));
	}
	
	static APIC& instance()
	{
		static APIC __apic;
		return __apic;
	}
		
	// returns the physical address of APIC base
	unsigned long base() const
	{
		return msrs[IA32_APIC_BASE] & ~0xfffUL;
	}

	bool is_bsp() const
	{
		return msrs[IA32_APIC_BASE] & (1UL << 8);
	}
	
	void enable()
	{
		msrs[IA32_APIC_BASE] |= (1UL << 11);
	}
	
	uint8_t initial_id() const
	{
		cpuid_regs regs;
		cpuid(1, regs);
		return static_cast<uint8_t>(regs.ebx >> 24);
	}
	
	void init();

	static constexpr long default_base = 0xfee00000;
};

extern APIC &apic;
}
