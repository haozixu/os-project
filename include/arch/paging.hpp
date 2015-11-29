/*
 *	include/arch/paging.hpp
 *
 *	arch dependent paging
 */
#pragma once

#include <arch/arch.h>

#ifdef __x86_64__

#include <asm/paging.h>
#include <asm/creg.h>
#include <paging-const.h>

namespace arch {
	// arch independent paging types
	typedef pml4e_t pgdte_t; // Page Global Directory Table Entry
	typedef pdpte_t pdmte_t; // Page Directory Map Table Entry
	typedef pde_t 	pdte_t; // Page Directory Table Entry
	
	const unsigned PAGE_SIZE = 4096;
	const unsigned PAGE_SHIFT = PTE_SHIFT;
}

#define PGDTE_SHIFT PML4E_SHIFT
#define PDMTE_SHIFT PDPTE_SHIFT
#define PDTE_SHIFT 	PDE_SHIFT

#endif