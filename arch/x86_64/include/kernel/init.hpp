/*
 *	arch/x86_64/include/kernel/init.hpp
 *
 *	architectural initialization
 */
#pragma once

namespace ARCH {
	void pre_init(unsigned long arch_data);
	void init();
}
