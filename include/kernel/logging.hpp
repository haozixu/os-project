/*
 *	include/kernel/logging.hpp
 *
 *	debug logging
 */
#pragma once

#include <kernel/config.h>

#define PANIC(format, ...) panic(__FILE__, __LINE__, format, ##__VA_ARGS__)

#if CONFIG_DEBUG == YES
#define VLOG(format, ...) logfl(format, ##__VA_ARGS__)
#else
#define VLOG(format, ...)
#endif

namespace kernel {
	namespace debug {
		void log(const char*);
		void logl(const char*);
		void logf(const char*, ...);
		void logfl(const char*, ...);
		bool panic(const char*, const unsigned, const char*, ...);
	}
}

