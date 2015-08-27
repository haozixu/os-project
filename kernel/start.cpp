#include <boot/multiboot2.h>
#include <kernel/kernel.h>
#include <kernel/icxxabi.h>
#include <kernel/init.h>
#include <kernel/main.hpp>
#include <kernel/debug.hpp>
#include <kernel/log.hpp>
#include <kernel/arch-init.hpp>

extern "C" void __kernel_pre_start(void* mbi_addr, unsigned long arch_data)
{
	kernel::debug::log("[LOG] kernel starting.\n");
	kernel::debug::log_format("Multiboot information found at 0x%llx. arch_data = 0x%llx\n", mbi_addr, arch_data);
	arch::pre_init(arch_data);
	kernel::start();
}


void kernel::start()
{
//	arch::init();

hang:
	goto hang;
}

void kernel::exit(int status)
{
	__cxa_finalize(nullptr);
}

