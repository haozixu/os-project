/*
*	new.hpp
*	
*	replacement new
*/
#pragma once

#include <stddef.h>

/*
	::operator new should wrap something like malloc() 
*/	
inline void* operator new(std::size_t, void* p) noexcept { return p; }
inline void* operator new[](std::size_t, void* p) noexcept { return p; }
inline void operator delete(void*, void*) noexcept { }
inline void operator delete[](void*, void*) noexcept { }

