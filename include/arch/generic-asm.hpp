/*
 *	include/arch/generic-asm.hpp
 *
 *	miscellaneous asm stuff
 */
#pragma once

#include <arch/arch.h>

#ifdef __x86_64__

#include <asm/barrier.h>
#include <asm/flags.h>
#include <asm/misc.h>

namespace arch {
	inline void relax_cpu()
	{
		pause();
	}
	
	inline void enable_interrupt()
	{
		sti();
	}
	
	inline void disable_interrupt()
	{
		cli();
	}
	
	inline void compiler_mem_barrier()
	{
		asm("":::"memory");
	}
	
	inline void memory_barrier()
	{
		mfence();
	}
	
	inline void memory_read_barrier()
	{
		lfence();
	}
	
	inline void memory_write_barrier()
	{
		sfence();
	}
}

#endif
