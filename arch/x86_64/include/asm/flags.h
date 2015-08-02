/*
 * arch/x86_64/include/asm/flags.h
 *
 * flags related operations
 */
#ifndef _ASM_FLAGS_H
#define _ASM_FLAGS_H

#include <stdint.h>
#include <always-inline.h>

static inline void cli(void)
{
	asm volatile("cli":::"cc");
}

static inline void sti(void)
{
	asm volatile("sti":::"cc");
}

static inline void cld(void)
{
	asm volatile("cld":::"cc");
}

static inline void std(void)
{
	asm volatile("std":::"cc");
}

static inline void pushfl(void)
{
	asm volatile("pushfl");
}

static inline void pushfq(void)
{
	asm volatile("pushfq");
}

static inline void popfl(void)
{
	asm volatile("popfl");
}

static inline void popfq(void)
{
	asm volatile("popfq");
}

static inline uint32_t get_eflags(void)
{
	uint32_t eflags;
	pushfl();
	asm volatile("popl %%eax":"=a"(eflags));
	return eflags;
}

static inline uint64_t get_rflags(void)
{
	uint64_t rflags;
	pushfq();
	asm volatile("popq %%rax":"=s"(rflags));
	return rflags;
}

static inline void set_eflags(uint32_t eflags)
{
	asm volatile("pushl %0"::"r"(eflags));
	popfl();
}

static inline void set_rflags(uint64_t rflags)
{
	asm volatile("pushq %0"::"r"(rflags));
	popfq();
}

#undef inline

#endif
