/*
 *	kernel/debug/log.cpp
 *
 *	debug logging
 */
#include <arch/arch.h>
#include <lib/ksprintf.h>
#include <stdarg.h>

#include <serial.hpp>
	
namespace kernel {
namespace debug {
		
serial_port com1(serial_port::COM1);
serial_port com2(serial_port::COM2);
		
void log(const char* str)
{
	com1.write(str);
}
		
void log_format(const char* fmt, ...)
{
	char buf[248];
	va_list args;
	
	va_start(args, fmt);
	kvsprintf(buf, fmt, args);
	com1.write("[LOG] ");
	com1.write(buf);
	va_end(args);
}

}
}
