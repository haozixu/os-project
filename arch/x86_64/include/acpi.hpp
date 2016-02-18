/*
 *	arch/x86_64/include/acpi.hpp
 *
 *	ACPI -- Advanced Configuration and Power Interface
 *	x86_64 related ACPI code
 */
#pragma once

#include <stdint.h>
#include <compiler.h>
#include <lib/string.h>
#include <lib/misc.hpp>
#include <kernel/logging.hpp>

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
			
			inline bool is_valid(void) const;
			inline void parse(void) const;
			static const char SIGNATURE[9];
		}__packed;
		
		struct RSDT {
			table_header header;
			uint8_t data[0];
			
			inline void parse(void) const;
			template<class AcpiTable>
			const AcpiTable* find_table() const
			{
				const uint32_t *start, *end;
				start = reinterpret_cast<const uint32_t*>(this->data);
				end = reinterpret_cast<const uint32_t*>(this->data + this->header.length);
				while (start < end) {
					if (*start++ == STR_VAL<uint32_t>(AcpiTable::SIGNATURE))
						return reinterpret_cast<const AcpiTable*>(start);
				}
				return nullptr;
			}
			static const char SIGNATURE[9];
		}__packed;
		
		struct MADT {
			table_header header;
			uint32_t local_apic_address;
			uint32_t flags;
			uint8_t data[0];
			
			static const char SIGNATURE[9];
		}__packed;

		void init(void);
		
		extern bool initialized;
		extern const RSDP *rsdp;
		extern const RSDT *rsdt;
		
		template<class AcpiTable>
		static void print_info(const AcpiTable* table)
		{
			using kernel::debug::logfl;
	
			if (!table) {
				logfl("ACPI: %s dosen't exists!", AcpiTable::SIGNATURE);
				return;
			}
			
			char signature[5], oem_id[7], oem_table_id[9];
	
			memcpy(signature, table->header.signature, 4);
			memcpy(oem_id, table->header.oem_id, 6);
			memcpy(oem_table_id, table->header.oem_table_id, 8);
			signature[4] = oem_id[6] = oem_table_id[8] = '\0';
	
			logfl("ACPI: %s found at %p, length: %u,\n"
				"\t\trevision: %u, oem_id: %s, oem_table_id: %s",
				signature, table, table->header.length,
				table->header.revision, oem_id, oem_table_id);
		}
	}
}
