/*
 *	arch/x86_64/acpi.cpp
 *
 *	ACPI -- Advanced Configuration and Power Interface
 */
#include <acpi.hpp>
#include <kernel/init.h>
#include <firmware/bios.hpp>

namespace ARCH {
namespace acpi {

const char RSDP::SIGNATURE[] = "RSD PTR ";
const char RSDT::SIGNATURE[] = "RSDT";
const char MADT::SIGNATURE[] = "APIC";

bool initialized = false;
const RSDP *rsdp;
const RSDT *rsdt;

static void __init init_rest()
{
	rsdp->parse();
	rsdt->parse();
	initialized = true;
}

void __init init(void)
{
	unsigned start = bios_data_area::START;
	do {
		uint64_t *signature = reinterpret_cast<uint64_t*>(__va(start));
		if (*signature == STR_VAL<uint64_t>(RSDP::SIGNATURE)) {
			rsdp = reinterpret_cast<const RSDP*>(signature);
			if (rsdp->is_valid()) {
				init_rest();
				return;
			}
		}
		start += 16;
	} while (start < bios_data_area::END);
	
	start = bda->ebda_segment << 4;
	const unsigned ebda_end = start + 0x400;
	if (start >= bios_data_area::END)
		goto fail;
		
	do {
		uint64_t *signature = reinterpret_cast<uint64_t*>(__va(start));
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

inline bool __init RSDP::is_valid(void) const
{
	uint8_t sum = 0;
	for (int i = 0; i < 20; ++i) {
		sum += reinterpret_cast<const uint8_t*>(this)[i];
	}
	return !bool(sum);
}

inline void __init RSDP::parse(void) const
{
	using kernel::debug::logfl;
	
	logfl("ACPI: RSDP found at %p, oem_id: %s, revision: %u", this, oem_id, revision);
	rsdt = reinterpret_cast<const RSDT*>(__va(this->rsdt_address));
	/*
	 *	we don't bother XSDT because RSDT is always enough on x86 based computers.
	 *	for compatibility reason, ACPI data are always below 4GiB address space,
	 *	so 64-bit XSDT is not needed.
	 */
} 

inline void __init RSDT::parse(void) const
{
	print_info(this);
}

}
}
