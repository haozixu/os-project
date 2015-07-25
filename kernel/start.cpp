#include <boot/multiboot2.h>
#include <kernel/kernel.h>
#include <namespace/kernel.hpp>

extern "C" __noreturn  void startup()
{
	kernel::start();
}

void __noreturn kernel::start()
{
	//...

	int retcode = kernel::main();
	kernel::exit(retcode);
}

void __noreturn kernel::exit(int status)
{
	__cxa_finalize(nullptr);
}

