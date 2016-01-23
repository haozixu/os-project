/*
 *	arch/x86_64/include/cpu.hpp
 *
 *	architectural cpu info & processor control block
 */
#pragma once

#include <stdint.h>

namespace ARCH {
	struct cpu_info_struct {
		unsigned nr_processors; // threads
		unsigned nr_cores;
		uint32_t max_cpuid_func_number;
		uint32_t max_cpuid_ext_func_number;
		char vendor_id[12];
		char model_name[48];
	};
}