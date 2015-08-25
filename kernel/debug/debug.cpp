/*
 * kernel/debug/debug.cpp
 *
 * ...
 */
#include <kernel/config.h>
#include <kernel/debug.hpp>
#include <serial.hpp>

namespace kernel {
	namespace debug {
		extern serial_port com1;
		
		void init() {}
		void partial_init()
		{
			com1.init(serial_port::COM1);
		}
	}
}
