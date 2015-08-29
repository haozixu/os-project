#include <boot/multiboot2.h>
#include <kernel/kernel.h>
#include <kernel/icxxabi.h>
#include <kernel/init.h>
#include <kernel/main.hpp>
#include <kernel/debug.hpp>
#include <kernel/log.hpp>

#include <arch/init.hpp>

using namespace kernel;

extern "C" void __kernel_pre_start(unsigned long mbi_addr, unsigned long arch_data)
{
	debug::log("[LOG] kernel starting.\n");
	debug::log_format("multiboot information found at 0x%llx, size %u bytes.\n", 
		               mbi_addr, *(uint32_t*)(mbi_addr));
	arch::pre_init(arch_data);
	
	for (multiboot_tag* tag = (decltype(tag))(mbi_addr + 8);
		 tag->type != MULTIBOOT_TAG_TYPE_END;
		 tag = (decltype(tag))((uint8_t*)(tag) + ((tag->size + 7) & ~7))) {
		//	debug::log_format("multiboot information entry: tag = %u, size = %u\n", tag->type, tag->size);
			 
			 switch (tag->type) {
			 	case MULTIBOOT_TAG_TYPE_BOOT_LOADER_NAME:
			 		debug::log_format("boot loader name: %s\n", reinterpret_cast<multiboot_tag_string*>(tag)->string);
			 		break;
				case MULTIBOOT_TAG_TYPE_MMAP:
					{
						multiboot_memory_map_t* mmap;
						
						debug::log("[LOG] E820 memory map:\n");
						
						for (mmap = reinterpret_cast<multiboot_tag_mmap*>(tag)->entries;
								(char*)(mmap) < (char*)(tag) + tag->size;
								mmap = (decltype(mmap))((unsigned long)(mmap) + reinterpret_cast<multiboot_tag_mmap*>(tag)->entry_size)) {
									debug::log_format("mmap entry: addr = 0x%08llx, length = 0x%08llx, type = %u\n",
										mmap->addr, mmap->len, mmap->type);
								}
					}
					break;
				case MULTIBOOT_TAG_TYPE_FRAMEBUFFER:
					{
						multiboot_tag_framebuffer* tagfb = reinterpret_cast<decltype(tagfb)>(tag);
						debug::log_format("frambebuffer physical address: 0x%x\n", tagfb->common.framebuffer_addr);
					}
					break;
				 default:
				 	break;
			 }
		 }
	// init_percpu_section();
	kernel::main();
}


void kernel::main()
{
//	arch::init();

hang:
	goto hang;
}

void kernel::exit(int status)
{
	__cxa_finalize(nullptr);
}

