/*
 *	kernel/debug/logging.cpp
 *
 *	debug logging
 */
#include <kernel/logging.hpp>
#include <lib/ksprintf.h>
#include <stdarg.h>
#include <serial.hpp>
#include <arch/restart.hpp>
	
namespace kernel {
namespace debug {

using namespace ARCH;
		
serial_port<serial::COM1> com1;
		
void log(const char* str)
{
#if CONFIG_DEBUG != NO
	com1.write(str);
#endif
}

void logl(const char* str)
{
#if CONFIG_DEBUG != NO
	com1.write(str);
	com1.write('\n');
#endif
}
		
void logf(const char* fmt, ...)
{
#if CONFIG_DEBUG != NO 
	char buf[248];
	va_list args;
	
	va_start(args, fmt);
	kvsprintf(buf, fmt, args);
	com1.write("[LOG] ");
	com1.write(buf);
	va_end(args);
#endif
}

void logfl(const char* fmt, ...)
{
#if CONFIG_DEBUG != NO 
	char buf[248];
	va_list args;
	
	va_start(args, fmt);
	kvsprintf(buf, fmt, args);
	com1.write("[LOG] ");
	com1.write(buf);
	com1.write('\n');
	va_end(args);
#endif
}

bool panic(const char* file, const unsigned line, const char* fmt, ...)
{
	char buf[248];
	va_list args;
	
	va_start(args, fmt);
	ksprintf(buf, "[PANIC] in file %s line %u: ", file, line);
	com1.write(buf);
	kvsprintf(buf, fmt, args);
	com1.write(buf);
	va_end(args);
	
	ARCH::direct_restart();
	return false;
}

}
}
