/*
 *	arch/x86_64/include/memory/address.hpp
 *
 *	address operations
 */
#pragma once

namespace ARCH {
	constexpr auto PAGE_OFFSET = 0xffffff0000000000UL;
	
	static inline unsigned long va(unsigned long pa64)
	{
		return pa64 + PAGE_OFFSET;
	}
	
	static inline unsigned long va(unsigned pa32)
	{
		return static_cast<unsigned long>(pa32) + PAGE_OFFSET;
	}
	
	static inline unsigned long pa(unsigned long va64)
	{
		return va64 - PAGE_OFFSET;
	}
	
	static inline unsigned long pa(unsigned pa32)
	{
		return static_cast<unsigned long>(pa32);
	}
	
	template<typename PtrT>
	static inline PtrT vptr(unsigned long va64)
	{
		return reinterpret_cast<PtrT>(va64);
	}
	
	template<typename PtrT>
	static inline PtrT vptr(unsigned pa32)
	{
		return reinterpret_cast<PtrT>(va(pa32));
	}
	
	template<typename PtrT, typename T>
	static inline PtrT vptr(T* ptr)
	{
		return reinterpret_cast<PtrT>(ptr);
	}
}
