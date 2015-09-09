/*
 *	include/lib/kassert.h
 *
 * 	kernel non-standard assert
 */
#pragma once

#ifndef __cplusplus
#error kassert required a C++ compiler.
#endif

#include <kernel/config.h>
#include <kernel/log.hpp>

#if defined(NDEBUG) || CONFIG_DEBUG == NO
#define KASSERT(expression, format, ...) ((void)0)
#else
#define KASSERT(expression, format, ...) \
	(void)(!!(expression) || kernel::debug::panic(__FILE__, __FUNCTION__, __LINE__, format, ##__VA_ARGS__))
#endif