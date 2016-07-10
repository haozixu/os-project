/**
 *	@file arch/x86_64/include/asm/io.hpp
 *
 *	@brief x86-64 I/O operations
 */
#pragma once

#include <compiler.h>
#include <stdint.h>

namespace ARCH {
// note: function signature "uint16_t port" or "unsigned port"?

static __always_inline int8_t inb(uint16_t port)
{
	int8_t data;
	asm volatile ("inb %%dx, %0":"=a"(data):"dN"(port));
	return data;
}

static __always_inline int16_t inw(uint16_t port)
{
	int16_t data;
	asm volatile ("inw %%dx, %0":"=a"(data):"dN"(port));
	return data;
}

static __always_inline int32_t inl(uint16_t port)
{
	int32_t data;
	asm volatile ("inl %%dx, %0":"=a"(data):"dN"(port));
	return data;
}


static __always_inline void outb(uint16_t port, uint8_t data)
{
	asm volatile ("outb %0, %%dx"::"a"(data),"dN"(port));
}

static __always_inline void outw(uint16_t port, uint16_t data)
{
	asm volatile ("outw %0, %%dx"::"a"(data),"dN"(port));
}

static __always_inline void outl(uint16_t port, uint32_t data)
{
	asm volatile ("outl %0, %%dx"::"a"(data),"dN"(port));
}

// note: "void* addr" "unsigned count" operand sizes are arch-related

static __always_inline void insb(uint16_t port, void* addr, unsigned count)
{
	asm volatile ("insb"::"D"(addr),"d"(port),"c"(count));
}

static __always_inline void insw(uint16_t port, void* addr, unsigned count)
{
	asm volatile ("insw"::"D"(addr),"d"(port),"c"(count));
}

static __always_inline void insl(uint16_t port, void* addr, unsigned count)
{
	asm volatile ("insl"::"D"(addr),"d"(port),"c"(count));
}

static __always_inline void outsb(uint16_t port, const void* addr, unsigned count)
{
	asm volatile ("outsb"::"S"(addr),"d"(port),"c"(count));
}

static __always_inline void outsw(uint16_t port, const void* addr, unsigned count)
{
	asm volatile ("outsb"::"S"(addr),"d"(port),"c"(count));
}

static __always_inline void outsl(uint16_t port, const void* addr, unsigned count)
{
	asm volatile ("outsb"::"S"(addr),"d"(port),"c"(count));
}

/**
 *	@function: io_delay
 *	@brief: make a suitable cpu delay for io operations
 *	@input: no
 */
static __always_inline void io_delay(void)
{
	asm volatile ("pause");
}


}

