/**
 *	@file arch/x86_64/include/asm/paging.hpp
 *
 *	@brief IA-32e paging stuff
 */
#pragma once

#include <memory/pgtable.hpp>

#include <compiler.h>
#include <stdint.h>

namespace ARCH {

// pgtable types
typedef struct {
	union {
		uint64_t val;
		struct {
			unsigned present: 1, writable: 1, user: 1, write_through: 1;
			unsigned cache_disable: 1, accessed: 1, zero: 6;
			unsigned long pdpt_base: 36, reserved: 15, execute_disable: 1; 
		}__packed;
	};
}__packed pml4e_t;
 
typedef struct {
	union {
		uint64_t val;
		struct {
			unsigned present: 1, writable: 1, user: 1, write_through: 1;
			unsigned cache_disable: 1, accessed: 1, dirty: 1, page_size: 1;
			union {
				// 1G page
				struct {
					unsigned global: 1, zero0: 3, attribute_table: 1, zero1: 17, page_frame: 18;
				}__packed;
				// non 1G page
				struct {
					unsigned long zero2: 4, pdt_base: 36;
				}__packed;
			};
			unsigned reserved: 15, execute_disable: 1; 
		}__packed;
	};
}__packed pdpte_t;

typedef struct {
	union {
		uint64_t val;
		struct {
			unsigned present: 1, writable: 1, user: 1, write_through: 1;
			unsigned cache_disable: 1, accessed: 1, dirty: 1, page_size: 1;
			union {
				// 2M page
				struct {
					unsigned global: 1, zero0: 3, attribute_table: 1, zero1: 8, page_frame: 27;
				}__packed;
				// non 2M page
				struct {
					unsigned long zero2: 4, pt_base: 36;
				}__packed;
			};
			unsigned reserved: 15, execute_disable: 1;
		}__packed;
	};
}__packed pde_t;

typedef struct {
	union {
		uint64_t val;
		struct {
			unsigned present: 1, writable: 1, user: 1, write_through: 1;
			unsigned cache_disable: 1, accessed: 1, dirty: 1, attribute_table: 1;
			unsigned long zero: 3, page_frame: 36, reserved: 16, execute_disable: 1;
		}__packed;
	};
}__packed pte_t;

typedef unsigned long addr_t;

static inline unsigned long pgdte_index(addr_t va)
{
	return ((va & ~SIGN_MASK) & PML4E_MASK) >> PML4E_SHIFT;
}

static inline unsigned long pdpte_index(addr_t va)
{
	return ((va & ~PML4E_MASK) & PDPTE_MASK) >> PDPTE_SHIFT;
}

static inline unsigned long pde_index(addr_t va)
{
	return ((va & ~PDPTE_MASK) & PDE_MASK) >> PDE_SHIFT;
}

static inline unsigned long pte_index(addr_t va)
{
	return ((va & ~PDE_MASK) & PTE_MASK) >> PTE_SHIFT;
}

// flags
enum __page_flags : uint64_t {
	PG_P 	  =	(1 << 0), 	// Present
	PG_RW	  =	(1 << 1), 	// Read/Write
	PG_US     =	(1 << 2), 	// User/Supervisor
	PG_PWT    =	(1 << 3), 	// Page level Write-Through
	PG_PCD    = (1 << 4), 	// Page level Cache-Disable
	PG_A      =	(1 << 5), 	// Accessed
	PG_D      =	(1 << 6), 	// Dirty
	PG_PS     =	(1 << 7), 	// Page Size
	PG_4K_PAT = (1 << 7), 	// 4K page Page Attribute Table
	PG_G	  = (1 << 8), 	// Global
	PG_2M_PAT = (1 << 12), 	// 2M page Page Attribute Table
	PG_XD	= (1UL << 63) 	// eXecute Disable
};

static __always_inline int has_1G_pages()
{
	int ret;
	asm volatile (
		"cpuid \n\t"
		"movl %%edx, %%eax \n\t"
		"andl $0x4000000, %%eax \n\t" /* bit 26 */
		:"=a"(ret)
		:"a"(0x80000001)
		:"ecx", "edx", "ebx"
		);
//	return static_cast<bool>(ret);
	return ret;
}

static __always_inline int PGE_available()
{
	int ret;
	asm volatile (
		"cpuid \n\t"
		"movl %%edx, %%eax \n\t"
		"andl $0x2000, %%eax \n\t" /* bit 13 */
		:"=a"(ret)
		:"a"(0x80000001)
		:"ecx", "edx", "ebx"
		);
//	return static_cast<bool>(ret);
	return ret;
}

}
