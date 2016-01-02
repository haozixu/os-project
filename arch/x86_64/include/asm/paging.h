/*
 * 	arch/x86_64/include/asm/paging.h
 *
 * 	IA-32e paging stuff
 */
#ifndef _ASM_PAGING_H
#define _ASM_PAGING_H

#include <stdint.h>
#include <compiler.h>

// paging types
typedef struct pml4e {
	union {
		uint64_t val;
		struct {
			unsigned p: 1, rw: 1, us: 1, pwt: 1, pcd: 1, a: 1, zero: 6;
			unsigned long pdpt_base: 36, reserved: 15, xd: 1; 
		}__packed;
	};
}__packed pml4e_t;
 
typedef struct pdpte {
	union {
		uint64_t val;
		struct {
			unsigned p: 1, rw: 1, us: 1, pwt: 1, pcd: 1, a: 1, d: 1, ps: 1;
			union {
				// 1G page
				struct {
					unsigned g: 1, zero0: 3, pat: 1, zero1: 17, page_frame: 18;
				}__packed;
				// non 1G page
				struct {
					unsigned long zero2: 4, pdt_base: 36;
				}__packed;
			}
			unsigned reserved: 15, xd: 1; 
		}__packed;
	};
}__packed pdpte_t;

typedef struct pde {
	union {
		uint64_t val;
		struct {
			unsigned p: 1, rw: 1, us: 1, pwt: 1, pcd: 1, a: 1, d: 1, ps: 1;
			union {
				// 2M page
				struct {
					unsigned g: 1, zero0: 3, pat: 1, zero1: 8, page_frame: 27;
				}__packed;
				// non 2M page
				struct {
					unsigned long zero2: 4, pt_base: 36;
				}__packed;
			};
			unsigned reserved: 15, xd: 1;
		}__packed;
	};
}__packed pde_t;

typedef struct pte {
	union {
		uint64_t val;
		struct {
			unsigned p: 1, rw: 1, us: 1, pwt: 1, pcd: 1, a: 1, d: 1, pat: 1;
			unsigned long g: 1, zero: 3, page_frame: 36, reserved: 16, xd: 1;
		}__packed;
	};
}__packed pte_t;

typedef unsigned long address_t;

// flags
#define _PG_P      (1 << 0)  // Present
#define _PG_RW     (1 << 1)  // Read/Write
#define _PG_US     (1 << 2)  // User/Supervisor
#define _PG_PWT    (1 << 3)  // Page level Write-Through
#define _PG_PCD    (1 << 4)  // Page level Cache-Disable
#define _PG_A      (1 << 5)  // Accessed
#define _PG_D      (1 << 6)  // Dirty
#define _PG_PS     (1 << 7)  // Page Size
#define _PG_4K_PAT (1 << 7)  // 4K page Page Attribute Table
#define _PG_G      (1 << 8)  // Global
#define _PG_2M_PAT (1 << 12) // 2M page Page Attribute Table
#define _PG_XD     (1 << 63) // eXecute Disable

enum page_flags {
	PG_P 	= _PG_P,
	PG_RW 	= _PG_RW,
	PG_US 	= _PG_US,
	PG_PWT 	= _PG_PWT,
	PG_PCD 	= _PG_PCD,
	PG_A 	= _PG_A,
	PG_D 	= _PG_D,
	PG_PS 	= _PG_PS,
	PG_G 	= _PG_G,
	PG_XD 	= _PG_XD
}

static __always_inline int has_1Gb_pages(void)
{
	int ret;
	asm volatile(
		"cpuid \n\t"
		"movl %%edx, %%eax \n\t"
		"andl $0x4000000, %%eax \n\t" /* bit 26 */
		:"=a"(ret)
		:"a"(0x80000001)
		:"ecx", "edx", "ebx"
		);
	return ret;
}

static __always_inline int pge_availbale(void)
{
	int ret;
	asm volatile(
		"cpuid \n\t"
		"movl %%edx, %%eax \n\t"
		"andl $0x2000, %%eax \n\t" /* bit 13 */
		:"=a"(ret)
		:"a"(0x80000001)
		:"ecx", "edx", "ebx"
		);
	return ret;
}

#endif