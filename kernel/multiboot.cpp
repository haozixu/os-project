/*
 *	kernel/multiboot.cpp
 *
 *	multiboot2
 */
#include <boot/multiboot2.h>
#include <boot/multiboot.hpp>

#include <kernel/logging.hpp>

#include <memory/memmap.hpp>

void multiboot2::parse(unsigned long mbi_addr)
{
	for (multiboot_tag* tag = (decltype(tag))(mbi_addr + 8);
		 tag->type != MULTIBOOT_TAG_TYPE_END;
		 tag = (decltype(tag))((char*)(tag) + ((tag->size + 7) & ~7))) {
		//	debug::logfl("multiboot information entry: tag = %u, size = %u", tag->type, tag->size);
			 
			 switch (tag->type) {
			 	case MULTIBOOT_TAG_TYPE_BOOT_LOADER_NAME:
			 		kernel::debug::logfl("boot loader name: %s", reinterpret_cast<multiboot_tag_string*>(tag)->string);
			 		break;
				case MULTIBOOT_TAG_TYPE_MMAP:
					{
						multiboot_tag_mmap* mmap_tag = reinterpret_cast<decltype(mmap_tag)>(tag);
						multiboot_memory_map_t* mmap = mmap_tag->entries;
						
						// store mmap information
						kernel::memory::mmap_info.nr_entries = (mmap_tag->size - 16) / mmap_tag->entry_size;
						kernel::memory::mmap_info.original_map = mmap;
						
						/*
						kernel::debug::logfl("bootloader provided memory map(e820) with %u entries at %p",
								kernel::memory::mmap_info.nr_entries,
								kernel::memory::mmap_info.original_map);
						
						for (;	(char*)(mmap) < (char*)(tag) + tag->size;
								mmap = (decltype(mmap))((unsigned long)(mmap) + reinterpret_cast<multiboot_tag_mmap*>(tag)->entry_size)) {
									kernel::debug::logfl("mmap entry: addr = %016lx, length = %08x, type = %u",
										mmap->addr, mmap->len, mmap->type);
								}
						*/
					}
					break;
				case MULTIBOOT_TAG_TYPE_FRAMEBUFFER:
					{
						multiboot_tag_framebuffer* tagfb = reinterpret_cast<decltype(tagfb)>(tag);
						kernel::debug::logfl("framebuffer physical address: 0x%x", tagfb->common.framebuffer_addr);
					}
					break;
				 default:
				 	break;
			 }
		 }
}