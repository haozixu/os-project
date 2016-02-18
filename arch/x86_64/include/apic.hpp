/*
 *	arch/x86_64/include/apic.hpp
 *
 *	xAPIC related stuff.(Advanced Programmable Interrupt Controller)
 */
#pragma once

#include <compiler.h>
#include <pgtable.hpp>
#include <msr.hpp>
#include <asm/cpuid.hpp>

#include <kernel/logging.hpp> // should we really include this?

namespace ARCH {

namespace APIC {
	constexpr unsigned ID = 0x20;
	constexpr unsigned VERSION = 0x30;
	constexpr unsigned TPR = 0x80;
	constexpr unsigned APR = 0x90;
	constexpr unsigned PPR = 0xA0;
	constexpr unsigned EOI = 0xB0;
	constexpr unsigned RRD = 0xC0;
	constexpr unsigned LDR = 0xD0;
	constexpr unsigned DFR = 0xE0;
	constexpr unsigned SVR = 0xF0;
	constexpr unsigned ISR0 = 0x100;
	constexpr unsigned ISR1 = 0x110;
	constexpr unsigned ISR2 = 0x120;
	constexpr unsigned ISR3 = 0x130;
	constexpr unsigned ISR4 = 0x140;
	constexpr unsigned ISR5 = 0x150;
	constexpr unsigned ISR6 = 0x160;
	constexpr unsigned ISR7 = 0x170;
	constexpr unsigned TMR0 = 0x180;
	constexpr unsigned TMR1 = 0x190;
	constexpr unsigned TMR2 = 0x1A0;
	constexpr unsigned TMR3 = 0x1B0;
	constexpr unsigned TMR4 = 0x1C0;
	constexpr unsigned TMR5 = 0x1D0;
	constexpr unsigned TMR6 = 0x1E0;
	constexpr unsigned TMR7 = 0x1F0;
	constexpr unsigned IRR0 = 0x200;
	constexpr unsigned IRR1 = 0x210;
	constexpr unsigned IRR2 = 0x220;
	constexpr unsigned IRR3 = 0x230;
	constexpr unsigned IRR4 = 0x240;
	constexpr unsigned IRR5 = 0x250;
	constexpr unsigned IRR6 = 0x260;
	constexpr unsigned IRR7 = 0x270;
	constexpr unsigned ESR = 0x280;
	constexpr unsigned LVT_CMCI = 0x2F0;
	constexpr unsigned ICR0 = 0x300;
	constexpr unsigned ICR1 = 0x310;
	constexpr unsigned LVT_TIMER = 0x320;
	constexpr unsigned LVT_THERMAL = 0x330;
	constexpr unsigned LVT_PERFMON = 0x340;
	constexpr unsigned LVT_LINT0 = 0x350;
	constexpr unsigned LVT_LINT1 = 0x360;
	constexpr unsigned LVT_ERROR = 0x370;
	constexpr unsigned TIMER_ICR = 0x380;
	constexpr unsigned TIMER_CCR = 0x390;
	constexpr unsigned TIMER_DCR = 0x3E0;
}

struct local_apic {
	static constexpr unsigned long DEFAULT_BASE = 0xfee00000;
	unsigned long base_addr;
	
	// returns the physical address of APIC base
	unsigned long base(void)
	{
		return msrs[IA32_APIC_BASE] & ~0xfffUL;
	}

	bool is_bsp(void)
	{
		return msrs[IA32_APIC_BASE] & (1UL << 8);
	}
	
	void enable(void)
	{
		msrs[IA32_APIC_BASE] |= (1UL << 11);
	}
	
	uint8_t initial_id(void)
	{
		cpuid_regs regs;
		cpuid(1, regs);
		return static_cast<uint8_t>(regs.ebx >> 24);
	}
	
	void init(void) // should we put this elsewhere?
	{
		using kernel::debug::logfl;
		
		unsigned long __base = this->base();
		
		this->enable();
		logfl("Local APIC [%s id: 0x%x] physical base: %p",
			this->is_bsp() ? "BSP" : "AP",
			this->initial_id(),
			__base);
		base_addr = __va(__base);
	}
	
	template<typename T>
	struct value_object {
		volatile T *ptr;
		
		value_object() = delete;
		value_object(T* p) : ptr(p) {}
			
		operator T() { return *ptr; }
		T operator()() { return *ptr; }
		T read() { return *ptr; }
		void write(T val) { *ptr = val; }
		void operator=(const value_object&) = delete;
		void operator=(T val) { *ptr = val; }
		void operator&=(T val) { *ptr &= val; }
		void operator|=(T val) { *ptr |= val; }
	};
	
	value_object<uint64_t> operator[](unsigned offset)
	{
		return value_object<uint64_t>(reinterpret_cast<uint64_t*>(base_addr + offset));
	}
};

extern struct local_apic apic;

}
