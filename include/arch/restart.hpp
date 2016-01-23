/*
 *	include/arch/restart.hpp
 *
 *	system restart & hardware reset
 */
#pragma once

#include <restart.hpp> // from arch/$(ARCH)/include/

namespace arch {
	using ARCH::direct_restart;
}