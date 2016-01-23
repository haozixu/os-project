/*
 *	include/arch/paging.hpp
 *
 *	arch dependent paging
 */
#pragma once

#include <arch/arch.h>

#ifdef __x86_64__

namespace ARCH {
	#include <asm/paging.h>
	#include <asm/creg.h>
	#include <pgtable.h>
}

#define PGDTE_SHIFT 	PML4E_SHIFT
#define PDMTE_SHIFT 	PDPTE_SHIFT
#define PDTE_SHIFT 		PDE_SHIFT

#define PTRS_PER_PGDTE 	PTRS_PER_PML4T
#define PTRS_PER_PDMTE 	PTRS_PER_PDPT
#define PTRS_PER_PDTE 	PTRS_PER_PDT
#define PTRS_PER_PTE	PTRS_PER_PT

namespace arch {
	// arch independent paging types
	using pml4e_t = ARCH::pgdte_t; // Page Global Directory Table Entry
	using pdpte_t = ARCH::pdmte_t; // Page Directory Map Table Entry
	using pde_t = ARCH::pdte_t; // Page Directory Table Entry
	
	constexpr auto page_size = PAGE_SIZE;
	constexpr auto large_page_size = LARGE_PAGE_SIZE;
	constexpr auto huge_page_size = HUGE_PAGE_SIZE;
	
	constexpr auto page_shift = PAGE_SHIFT;
	constexpr auto large_page_shift = LARGE_PAGE_SHIFT;
	constexpr auto huge_page_shift = HUGE_PAGE_SHIFT;
	
	constexpr auto pgdte_shift = PGDTE_SHIFT;
	constexpr auto pdmte_shift = PDMTE_SHIFT;
	constexpr auto pdte_shift = PDTE_SHIFT;
	constexpr auto pte_shift = PTE_SHIFT;
	
	constexpr auto ptrs_per_pgdte = PTRS_PER_PDMTE;
	constexpr auto ptrs_per_pdmte = PTRS_PER_PDMTE;
	constexpr auto ptrs_per_pdte = PTRS_PER_PDTE;
	constexpr auto ptrs_per_pte = PTRS_PER_PTE;
}

#endif
