/*
 *	kernel/debug/log.cpp
 *
 *	debug logging
 */
#include <arch/arch.h>

#ifdef __x86_64__
#include <serial.hpp>
#endif	
	
namespace kernel {
	namespace debug {
		serial_port com1(serial_port::COM1);
		
		void log(const char* str)
		{
			com1.write(str);
		}
		
		void log_format() {}
	}
}
