/**
 *	@file arch/x86_64/kernel/global.cpp
 *
 *	@brief kernel global data
 */
#include <cpu/cpu.hpp>
#include <interrupt/apic.hpp>
#include <interrupt/ioapic.hpp>
#include <io/ports.hpp>
#include <kernel/gdt.hpp>

namespace ARCH {

struct APIC &apic = APIC::instance();
struct IO_APIC &io_apic = IO_APIC::instance();
struct GDT &gdt = GDT::instance();
struct cpu_info_block cpu_info;
ports<uint8_t> ports_byte;
ports<uint16_t> ports_word;
ports<uint32_t> ports_dword;

}
