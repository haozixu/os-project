#include <kernel/kernel.h>
#include <kernel/icxxabi.h>
#include <kernel/init.h>
#include <kernel/main.hpp>
#include <kernel/debug.hpp>
#include <kernel/log.hpp>

#include <arch/init.hpp>

#include <boot/multiboot.hpp>

using namespace kernel;

extern "C" void __kernel_start(unsigned long mbi_addr, unsigned long arch_data)
{
	debug::log("[LOG] kernel starting.\n");
	debug::log_format("multiboot information found at %p, size %u bytes.\n", 
		               mbi_addr, *(uint32_t*)(mbi_addr));
	// architectural pre initialization
	arch::pre_init(arch_data);
	// parse multiboot information
	multiboot2::parse(mbi_addr);
	// init_percpu_section();
	kernel::main();
}


void kernel::main()
{
	arch::init();

hang:
	goto hang;
}

void kernel::exit(int status)
{
	__cxa_finalize(nullptr);
}

