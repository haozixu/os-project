/*
 * arch/x86_64/include/asm/creg.h
 *
 * Control Registers operation
 */
#pragma once

#include <arch/arch.h>
#include <stdint.h>
#include <compiler.h>

namespace ARCH {

// read

static __always_inline uint32_t __read_cr0_32(void)
{
	uint32_t cr0_val;
	asm volatile ("movl %%cr0, %0":"=r"(cr0_val));
	return cr0_val;
}

static __always_inline uint64_t __read_cr0_64(void)
{
	uint64_t cr0_val;
	asm volatile ("movq %%cr0, %0":"=r"(cr0_val));
	return cr0_val;
}

static __always_inline unsigned long read_cr0(void)
{
	unsigned long cr0_val;
#ifdef __x86_64__
	cr0_val = __read_cr0_64();
#else
	cr0_val = __read_cr0_32();
#endif
	return cr0_val;
}

static __always_inline uint32_t __read_cr2_32(void)
{
	uint32_t cr2_val;
	asm volatile ("movl %%cr2, %0":"=r"(cr2_val));
	return cr2_val;
}

static __always_inline uint64_t __read_cr2_64(void)
{
	uint64_t cr2_val;
	asm volatile ("movq %%cr2, %0":"=r"(cr2_val));
	return cr2_val;
}

static __always_inline unsigned long read_cr2(void)
{
	unsigned long cr2_val;
#ifdef __x86_64__
	cr2_val = __read_cr2_64();
#else
	cr2_val = __read_cr2_32();
#endif
	return cr2_val;
}

static __always_inline uint32_t __read_cr3_32(void)
{
	uint32_t cr3_val;
	asm volatile ("movl %%cr3, %0":"=r"(cr3_val));
	return cr3_val;
}

static __always_inline uint64_t __read_cr3_64(void)
{
	uint64_t cr3_val;
	asm volatile ("movq %%cr3, %0":"=r"(cr3_val));
	return cr3_val;
}

static __always_inline unsigned long read_cr3(void)
{
	unsigned long cr3_val;
#ifdef __x86_64__
	cr3_val = __read_cr3_64();
#else
	cr3_val = __read_cr3_32();
#endif
	return cr3_val;
}

static __always_inline uint32_t __read_cr4_32(void)
{
	uint32_t cr4_val;
	asm volatile ("movl %%cr4, %0":"=r"(cr4_val));
	return cr4_val;
}

static __always_inline uint64_t __read_cr4_64(void)
{
	uint64_t cr4_val;
	asm volatile ("movq %%cr4, %0":"=r"(cr4_val));
	return cr4_val;
}

static __always_inline unsigned long read_cr4(void)
{
	unsigned long cr4_val;
#ifdef __x86_64__
	cr4_val = __read_cr4_64();
#else
	cr4_val = __read_cr4_32();
#endif
	return cr4_val;
}

static __always_inline uint64_t read_cr8(void)
{
	uint64_t cr8_value;
	asm volatile ("movq %%cr8, %0":"=r"(cr8_val));
	return cr8_val;
}


// write

static __always_inline void __write_cr0_32(uint32_t val)
{
	asm volatile ("movl %0, %%cr0"::"r"(val));
}

static __always_inline void __write_cr0_64(uint64_t val)
{
	asm volatile ("movq %0, %%cr0"::"r"(val));
}

static __always_inline void write_cr0(unsigned long val)
{
#ifdef __x86_64__
	__write_cr0_32(val);
#else
	__write_cr0_64(val);
#endif
}

static __always_inline void __write_cr2_32(uint32_t val)
{
	asm volatile ("movl %0, %%cr2"::"r"(val));
}

static __always_inline void __write_cr2_64(uint64_t val)
{
	asm volatile ("movq %0, %%cr2"::"r"(val));
}

static __always_inline void write_cr2(unsigned long val)
{
#ifdef __x86_64__
	__write_cr2_32(val);
#else
	__write_cr2_64(val);
#endif
}

static __always_inline void __write_cr3_32(uint32_t val)
{
	asm volatile ("movl %0, %%cr3"::"r"(val));
}

static __always_inline void __write_cr3_64(uint64_t val)
{
	asm volatile ("movq %0, %%cr3"::"r"(val));
}

static __always_inline void write_cr3(unsigned long val)
{
#ifdef __x86_64__
	__write_cr3_32(val);
#else
	__write_cr3_64(val);
#endif
}

static __always_inline void __write_cr4_32(uint32_t val)
{
	asm volatile ("movl %0, %%cr4"::"r"(val));
}

static __always_inline void __write_cr4_64(uint64_t val)
{
	asm volatile ("movq %0, %%cr4"::"r"(val));
}

static __always_inline void write_cr4(unsigned long val)
{
#ifdef __x86_64__
	__write_cr4_32(val);
#else
	__write_cr4_64(val);
#endif
}

static __always_inline void write_cr8(uint64_t val)
{
	asm volatile ("movq %0, %%cr8"::"r"(val));
}

}
