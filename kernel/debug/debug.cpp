/*
 * 	kernel/debug/debug.cpp
 *
 * 	...
 */
#include <kernel/config.h>
#include <kernel/debug.hpp>
#include <arch/io/serial.hpp>

namespace kernel {
namespace debug {

using namespace ARCH;

extern serial_port<serial::COM1> com1;
		
void init() {}
void partial_init()
{
	com1.init();
}

}
}
