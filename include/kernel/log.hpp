/*
 *	include/kernel/log.hpp
 *
 *	logging
 */
#pragma once

namespace kernel {
	namespace debug {
		void log(const char*);
		void log_format(const char*, ...);
	}
}

