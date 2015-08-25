#include <boot/multiboot2.h>
#include <kernel/kernel.h>
#include <kernel/icxxabi.h>
#include <kernel/init.h>
#include <kernel/main.hpp>
#include <kernel/debug.hpp>
#include <kernel/log.hpp>

extern "C" void __kernel_pre_start(void* mbi_addr, unsigned long extra_data)
{
	// do some work
	kernel::debug::log("Hello World!");
	kernel::start();
}


void kernel::start()
{
//	arch::init();
#if CONFIG_DEBUG != NO
//	debug::partial_init();
#endif

hang:
	goto hang;
}

void kernel::exit(int status)
{
	__cxa_finalize(nullptr);
}

