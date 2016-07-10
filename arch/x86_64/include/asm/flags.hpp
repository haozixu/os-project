/**
 *	@file arch/x86_64/include/asm/flags.hpp
 *
 *	@brief flags related operations
 */
#pragma once

#include <compiler.h>
#include <stdint.h>

namespace ARCH {

static __always_inline void cli()
{
	asm volatile ("cli":::"cc");
}

static __always_inline void sti()
{
	asm volatile ("sti":::"cc");
}

static __always_inline void cld()
{
	asm volatile ("cld":::"cc");
}

// do not use !
//static __always_inline void std()
//{
//	asm volatile ("std":::"cc");
//}

static __always_inline void pushfl()
{
	asm volatile ("pushfl");
}

static __always_inline void pushfq()
{
	asm volatile ("pushfq");
}

static __always_inline void popfl()
{
	asm volatile ("popfl");
}

static __always_inline void popfq()
{
	asm volatile ("popfq");
}

static __always_inline uint32_t get_eflags()
{
	uint32_t eflags;
	pushfl();
	asm volatile ("popl %%eax":"=a"(eflags));
	return eflags;
}

static __always_inline uint64_t get_rflags()
{
	uint64_t rflags;
	pushfq();
	asm volatile ("popq %%rax":"=a"(rflags));
	return rflags;
}

static __always_inline void set_eflags(uint32_t eflags)
{
	asm volatile ("pushl %0"::"r"(eflags));
	popfl();
}

static __always_inline void set_rflags(uint64_t rflags)
{
	asm volatile ("pushq %0"::"r"(rflags));
	popfq();
}

}
