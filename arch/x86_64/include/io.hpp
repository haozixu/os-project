/*
 *	arch/x86_64/include/io.hpp
 *
 *	asm I/O operations encapsulations
 */
#pragma once

#include <stdint.h>
#include <asm/io.h>

/*
 * this need a lot of optimization.
 *
 * g++ -O2 can handle this and generate 
 * pretty good code as expected.
 *
 * example code:
 *		uint8_t val = ports_byte[0xcf9] & ~6;
 *		ports_byte[0xcf9] = val | 2;
 *		ports_byte[0xcf9] = val | 6;
 */ 
 
template<typename T>
struct port {
	uint16_t port_addr;
	
	port(uint16_t port) : port_addr(port) {}

	operator T(); // in	
	void operator=(const T val); // out
	void operator|=(const T val); // in & out
	void operator&=(const T val); // in & out	
};

template<typename T>
inline port<T>::operator T() {}

template<typename T>
inline void port<T>::operator=(const T val) {}

template<typename T>
inline void port<T>::operator|=(const T val) {}

template<typename T>
inline void port<T>::operator&=(const T val) {}

template<>
inline port<uint8_t>::operator uint8_t()
{
	return inb(port_addr);
}

template<>
inline void port<uint8_t>::operator=(const uint8_t val)
{
	outb(port_addr, val);
}

template<>
inline void port<uint8_t>::operator|=(const uint8_t val)
{
	uint8_t tmp = inb(port_addr);
	tmp |= val;
	outb(port_addr, tmp);
}

template<>
inline void port<uint8_t>::operator&=(const uint8_t val)
{
	uint8_t tmp = inb(port_addr);
	tmp &= val;
	outb(port_addr, tmp);
}

template<>
inline port<uint16_t>::operator uint16_t()
{
	return inw(port_addr);
}

template<>
inline void port<uint16_t>::operator=(const uint16_t val)
{
	outw(port_addr, val);
}

template<>
inline void port<uint16_t>::operator|=(const uint16_t val)
{
	uint16_t tmp = inw(port_addr);
	tmp |= val;
	outw(port_addr, tmp);
}

template<>
inline void port<uint16_t>::operator&=(const uint16_t val)
{
	uint16_t tmp = inw(port_addr);
	tmp &= val;
	outw(port_addr, tmp);
}

template<>
inline port<uint32_t>::operator uint32_t()
{
	return inl(port_addr);
}

template<>
inline void port<uint32_t>::operator=(const uint32_t val)
{
	outl(port_addr, val);
}

template<>
inline void port<uint32_t>::operator|=(const uint32_t val)
{
	uint32_t tmp = inl(port_addr);
	tmp |= val;
	outl(port_addr, tmp);
}

template<>
inline void port<uint32_t>::operator&=(const uint32_t val)
{
	uint32_t tmp = inl(port_addr);
	tmp &= val;
	outl(port_addr, tmp);
}

template<typename T>
struct ports {
	port<T> operator[](uint16_t port_addr)
	{
		return port<T>(port_addr);
	}
};

ports<uint8_t> ports_byte;
ports<uint16_t> ports_word;
ports<uint32_t> ports_dword;

