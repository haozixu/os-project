/*
 * arch/x86_64/include/asm/io.h
 *
 * x86 I/O operations
 */
#ifndef _ASM_IO_H
#define _ASM_IO_H

#include <stdint.h>
#include <always_inline.h>

// note: function signature "uint16_t port" or "unsigned port"?

static inline int8_t inb(uint16_t port)
{
	int8_t data;
	asm volatile("inb %%dx, %0":"=a"(data):"d"(port));
	return data;
}

static inline int16_t inw(uint16_t port)
{
	int16_t data;
	asm volatile("inw %%dx, %0":"=a"(data):"d"(port));
	return data;
}

static inline int32_t inl(uint16_t port)
{
	int32_t data;
	asm volatile("inl %%dx, %0":"=a"(data):"d"(port));
	return data;
}


static inline void outb(uint16_t port, uint8_t data)
{
	asm volatile("outb %0, %%dx"::"a"(data),"d"(port));
}

static inline void outw(uint16_t port, uint16_t data)
{
	asm volatile("outw %0, %%dx"::"a"(data),"d"(port));
}

static inline void outl(uint16_t port, uint32_t data)
{
	asm volatile("outl %0, %%dx"::"a"(data),"d"(port));
}

// note: "void* addr" "unsigned count" operand sizes are arch-related

static inline void insb(uint16_t port, void* addr, unsigned count)
{
	asm volatile("insb"::"D"(addr),"d"(port),"c"(count));
}

static inline void insw(uint16_t port, void* addr, unsigned count)
{
	asm volatile("insw"::"D"(addr),"d"(port),"c"(count));
}

static inline void insl(uint16_t port, void* addr, unsigned count)
{
	asm volatile("insl"::"D"(addr),"d"(port),"c"(count));
}

static inline void outsb(uint16_t port, void* addr, unsigned count)
{
	asm volatile("outsb"::"S"(addr),"d"(port),"c"(count));
}

static inline void outsw(uint16_t port, void* addr, unsigned count)
{
	asm volatile("outsb"::"S"(addr),"d"(port),"c"(count));
}

static inline void outsl(uint16_t port, void* addr, unsigned count)
{
	asm volatile("outsb"::"S"(addr),"d"(port),"c"(count));
}

#undef inline

#endif

