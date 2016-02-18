/*
 *	arch/x86_64/include/pci.hpp
 *
 *	x86_64 PCI related operations(only) 
 */
#pragma once

#include <ioport.hpp>

namespace ARCH {
	namespace pci {
		constexpr uint16_t CONFIG_ADDRESS = 0xcf8;
		constexpr uint16_t CONFIG_DATA = 0xcfc;
		
		uint32_t config_read(uint8_t bus, uint8_t slot, uint8_t func, uint8_t offset)
		{
			ports_dword[CONFIG_ADDRESS] = uint32_t(0x80000000) |
				(bus << 16) | (slot << 11) | (func << 8) | (offset & 0xfc);
			return ports_dword[CONFIG_DATA];
		}
	}
}
