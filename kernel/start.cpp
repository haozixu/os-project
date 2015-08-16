#include <boot/multiboot2.h>
#include <kernel/kernel.h>

namespace kernel {

	void __noreturn start()
	{
		arch::init();
	#if CONFIG_DEBUG != NO
		debug::partial_init();
	#endif
	}

	void __noreturn exit(int status)
	{
		__cxa_finalize(nullptr);
	}
}
