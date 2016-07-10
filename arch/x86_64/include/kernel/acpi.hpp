/*
 *	arch/x86_64/include/kernel/acpi.hpp
 *
 *	ACPI -- Advanced Configuration and Power Interface
 *	x86_64 kernel related ACPI code
 */
#pragma once

#include <lib/misc.hpp>
#include <memory/address.hpp>

#include <stdint.h>
#include <compiler.h>

#define ACPI acpi

namespace ARCH {
	namespace acpi {
		struct table_header {
			char signature[4];	// variable for each table
			uint32_t length;	// whole table length, not this header's length
			uint8_t revision;
			uint8_t checksum;	// whole table checksum
			char oem_id[6];
			char oem_table_id[8];
			uint32_t oem_revision;
			uint32_t creator_id;
			uint32_t creator_revision;
		}__packed;

		// RSDP -- Root System Descriptor Pointer
		struct RSDP {
			char signature[8];	// expected to be "RSD PTR "
			uint8_t checksum;	// the first part checksum
			char oem_id[6];
			uint8_t revision;
			uint32_t rsdt_address;
		/*
		 *	the part below only appears in ACPI version 2.0+
		 *	but we assume that modern PCs are based on higher version of ACPI
		 *	and we must use XSDT instead of RSDT (for ver2.0+)
		 */
			uint32_t length;
			uint64_t xsdt_address;
			uint8_t extended_checksum;
			uint8_t reserved[3];
			
			inline bool is_valid() const;
			inline void parse() const;
			static const char SIGNATURE[9];
		}__packed;
		
		using ARCH::va;
		using ARCH::vptr;
		
		struct RSDT {
			table_header header;
			uint32_t table_pointers[0];
			
			inline void parse() const;
			template<class AcpiTable>
			const AcpiTable* find_table() const
			{
				const uint32_t *start, *end;
				start = vptr<const uint32_t*>(table_pointers);
				end = vptr<const uint32_t*>(table_pointers + (this->header.length / 4));
				while (start < end) {
					unsigned long address = va(*start++);
					if (*vptr<const uint32_t*>(address) == STR_VAL<uint32_t>(AcpiTable::SIGNATURE))
						return vptr<const AcpiTable*>(address);
				}
				return nullptr;
			}
			static const char SIGNATURE[5];
		}__packed;
		
		struct MADT {
			table_header header;
			uint32_t local_apic_address;
			uint32_t flags;
			uint8_t data[0];
			
			struct apic_header {
				enum class type : uint8_t {
					LOCAL_APIC = 0,
					IO_APIC = 1,
					INTERRUPT_SOURCE_OVERRIDE = 2
				} apic_type;
				uint8_t length;	
			}__packed;
			
			struct local_apic {
				apic_header header;
				uint8_t processor_id;
				uint8_t apic_id;
				uint32_t flags;
			}__packed;
			
			struct io_apic {
				apic_header header;
				uint8_t io_apic_id;
				uint8_t reserved;
				uint32_t io_apic_address;
				uint32_t global_system_interrupt_base;
			}__packed;
			
			inline void parse() const;
			static const char SIGNATURE[5];
		}__packed;
		
		struct generic_address_structure {
			uint8_t address_space;
			uint8_t bit_width;
			uint8_t bit_offset;
			uint8_t access_size;
			uint64_t address;
		}__packed;
		
		struct FADT {
			table_header header;
			uint32_t firmware_control;
			uint32_t dsdt;
			
			uint8_t reserved;
			
			uint8_t preferred_pm_profile;
			uint16_t sci_interrupt;
			uint32_t smi_command_port;
			uint8_t acpi_enable;
			uint8_t acpi_disable;
			uint8_t s4bios_req;
			uint8_t pstate_control;
			uint32_t pm1a_event_block;
			uint32_t pm1b_event_block;
			uint32_t pm1a_control_block;
			uint32_t pm1b_control_block;
			uint32_t pm2_control_block;
			uint32_t pm_timer_block;
			uint32_t gpe0_block;
			uint32_t gpe1_block;
			uint8_t pm1_event_length;
			uint8_t pm1_control_length;
			uint8_t pm2_control_length;
			uint8_t pm_timer_length;
			uint8_t gpe0_length;
			uint8_t gpe1_length;
			uint8_t gpe1_base;
			uint8_t cstate_control;
			uint16_t worst_c2_latency;
			uint16_t worst_c3_latency;
			uint16_t flush_size;
			uint16_t flush_stride;
			uint8_t duty_offset;
			uint8_t duty_width;
			uint8_t day_alarm;
			uint8_t month_alarm;
			uint8_t century;
			
			uint16_t boot_architecture_flags;
			
			uint8_t reserved2;
			uint32_t flags;
			
			generic_address_structure reset_register;
			
			uint8_t reset_value;
			uint8_t reserved3[3];
			
			uint64_t x_firmware_control;
			uint64_t x_dsdt;
			generic_address_structure x_pm1a_event_block;
			generic_address_structure x_pm1b_event_block;
			generic_address_structure x_pm1a_control_block;
			generic_address_structure x_pm1b_control_block;
			generic_address_structure x_pm2_control_block;
			generic_address_structure x_pm_timer_block;
			generic_address_structure x_gpe0_block;
			generic_address_structure x_gpe1_block;
			
			static const char SIGNATURE[5];
		};

		void init();
		
		extern bool initialized;
		extern const RSDP *rsdp;
		extern const RSDT *rsdt;
		extern const MADT *madt;
	}
}
