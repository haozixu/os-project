# main Makefile

ARCH = x86_64

OUTPUT = cdrom
OUTPUT_TARGET = $(OUTPUT)/kernel.bin $(OUTPUT)/g2ldr

# GRUB_PREFIX = grub2
# GRUB_CONFIG = build/grub2/grub.cfg

PLATFORM =
CC = $(PLATFORM)gcc -std=c99
CXX = $(PLATFORM)g++ -std=c++11

.PHONY: all rebuild config run debug image kernel bootloader doc clean clean_doc clean_all

all:
	make config
	make bootloader
	make kernel
	make image
	
rebuild:
	make clean_all
	make all

image: $(OUTPUT_TARGET)
	genisoimage -R -no-emul-boot -boot-info-table -boot-load-size 4 \
	-input-charset utf-8 -b g2ldr -o cdimage.iso $(OUTPUT) 

config: build/CONFIG.lst
	python build/do_config.py
	ln -f -s ../arch/$(ARCH)/include include/arch
	rm -f arch/$(ARCH)/include/include

run: cdimage.iso
	build/debug/run_qemu.sh

debug: cdimage.iso
	bochs -q -f build/debug/bochs_config.bxrc

kernel:
	cd arch/$(ARCH); make all
	cd kernel; make all
	cd build; make all

bootloader: $(OUTPUT)/g2ldr 

$(OUTPUT)/g2ldr: build/prebuilt-binaries/g2ldr
	cp $< $(OUTPUT)/

#$(OUTPUT)/g2ldr: $(GRUB_CONFIG)
#	cp $(GRUB_CONFIG) $(OUTPUT)/$(GRUB_PREFIX)/
#	grub-mkimage -d /mnt/usr/lib/grub/i386-pc -p /$(GRUB_PREFIX) \
#	-o $(OUTPUT)/g2ldr -O i386-pc-eltorito biosdisk iso9660 multiboot2 normal	


doc:
	doxygen Doxyfile

clean:
	rm -f cdimage.iso $(OUTPUT_TARGET)
	
clean_doc:
	rm -rf document/html document/latex document/doxygen_sqlite3.db
		
clean_all:
	make clean
	cd build; make clean
	cd kernel; make clean
	cd arch/$(ARCH); make clean
	make clean_doc 
