/*
 *	arch/x86_64/global.cpp
 *
 *	global data
 */
#include <global.hpp>

/*
 *	WARNING: This file will be deprecated soon.
 */

namespace ARCH {

lib::spinlock data_lock;
struct local_apic apic;
struct __gdt gdt;
struct __cpu_info cpu_info;
ports<uint8_t> ports_byte;
ports<uint16_t> ports_word;
ports<uint32_t> ports_dword;

}
