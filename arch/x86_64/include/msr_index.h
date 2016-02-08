/*
 * 	arch/x86_64/include/msr_index.h
 *
 * 	Model Specific Registers(MSRs) index
 */
#pragma once

#define IA32_APIC_BASE                  0x1B 
#define IA32_FEATURE_CONTROL            0x3A 
#define IA32_SMM_MONITOR_CTL            0x9B 
#define IA32_MISC_ENABLE                0x1A0 
#define IA32_CPU_DCA_CAP                0x1F9 
#define IA32_MONITOR_FILTER_LINE_SIZE   0x06 
#define IA32_TIME_STAMP_COUNTER         0x10 
#define IA32_TSC_COUNTER                0x10 


//	Fixed-range MTRRs　
#define IA32_MTRR_FIX64K_00000          0x250 
#define IA32_MTRR_FIX16K_80000          0x258 
#define IA32_MTRR_FIX16K_A0000          0x259 
#define IA32_MTRR_FIX4K_C0000           0x268 
#define IA32_MTRR_FIX4K_C8000           0x269 
#define IA32_MTRR_FIX4K_D0000           0x26A 
#define IA32_MTRR_FIX4K_D8000           0x26B 
#define IA32_MTRR_FIX4K_E0000           0x26C 
#define IA32_MTRR_FIX4K_E8000           0x26D 
#define IA32_MTRR_FIX4K_F0000           0x26E 
#define IA32_MTRR_FIX4K_F8000           0x26F 

#define IA32_MTRRCAP                    0x0FE 
#define IA32_MTRR_DEF_TYPE              0x2FF 

#define IA32_MTRR_PHYSBASE0             0x200 
#define IA32_MTRR_PHYSMASK0             0x201 
#define IA32_MTRR_PHYSBASE1             0x202 
#define IA32_MTRR_PHYSMASK1             0x203 
#define IA32_MTRR_PHYSBASE2             0x204 
#define IA32_MTRR_PHYSMASK2             0x205 
#define IA32_MTRR_PHYSBASE3             0x206 
#define IA32_MTRR_PHYSMASK3             0x207 
#define IA32_MTRR_PHYSBASE4             0x208 
#define IA32_MTRR_PHYSMASK4             0x209 
#define IA32_MTRR_PHYSBASE5             0x20A 
#define IA32_MTRR_PHYSMASK5             0x20B 
#define IA32_MTRR_PHYSBASE6             0x20C 
#define IA32_MTRR_PHYSMASK6             0x20D 
#define IA32_MTRR_PHYSBASE7             0x20E 
#define IA32_MTRR_PHYSMASK7             0x20F 
#define IA32_MTRR_PHYSBASE8             0x210 
#define IA32_MTRR_PHYSMASK8             0x211 
#define IA32_MTRR_PHYSBASE9             0x212 
#define IA32_MTRR_PHYSMASK9             0x213 

#define IA32_SMRR_PHYSBASE              0x1F2 
#define IA32_SMRR_PHYSMASK              0x1F3 

#define IA32_PAT                        0x277 

#define IA32_SYSENTER_CS                0x174 
#define IA32_SYSENTER_ESP               0x175 
#define IA32_SYSENTER_EIP               0x176 

#define IA32_EFER                       0xC0000080 
#define IA32_STAR                       0xC0000081 
#define IA32_LSTAR                      0xC0000082 
#define IA32_FMASK                      0xC0000084 
#define IA32_FS_BASE                    0xC0000100 
#define IA32_GS_BASE                    0xC0000101 
#define IA32_KERNEL_GS_BASE             0xC0000102 


//	debug/performance monitoring
#define IA32_PEBS_ENABLE                0x3F1 

#define IA32_PERFEVTSEL0                0x186 
#define IA32_PERFEVTSEL1                0x187 
#define IA32_PERFEVTSEL2                0x188 
#define IA32_PERFEVTSEL3                0x189 
#define IA32_PMC0                       0x0C1 
#define IA32_PMC1                       0x0C2 
#define IA32_PMC2                       0x0C3 
#define IA32_PMC3                       0x0C4 

#define IA32_FIXED_CTR0                 0x309 
#define MSR_PERF_FIXED_CTR0             0x309 
#define IA32_FIXED_CTR1                 0x30A  
#define MSR_PERF_FIXED_CTR1             0x30A 
#define IA32_FIXED_CTR2                 0x30B 
#define MSR_PERF_FIXED_CTR2             0x30B 

#define IA32_FIXED_CTR_CTRL             0x38D 
#define MSR_PERF_FIXED_CTR_CTRL         0x38D 

#define IA32_PERF_STATUS                0x198 
#define IA32_PERF_CTL                   0x199 

#define IA32_PERF_CAPABILITIES          0x345 
#define IA32_PERF_GLOBAL_STATUS         0x38E 
#define MSR_PERF_GLOBAL_STATUS          0x38E 
#define MSR_PERF_GLOBAL_CTRL            0x38F 
#define IA32_PERF_GLOBAL_CTRL           0x38F 
#define IA32_PERF_GLOBAL_OVF_CTRL       0x390 
#define MSR_PERF_GLOBAL_OVF_CTRL        0x390 

#define MSR_PEBS_LD_LAT                 0x3F6 

#define IA32_DS_AREA                    0x600 
#define IA32_TSC_DEADLINE               0x6E0 

#define IA32_VMX_BASIC                  0x480  
#define IA32_VMX_PINBASED_CTS           0x481 
#define IA32_VMX_PROCBASED_CTLS         0x482 
#define IA32_VMX_EXIT_CTLS              0x483 
#define IA32_VMX_ENTRY_CTLS             0x484 
#define IA32_VMX_MISC                   0x485 
#define IA32_VMX_CR0_FIXED0             0x486 
#define IA32_VMX_CR0_FIXED1             0x487 
#define IA32_VMX_CR4_FIXED0             0x488 
#define IA32_VMX_CR4_FIXED1             0x489 
#define IA32_VMX_VMCS_ENUM              0x48A 
#define IA32_VMX_PROCBASED_CTLS2        0x48B

