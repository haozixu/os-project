/**
 *	@file arch/x86_64/include/asm/creg.hpp
 *
 *	@brief x86-64 Control Registers operations
 */
#pragma once

#include <arch.h>
#include <compiler.h>
#include <stdint.h>

namespace ARCH {

// read

static __always_inline uint64_t read_cr0()
{
	uint64_t cr0_val;
	asm volatile ("movq %%cr0, %0":"=r"(cr0_val));
	return cr0_val;
}

static __always_inline uint64_t read_cr2()
{
	uint64_t cr2_val;
	asm volatile ("movq %%cr2, %0":"=r"(cr0_val));
	return cr2_val;
}

static __always_inline uint64_t read_cr3()
{
	uint64_t cr3_val;
	asm volatile ("movq %%cr3, %0":"=r"(cr0_val));
	return cr3_val;
}

static __always_inline uint64_t read_cr4()
{
	uint64_t cr4_val;
	asm volatile ("movq %%cr4, %0":"=r"(cr4_val));
	return cr4_val;
}

static __always_inline uint64_t read_cr8()
{
	uint64_t cr8_val;
	asm volatile ("movq %%cr8, %0":"=r"(cr0_val));
	return cr8_val;
}

// write

static __always_inline void write_cr0(uint64_t val)
{
	asm volatile ("movq %0, %%cr0"::"r"(val));
}

static __always_inline void write_cr2(uint64_t val)
{
	asm volatile ("movq %0, %%cr2"::"r"(val));
}

static __always_inline void write_cr3(uint64_t val)
{
	asm volatile ("movq %0, %%cr3"::"r"(val));
}

static __always_inline void write_cr4(uint64_t val)
{
	asm volatile ("movq %0, %%cr4"::"r"(val));
}

static __always_inline void write_cr8(uint64_t val)
{
	asm volatile ("movq %0, %%cr8"::"r"(val));
}

}
