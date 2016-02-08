/*
 *	arch/x86_64/include/msr_op.hpp
 *
 *	MSR related operations
 */
#pragma once

#include <asm/msr.hpp>

namespace ARCH {
/*
 * this need a lot of optimization.
 *
 * g++ -O2 can handle this and generate 
 * pretty good code as expected.
 *
 * example code:
 *		msrs[0xc0000080] |= (1 << 8);
 *		uint64_t v = msrs[0x1b];
 */ 
struct msr {
	uint32_t index;

	msr(uint32_t i) : index(i) {}
	
	void write(uint64_t val)
	{
		wrmsr(index, val);
	}

	void operator=(uint64_t val)
	{
		write(index, val);
	}

	uint64_t read()
	{
		return rdmsr(index);
	}

	uint64_t() // implicit cast
	{
		return read();
	}

	void operator|=(uint64_t val)
	{
		uint64_t tmp;
		tmp = rdmsr(index);
		tmp |= val;
		wrmsr(index, tmp);
	}

	void operator&=(uint64_t val)
	{
		uint64_t tmp;
		tmp = rdmsr(index);
		tmp &= val;
		wrmsr(index, tmp);
	}
};

struct {
	msr operator[](uint32_t index)
	{
		return msr(index); // "a temporary object"
	}
} msrs;

}
