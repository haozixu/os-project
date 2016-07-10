/*
 *	arch/x86_64/mminit.cpp
 *
 *	memory management initialization
 */
#include <memory/mminit.hpp>
#include <memory/lowmem.hpp>
#include <memory/e820map.hpp>

#include <interrupt/apic.hpp>
#include <interrupt/ioapic.hpp>

#include <asm/paging.hpp>
#include <asm/cache.hpp>

#include <lib/algorithm.hpp>
#include <lib/misc.hpp>
#include <lib/string.h>

#include <kernel/kernel.h>
#include <kernel/init.h>
#include <kernel/logging.hpp>

#include <firmware/bios.hpp>

namespace ARCH {

fixed_mapping_info_t fixed_mapping_info;

static inline unsigned e820type_to_fixed_attr(uint32_t type)
{
	return (((type == e820::reserved) | (type == e820::acpi_nvs)) ? 1 : 0);
}

static inline const char* page_size_to_string(unsigned size)
{
	if (size == 1GiB)
		return "1GiB";
	if (size == 2MiB)
		return "2MiB";
	return "4KiB";
}

static void add_bios_data_area_mapping()
{
	mapping_descriptor bios_area;
	bios_area.set(bios_data_area::start, va(bios_data_area::start), 4KiB | 1, 32);
	// range 0xe0000 ~ 0x100000 32 4KiB pages cache disable
	fixed_mapping_info.replace(bios_area);
}

static void add_apic_mmio_mmaping()
{
	// common situation:
	// 0xfec00000 IO APIC
	// 0xfed00000 HPET
	// 0xfee00000 Local APIC (4k)
	mapping_descriptor mmio_area;
	mmio_area.set(IO_APIC::default_base, va(IO_APIC::default_base), 2MiB | 1, 2); 
	// range 0xfec00000 ~ 0xff000000 2 2MiB pages cache disable
	fixed_mapping_info.replace(mmio_area);
}

inline void fixed_mapping_info_t::print() const
{
	for (unsigned i = 0; i < count; ++i) {
		mapping_descriptor &md = this->descs[i];
		kernel::debug::logfl("memory mapping [%lx - %lx) %s page",
			md.virt_addr, md.virt_end(),
			page_size_to_string(static_cast<unsigned>(md.page_attr & PAGE_MASK)));
	}
}

inline int fixed_mapping_info_t::insert(unsigned index, const mapping_descriptor& md)
{
	if (index + 1 >= max_descs)
		return -1;
//	something wrong with memmove ...?
//	memmove(&descs[index + 1], &descs[index], (count - index) * sizeof(mapping_descriptor));
	for (int i = count; i > index; --i) {
		descs[i] = descs[i - 1];
	}
	descs[index] = md;
	return ++count;
}

inline int fixed_mapping_info_t::remove(unsigned index)
{
	if (index >= max_descs)
		return -1;
//	memmove(&descs[index], &descs[index + 1], (count - index) * sizeof(mapping_descriptor));
	for (int i = index; i < count - 1; ++i) {
		descs[i] = descs[i + 1];
	}
	return --count;
}

inline void fixed_mapping_info_t::replace(const mapping_descriptor& md)
{
	unsigned i;

	for (i = 0; i < count; ++i) {
		if (descs[i].phys_addr < md.phys_addr) {
			continue;
		}
		if (descs[i].phys_addr > md.phys_end()) {		
			insert(i, md);
			return;
		}
		while (descs[i].phys_addr >= md.phys_addr && descs[i].phys_end() <= md.phys_end()) {
			remove(i);
		}
		break;
	}
	insert(i, md);
}

void __init init_memory_mapping()
{
#if CONFIG_MAP_ALL_MEMORY == NO
	unsigned long map_end = 
		lib::max(e820map.end_address(e820::available, 4GiB), e820map.end_address(e820::reserved));
#endif

	// allocate space for mapping info
	fixed_mapping_info.descs = lowmem::alloc_page<mapping_descriptor>();
	fixed_mapping_info.count = 0;
	
	for (auto i = 0; i < e820map.num_entries(); ++i) {
#if CONFIG_MAP_ALL_MEMORY == NO
		if (unlikely(e820map[i].end() >= map_end))
			break;
#endif
		split_mapping_range(fixed_mapping_info.descs, fixed_mapping_info.count,
			e820map[i].start(), e820map[i].end(), 
			e820type_to_fixed_attr(e820map[i].type()));
	}
	
	add_bios_data_area_mapping();
	add_apic_mmio_mmaping();
	fixed_mapping_info.print();
	
	init_kernel_physical_mapping();
	
}

void __init split_mapping_range(mapping_descriptor* md, unsigned& nr_descs,
								unsigned long start, unsigned long end, unsigned attr)
{
	unsigned long addr, limit;
	unsigned i;

	addr = start = align_down(start, PAGE_SIZE);
	limit = align_down(end, PAGE_SIZE);

	// head: if not 2M page aligned, use 4K page
	end = align_up(addr, LARGE_PAGE_SIZE);
	if (end > limit)
		end = limit;
	if (start < end) {
		md[nr_descs++].fixed_set(start, end, PAGE_SIZE | attr);
		addr = end;
	}
	
	// 2M page range 
	start = align_up(addr, LARGE_PAGE_SIZE);
	end = align_up(addr, HUGE_PAGE_SIZE);
	if (end > align_down(limit, LARGE_PAGE_SIZE))
		end = align_down(limit, LARGE_PAGE_SIZE);
	if (start < end) {
		md[nr_descs++].fixed_set(start, end, LARGE_PAGE_SIZE | attr);
		addr = end;
	}
	
	// 1G page range
	start = align_up(addr, HUGE_PAGE_SIZE);
	end = align_down(limit, HUGE_PAGE_SIZE);
	if (start < end) {
		md[nr_descs++].fixed_set(start, end, HUGE_PAGE_SIZE | attr);
		addr = end;
	}
	
	// tail is not 1G alignment
	start = align_up(addr, LARGE_PAGE_SIZE);
	end = align_down(limit, LARGE_PAGE_SIZE);
	if (start < end) {
		md[nr_descs++].fixed_set(start, end, LARGE_PAGE_SIZE | attr);
		addr = end;
	}
	
	// tail is not 2M alignment
	start = addr;
	end = limit;
	if (start < end) {
		md[nr_descs++].fixed_set(start, end, PAGE_SIZE | attr);
	}

	for (i = 0; nr_descs > 1 && i < nr_descs - 1; ++i) {
		if ((md[i].virt_addr + md[i].nr_pages * (md[i].page_attr & PAGE_MASK))
			!= md[i + 1].virt_addr || md[i].page_attr != md[i + 1].page_attr)
			continue;
	
		md[i + 1].phys_addr = md[i].phys_addr;
		md[i + 1].virt_addr = md[i].virt_addr;
		md[i + 1].nr_pages += md[i].nr_pages;
		memmove(&md[i], &md[i + 1], (nr_descs - 1 - i) * sizeof(md[i]));
		--i, --nr_descs;		
	}
}

void __init init_kernel_physical_mapping()
{
	pml4e_t *pml4t;
	pdpte_t *pdpt;
	pde_t *pdt;
	pte_t *pt;
	unsigned long pdpte_idx, pde_idx, index;
	unsigned long addr, kpage_flags, flags;
	unsigned int i, j, nr_pgt;
	
	using namespace kernel::debug;
	
	// check flags using x86_64 specific implementation
	int	has_1Gpage = has_1G_pages();	// from asm/paging.hpp
	kpage_flags = PG_P | PG_RW | (PGE_available() ? PG_G : 0);
	
	pdpte_idx = pde_idx = ~0UL;
	
	// default kernel physical mapping is continuous!!!
	// find current PDPT base, skipping PML4T 
	pdpt = reinterpret_cast<pdpte_t*>(PDPT_KERNEL_BASE);
	
	for (i = 0; i < fixed_mapping_info.count; ++i) {
		mapping_descriptor &md = fixed_mapping_info.descs[i];
		unsigned long page_size = md.page_attr & PAGE_MASK;
		unsigned long attr = md.page_attr & ~PAGE_MASK;
		
		VLOG("virt_addr:%p", md.virt_addr);
		index = pdpte_index(md.virt_addr);
		VLOG("pdpte_index:%ld", index);
		if (index == pdpte_idx) {
			goto skip_pdt_alloc;
		}
		
		pdpte_idx = index;
		pde_idx = ~0UL;
		if (page_size == HUGE_PAGE_SIZE) { // 1GiB page
			if (!has_1Gpage) {	//	cpu do not support 1g page
				md.nr_pages *= (HUGE_PAGE_SIZE / LARGE_PAGE_SIZE);	// change 1g pages to 2m pages
				page_size = LARGE_PAGE_SIZE;
				goto use_2m_page;
			}
			
			flags = kpage_flags | PG_PS | PG_RW;
			addr = md.phys_addr;
			for (j = 0; j < md.nr_pages; ++j, addr += HUGE_PAGE_SIZE) {
				pdpt[index + j].val = addr | flags;
				VLOG("pdpte_val:%lx", pdpt[index + j].val);
			}
			continue;
		}
	
	use_2m_page:
		nr_pgt = align_up(md.nr_pages, HUGE_PAGE_SIZE / page_size) / (HUGE_PAGE_SIZE / page_size);
		pdt = lowmem::alloc_pages<pde_t>(nr_pgt);
		VLOG("nr_pages:%u nr_pgt:%u pdt:%p",md.nr_pages, nr_pgt, pdt);
		addr = pa(reinterpret_cast<unsigned long>(pdt));
		for (j = 0; j < nr_pgt; ++j, addr += 4KiB) {
			pdpt[index + j].val = addr | kpage_flags;
			VLOG("pdpte_val:%lx", pdpt[index + j].val);
		}

	skip_pdt_alloc:
		index = pde_index(md.virt_addr);
		VLOG("pde_index:%ld", index);
		if (index == pde_idx) {
			goto skip_pt_alloc;	
		}
		
		pde_idx = index;
		if (page_size == LARGE_PAGE_SIZE) { // 2MiB page
			flags = kpage_flags | PG_PS | PG_RW | (attr ? PG_PCD : 0);
			addr = md.phys_addr;
			for (j = 0; j < md.nr_pages; ++j, addr += LARGE_PAGE_SIZE) {
				pdt[index + j].val = addr | flags;
				VLOG("pde_val:%lx", pdt[index + j].val);
			}
			continue;
		}
		
		nr_pgt = align_up(md.nr_pages, LARGE_PAGE_SIZE / page_size) / (LARGE_PAGE_SIZE / page_size);
		pt = lowmem::alloc_pages<pte_t>(nr_pgt);
		VLOG("nr_pages:%u nr_pgt:%u pt:%p", md.nr_pages, nr_pgt, pt);	
		addr = pa(reinterpret_cast<unsigned long>(pt));
		for (j = 0; j < nr_pgt; ++j, addr += 4KiB) {
			pdt[index + j].val = addr | kpage_flags;
			VLOG("pde_val:%lx", pdt[index + j].val);
		}
		
	skip_pt_alloc:
		index = pte_index(md.virt_addr);
		VLOG("pte_index:%ld", index);
		flags = kpage_flags | (attr ? PG_PCD : 0);
		addr = md.phys_addr;
		for (j = 0; j < md.nr_pages; ++j, addr += PAGE_SIZE) {
			if (is_kernel_text(va(addr), va(addr + PAGE_SIZE))) {
				flags &= ~PG_RW;
			} else if (is_kernel_rodata(va(addr), va(addr + PAGE_SIZE))) {
				flags &= ~PG_RW;
				flags |= PG_XD;
			} else if (is_kernel_data(va(addr), va(addr + PAGE_SIZE))) {
				flags |= PG_XD;
			}
			
			pt[index + j].val = addr | flags;
			VLOG("pte_val:%lx", pt[index + j].val);
		}
	}

	pml4t = reinterpret_cast<pml4e_t*>(PML4T_BASE);
	pml4t[510].val = PHYS_PDPT_KERNEL_BASE | 3;
	pml4t[511].val = PHYS_PDPT_RESERVED_BASE | 3;	
	// ready ?
	flush_tlb();
}

}
