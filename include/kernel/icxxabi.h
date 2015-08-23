/*
 *	include/kernel/icxxabi.h
 *
 *	see kernel/icxxabi.cpp
 */
#pragma once

extern "C" {
	int __cxa_atexit(void (*f)(void *), void *object, void *);
	void __cxa_finalize(void *f);
	void __cxa_pure_virtual();
}
