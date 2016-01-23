/*
 * 	kernel/debug/debug.cpp
 *
 * 	...
 */
#include <kernel/config.h>
#include <kernel/debug.hpp>
#include <serial.hpp>

namespace kernel {
namespace debug {

using ARCH::serial_port;
using ARCH::serial;

extern serial_port<serial::COM1> com1;
		
void init() {}
void partial_init()
{
	com1.init();
}

}
}
