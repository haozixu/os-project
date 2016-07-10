#include <kernel/kernel.h>
#include <kernel/init.h>
#include <kernel/icxxabi.hpp>
#include <kernel/debug.hpp>
#include <kernel/logging.hpp>

#include <arch/kernel/init.hpp>

#include <boot/multiboot.hpp>

#include <memory/memmap.hpp>

#include <lib/string.h>

using namespace kernel;

namespace kernel {
	int main();
	void exit(int status);
}

static void __initialize_bss_section()
{
	memset(&_bss, 0, &_ebss - &_bss);
}

extern "C" void __kernel_start(unsigned long mbi_addr, unsigned long arch_data)
{
	debug::log("[LOG] kernel starting.\n");
	debug::logfl("multiboot information found at %p, size %u bytes.", 
		               mbi_addr, *(uint32_t*)(mbi_addr));
	__initialize_bss_section();
	// architectural pre initialization
	ARCH::pre_init(arch_data);
	// parse multiboot information
	multiboot2::parse(mbi_addr);
	kernel::main();
}


int kernel::main()
{
	ARCH::init();
	exit(0);
	return 0;
}

void kernel::exit(int status)
{
	debug::PANIC("kernel exiting. restart.\n");
	__cxa_finalize(nullptr);
}

