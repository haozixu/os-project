/*
 *	kernel/debug/log.cpp
 *
 *	debug logging
 */
#ifdef __x86_64__
#include <../arch/x86_64/include/serial.hpp>
#endif	
	
namespace kernel {
	namespace debug {
		serial_port com1(serial_port::COM1);
		
		void log(char* str)
		{
			com1.write(str);
		}
		
		void log_format() {}
	}
}