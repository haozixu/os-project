/**
 *	@file arch/x86_64/include/memory/pgtable.hpp
 *
 *	@brief arch paging related stuff
 */
#pragma once

#include <memory/address.hpp>

namespace ARCH {

	// PAGE_OFFSET = 0xffffff0000000000UL;
	/*
	 * actually, KERNEL_BASE = PHYS_KERNEL_BASE + PAGE_OFFSET
	 * so equally PAGE_OFFSET = KERNEL_PAGE - PHYS_KERNEL_BASE
	 * MAKE SURE THE RELATIONSHIP IS CORRECT!
	 */
	constexpr auto PHYS_PML4T_BASE = 0x2000UL;
	constexpr auto PHYS_PDPT_USER_BASE = 0x3000UL;
	constexpr auto PHYS_PDPT_KERNEL_BASE = 0x4000UL;
	constexpr auto PHYS_PDPT_RESERVED_BASE = 0x5000UL;
	constexpr auto PHYS_PDT_USER_BASE = 0x6000UL; // length 8K

	constexpr auto PML4T_BASE = PHYS_PML4T_BASE + PAGE_OFFSET;
	constexpr auto PDPT_USER_BASE = PHYS_PDPT_USER_BASE + PAGE_OFFSET;
	constexpr auto PDPT_KERNEL_BASE = PHYS_PDPT_KERNEL_BASE + PAGE_OFFSET;
	constexpr auto PDPT_RESERVED_BASE = PHYS_PDPT_RESERVED_BASE + PAGE_OFFSET;
	constexpr auto PDT_USER_BASE = PHYS_PDT_USER_BASE + PAGE_OFFSET;

	constexpr auto SIGN_SHIFT = 48;
	constexpr auto PML4E_SHIFT = 39;
	constexpr auto PGDTE_SHIFT = 39;
	constexpr auto PDPTE_SHIFT = 30;
	constexpr auto PDE_SHIFT = 21;
	constexpr auto PTE_SHIFT = 12;
	
	constexpr auto PAGE_SIZE = 1U << PTE_SHIFT;			// 4k page
	constexpr auto LARGE_PAGE_SIZE = 1U << PDE_SHIFT; 	// 2m page
	constexpr auto HUGE_PAGE_SIZE = 1U << PDPTE_SHIFT;	// 1g page
	
	constexpr auto PAGE_MASK = ~(PAGE_SIZE - 1);
	constexpr auto PTE_MASK = ~((1UL << PTE_SHIFT) - 1);
	constexpr auto PDE_MASK = ~((1UL << PDE_SHIFT) - 1);
	constexpr auto PDPTE_MASK = ~((1UL << PDPTE_SHIFT) - 1);
	constexpr auto PGDTE_MASK = ~((1UL << PGDTE_SHIFT) - 1);
	constexpr auto PML4E_MASK = ~((1UL << PML4E_SHIFT) - 1);
	constexpr auto SIGN_MASK = ~((1UL << SIGN_SHIFT) - 1);

	constexpr auto PTRS_PER_PML4T = 512;
	constexpr auto PTRS_PER_PGDT = 512;
	constexpr auto PTRS_PER_PDPT = 512;
	constexpr auto PTRS_PER_PDT = 512;
	constexpr auto PTRS_PER_PT = 512;
}