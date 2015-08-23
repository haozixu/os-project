/*
 * arch/x86_64/include/paging.h
 *
 * IA-32e paging stuff
 */
#pragma once

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
 
// note: we don't use 1G page so some fields are marked as zero
typedef struct pdpte {
	union {
		uint64_t val;
		struct {
			unsigned p: 1, rw: 1, us: 1, pwt: 1, pcd: 1, a: 1, zero: 6;
			unsigned long pdt_base: 36, reserved: 15, xd: 1; 
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

// flags
#define PG_P      (1 << 0)  // Present
#define PG_RW     (1 << 1)  // Read/Write
#define PG_US     (1 << 2)  // User/Supervisor
#define PG_PWT    (1 << 3)  // Page level Write-Through
#define PG_PCD    (1 << 4)  // Page level Cache-Disable
#define PG_A      (1 << 5)  // Accessed
#define PG_D      (1 << 6)  // Dirty
#define PG_PS     (1 << 7)  // Page Size
#define PG_4K_PAT (1 << 7)  // 4K page Page Attribute Table
#define PG_G      (1 << 8)  // Global
#define PG_2M_PAT (1 << 12) // 2M page Page Attribute Table
#define PG_XD     (1 << 63) // eXecute Disable

