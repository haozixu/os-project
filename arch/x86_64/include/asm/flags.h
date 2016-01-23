/*
 * arch/x86_64/include/asm/flags.h
 *
 * flags related operations
 */
#ifndef _ASM_FLAGS_H
#define _ASM_FLAGS_H

#include <stdint.h>
#include <compiler.h>

static __always_inline void cli(void)
{
	asm volatile ("cli":::"cc");
}

static __always_inline void sti(void)
{
	asm volatile ("sti":::"cc");
}

static __always_inline void cld(void)
{
	asm volatile ("cld":::"cc");
}

// do not use !
//static __always_inline void std(void)
//{
//	asm volatile ("std":::"cc");
//}

static __always_inline void pushfl(void)
{
	asm volatile ("pushfl");
}

static __always_inline void pushfq(void)
{
	asm volatile ("pushfq");
}

static __always_inline void popfl(void)
{
	asm volatile ("popfl");
}

static __always_inline void popfq(void)
{
	asm volatile ("popfq");
}

static __always_inline uint32_t get_eflags(void)
{
	uint32_t eflags;
	pushfl();
	asm volatile ("popl %%eax":"=a"(eflags));
	return eflags;
}

static __always_inline uint64_t get_rflags(void)
{
	uint64_t rflags;
	pushfq();
	asm volatile ("popq %%rax":"=s"(rflags));
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

#endif
