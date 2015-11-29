/*
 *	include/kernel/logging.hpp
 *
 *	debug logging
 */
#pragma once

#define PANIC(format, ...) panic(__FILE__, __LINE__, format, ##__VA_ARGS__)

namespace kernel {
	namespace debug {
		void log(const char*);
		void log_format(const char*, ...);
		bool panic(const char*, const unsigned, const char*, ...);
	}
}

