#include <kernel/kernel.h>
#include <kernel/init.h>
#include <kernel/icxxabi.hpp>
#include <kernel/main.hpp>
#include <kernel/debug.hpp>
#include <kernel/logging.hpp>

#include <arch/init.hpp>

#include <boot/multiboot.hpp>

#include <memory/memmap.hpp>

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
	kernel::main();
}


void kernel::main()
{
	arch::init();
	debug::PANIC("restart.\n");
}

void kernel::exit(int status)
{
	__cxa_finalize(nullptr);
}

