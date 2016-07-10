/**
 *	@file arch/x86_64/kernel/acpi.cpp
 *
 *	@brief ACPI -- Advanced Configuration and Power Interface (kernel support)
 */
#include <kernel/acpi.hpp>
#include <interrupt/ioapic.hpp>
#include <kernel/init.h>
#include <kernel/logging.hpp>
#include <firmware/bios.hpp>
#include <lib/string.h>

namespace ARCH {
namespace acpi {

const char RSDP::SIGNATURE[] = "RSD PTR ";
const char RSDT::SIGNATURE[] = "RSDT";
const char MADT::SIGNATURE[] = "APIC";
const char FADT::SIGNATURE[] = "FACP";

bool initialized = false;
const RSDP *rsdp;
const RSDT *rsdt;
const MADT *madt;

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
		
static void __init init_rest()
{
	rsdp->parse();
	rsdt->parse();
	madt->parse();
	initialized = true;
}

void __init init()
{
	unsigned start = bios_data_area::start;
	do {
		uint64_t *signature = vptr<uint64_t*>(va(start));
		if (*signature == STR_VAL<uint64_t>(RSDP::SIGNATURE)) {
			rsdp = reinterpret_cast<const RSDP*>(signature);
			if (rsdp->is_valid()) {
				init_rest();
				return;
			}
		}
		start += 16;
	} while (start < bios_data_area::end);
	
	start = bda->ebda_segment << 4;
	const unsigned ebda_end = start + 0x400;
	if (start >= bios_data_area::end)
		goto fail;
		
	do {
		uint64_t *signature = vptr<uint64_t*>(va(start));
		if (*signature == STR_VAL<uint64_t>(RSDP::SIGNATURE)) {
			rsdp = reinterpret_cast<const RSDP*>(signature);
			if (rsdp->is_valid()) {
				init_rest();
				return;
			}
		}
		start += 16;
	} while (start < ebda_end);
	
fail:
	kernel::debug::logfl("ACPI: initialization failed.");
}

inline bool __init RSDP::is_valid() const
{
	uint8_t sum = 0;
	for (int i = 0; i < 20; ++i) {
		sum += reinterpret_cast<const uint8_t*>(this)[i];
	}
	return !bool(sum);
}

inline void __init RSDP::parse() const
{
	using kernel::debug::logfl;
	
	logfl("ACPI: RSDP found at %p, oem_id: %s, revision: %u", this, oem_id, revision);
	rsdt = vptr<const RSDT*>(va(this->rsdt_address));
	/*
	 *	we don't bother XSDT because RSDT is always enough on x86 based computers.
	 *	for compatibility reason, ACPI data are always below 4GiB address space,
	 *	so 64-bit XSDT is not needed.
	 */
} 

inline void __init RSDT::parse() const
{
	print_info(this);
	madt = find_table<MADT>();
}

inline void __init MADT::parse() const
{
	using kernel::debug::logfl;
	print_info(this);
	logfl("ACPI: MADT: Local APIC address: %p", this->local_apic_address);

	const uint8_t *start, *end;
	start = this->data;
	end = this->data + this->header.length;

	while (start < end) {
		const apic_header *apic_hdr = reinterpret_cast<decltype(apic_hdr)>(start);
		
		switch (apic_hdr->apic_type) {
		case apic_header::type::LOCAL_APIC:
			{
				const local_apic *lapic = reinterpret_cast<decltype(lapic)>(apic_hdr);
				logfl("ACPI: processor found: id: 0x%x, apic_id: 0x%x",
					lapic->processor_id, lapic->apic_id);
			}
			break;
		case apic_header::type::IO_APIC:
			{
				const io_apic *ioapic = reinterpret_cast<decltype(ioapic)>(apic_hdr);
				logfl("ACPI: IO APIC found: id: 0x%x, address: %p",
					ioapic->io_apic_id, ioapic->io_apic_address);
				ARCH::io_apic.set_base(ioapic->io_apic_address);
			}
			break;
		case apic_header::type::INTERRUPT_SOURCE_OVERRIDE:
			break;
		default:
			logfl("ACPI: unknown apic information. type: %d, length: %d",
				apic_hdr->apic_type, apic_hdr->length);
			break;
		}
		start += apic_hdr->length;
	}
}

}
}
