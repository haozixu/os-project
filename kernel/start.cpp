#include <boot/multiboot2.h>
#include <kernel/kernel.h>
#include <kernel/icxxabi.h>
#include <kernel/log.hpp>

extern "C" void __kernel_pre_start()
{
	kernel::debug::log("Hello World!");
hang:
	goto hang;
}

namespace kernel {

	void __noreturn start()
	{
	//	arch::init();
	#if CONFIG_DEBUG != NO
	//	debug::partial_init();
	#endif
	}

	void __noreturn exit(int status)
	{
		__cxa_finalize(nullptr);
	}
}
