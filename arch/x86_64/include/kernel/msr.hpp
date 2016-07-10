/*
 *	arch/x86_64/include/kernel/msr.hpp
 *
 *	MSR(Model Specific Registers) related
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

	msr() = delete;
	msr(uint32_t i) : index(i) {}
	
	void write(uint64_t val)
	{
		wrmsr(index, val);
	}

	void operator=(const msr&) = delete;
	void operator=(uint64_t val)
	{
		write(val);
	}

	uint64_t read()
	{
		return rdmsr(index);
	}

	operator uint64_t() // implicit cast
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
		return msr(index); // using RVO (retun value optimization)
	}
} msrs;

// MSR index
constexpr uint32_t IA32_APIC_BASE                = 0x1B; 
constexpr uint32_t IA32_FEATURE_CONTROL          = 0x3A;
constexpr uint32_t IA32_SMM_MONITOR_CTL          = 0x9B;
constexpr uint32_t IA32_MISC_ENABLE              = 0x1A0; 
constexpr uint32_t IA32_CPU_DCA_CAP              = 0x1F9; 
constexpr uint32_t IA32_MONITOR_FILTER_LINE_SIZE = 0x06; 
constexpr uint32_t IA32_TIME_STAMP_COUNTER       = 0x10; 
constexpr uint32_t IA32_TSC_COUNTER              = 0x10; 

//	Fixed-range MTRRs　
constexpr uint32_t IA32_MTRR_FIX64K_00000        = 0x250; 
constexpr uint32_t IA32_MTRR_FIX16K_80000        = 0x258; 
constexpr uint32_t IA32_MTRR_FIX16K_A0000        = 0x259;
constexpr uint32_t IA32_MTRR_FIX4K_C0000         = 0x268; 
constexpr uint32_t IA32_MTRR_FIX4K_C8000         = 0x269; 
constexpr uint32_t IA32_MTRR_FIX4K_D0000         = 0x26A; 
constexpr uint32_t IA32_MTRR_FIX4K_D8000         = 0x26B; 
constexpr uint32_t IA32_MTRR_FIX4K_E0000         = 0x26C; 
constexpr uint32_t IA32_MTRR_FIX4K_E8000         = 0x26D; 
constexpr uint32_t IA32_MTRR_FIX4K_F0000         = 0x26E; 
constexpr uint32_t IA32_MTRR_FIX4K_F8000         = 0x26F; 

constexpr uint32_t IA32_MTRRCAP                  = 0x0FE; 
constexpr uint32_t IA32_MTRR_DEF_TYPE            = 0x2FF; 

constexpr uint32_t IA32_MTRR_PHYSBASE0           = 0x200; 
constexpr uint32_t IA32_MTRR_PHYSMASK0           = 0x201; 
constexpr uint32_t IA32_MTRR_PHYSBASE1           = 0x202; 
constexpr uint32_t IA32_MTRR_PHYSMASK1           = 0x203; 
constexpr uint32_t IA32_MTRR_PHYSBASE2           = 0x204; 
constexpr uint32_t IA32_MTRR_PHYSMASK2           = 0x205; 
constexpr uint32_t IA32_MTRR_PHYSBASE3           = 0x206; 
constexpr uint32_t IA32_MTRR_PHYSMASK3           = 0x207; 
constexpr uint32_t IA32_MTRR_PHYSBASE4           = 0x208; 
constexpr uint32_t IA32_MTRR_PHYSMASK4           = 0x209; 
constexpr uint32_t IA32_MTRR_PHYSBASE5           = 0x20A; 
constexpr uint32_t IA32_MTRR_PHYSMASK5           = 0x20B; 
constexpr uint32_t IA32_MTRR_PHYSBASE6           = 0x20C; 
constexpr uint32_t IA32_MTRR_PHYSMASK6           = 0x20D;
constexpr uint32_t IA32_MTRR_PHYSBASE7           = 0x20E;
constexpr uint32_t IA32_MTRR_PHYSMASK7           = 0x20F; 
constexpr uint32_t IA32_MTRR_PHYSBASE8           = 0x210; 
constexpr uint32_t IA32_MTRR_PHYSMASK8           = 0x211; 
constexpr uint32_t IA32_MTRR_PHYSBASE9           = 0x212; 
constexpr uint32_t IA32_MTRR_PHYSMASK9           = 0x213; 

constexpr uint32_t IA32_SMRR_PHYSBASE            = 0x1F2; 
constexpr uint32_t IA32_SMRR_PHYSMASK            = 0x1F3;

constexpr uint32_t IA32_PAT                      = 0x277; 

constexpr uint32_t IA32_SYSENTER_CS              = 0x174; 
constexpr uint32_t IA32_SYSENTER_ESP             = 0x175; 
constexpr uint32_t IA32_SYSENTER_EIP             = 0x176; 

constexpr uint32_t IA32_EFER                     = 0xC0000080; 
constexpr uint32_t IA32_STAR                     = 0xC0000081; 
constexpr uint32_t IA32_LSTAR                    = 0xC0000082; 
constexpr uint32_t IA32_FMASK                    = 0xC0000084; 
constexpr uint32_t IA32_FS_BASE                  = 0xC0000100; 
constexpr uint32_t IA32_GS_BASE                  = 0xC0000101; 
constexpr uint32_t IA32_KERNEL_GS_BASE           = 0xC0000102;

//	debug/performance monitoring
constexpr uint32_t IA32_PEBS_ENABLE              = 0x3F1; 

constexpr uint32_t IA32_PERFEVTSEL0              = 0x186; 
constexpr uint32_t IA32_PERFEVTSEL1              = 0x187; 
constexpr uint32_t IA32_PERFEVTSEL2              = 0x188; 
constexpr uint32_t IA32_PERFEVTSEL3              = 0x189; 
constexpr uint32_t IA32_PMC0                     = 0x0C1; 
constexpr uint32_t IA32_PMC1                     = 0x0C2; 
constexpr uint32_t IA32_PMC2                     = 0x0C3; 
constexpr uint32_t IA32_PMC3                     = 0x0C4;

constexpr uint32_t IA32_FIXED_CTR0               = 0x309; 
constexpr uint32_t MSR_PERF_FIXED_CTR0           = 0x309; 
constexpr uint32_t IA32_FIXED_CTR1               = 0x30A;  
constexpr uint32_t MSR_PERF_FIXED_CTR1           = 0x30A;
constexpr uint32_t IA32_FIXED_CTR2               = 0x30B; 
constexpr uint32_t MSR_PERF_FIXED_CTR2           = 0x30B; 

constexpr uint32_t IA32_FIXED_CTR_CTRL           = 0x38D; 
constexpr uint32_t MSR_PERF_FIXED_CTR_CTRL       = 0x38D; 

constexpr uint32_t IA32_PERF_STATUS              = 0x198; 
constexpr uint32_t IA32_PERF_CTL                 = 0x199; 

constexpr uint32_t IA32_PERF_CAPABILITIES        = 0x345; 
constexpr uint32_t IA32_PERF_GLOBAL_STATUS       = 0x38E; 
constexpr uint32_t MSR_PERF_GLOBAL_STATUS        = 0x38E; 
constexpr uint32_t MSR_PERF_GLOBAL_CTRL          = 0x38F; 
constexpr uint32_t IA32_PERF_GLOBAL_CTRL         = 0x38F; 
constexpr uint32_t IA32_PERF_GLOBAL_OVF_CTRL     = 0x390; 
constexpr uint32_t MSR_PERF_GLOBAL_OVF_CTRL      = 0x390; 

constexpr uint32_t MSR_PEBS_LD_LAT               = 0x3F6; 

constexpr uint32_t IA32_DS_AREA                  = 0x600; 
constexpr uint32_t IA32_TSC_DEADLINE             = 0x6E0; 

constexpr uint32_t IA32_VMX_BASIC                = 0x480;  
constexpr uint32_t IA32_VMX_PINBASED_CTS         = 0x481; 
constexpr uint32_t IA32_VMX_PROCBASED_CTLS       = 0x482; 
constexpr uint32_t IA32_VMX_EXIT_CTLS            = 0x483; 
constexpr uint32_t IA32_VMX_ENTRY_CTLS           = 0x484; 
constexpr uint32_t IA32_VMX_MISC                 = 0x485; 
constexpr uint32_t IA32_VMX_CR0_FIXED0           = 0x486; 
constexpr uint32_t IA32_VMX_CR0_FIXED1           = 0x487; 
constexpr uint32_t IA32_VMX_CR4_FIXED0           = 0x488;
constexpr uint32_t IA32_VMX_CR4_FIXED1           = 0x489; 
constexpr uint32_t IA32_VMX_VMCS_ENUM            = 0x48A; 
constexpr uint32_t IA32_VMX_PROCBASED_CTLS2      = 0x48B;

}
