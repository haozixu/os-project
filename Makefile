# main Makefile

ARCH = x86_64

OUTPUT = cdrom
OUTPUT_TARGET = $(OUTPUT)/kernel.bin $(OUTPUT)/g2ldr

# GRUB_PREFIX = grub2
# GRUB_CONFIG = build/grub2/grub.cfg

CC = gcc -std=c99
CXX = g++ -std=c++11

.PHONY: all rebuild config run debug image kernel boot bootloader clean clean_all

all: *.*
	make config
	make bootloader
	make boot
	make kernel
	make image
	
rebuild:
	make clean_all
	make all

image: $(OUTPUT_TARGET)
	genisoimage -R -no-emul-boot -boot-info-table -boot-load-size 4 \
	-input-charset utf-8 -b g2ldr -o cdimage.iso $(OUTPUT) 

config: *.*
	build/do_config.py
	ln -f -s ../arch/$(ARCH)/include include/arch
	rm -f arch/$(ARCH)/include/include

run: cdimage.iso
	build/debug/run_qemu.sh

debug: cdimage.iso
	bochs -q -f build/debug/bochs_config.bxrc

kernel: $(OUTPUT)/kernel.bin

$(OUTPUT)/kernel.bin: *.*
	cd build; make all

boot:
	cd arch/$(ARCH); make boot

bootloader: $(OUTPUT)/g2ldr 

$(OUTPUT)/g2ldr: build/prebuilt-binaries/g2ldr
	cp $< $(OUTPUT)/

#$(OUTPUT)/g2ldr: $(GRUB_CONFIG)
#	cp $(GRUB_CONFIG) $(OUTPUT)/$(GRUB_PREFIX)/
#	grub-mkimage -d /mnt/usr/lib/grub/i386-pc -p /$(GRUB_PREFIX) \
#	-o $(OUTPUT)/g2ldr -O i386-pc-eltorito biosdisk iso9660 multiboot2 normal	

clean:
	rm -f cdimage.iso $(OUTPUT_TARGET)
		
clean_all:
	make clean
	cd build; make clean
	cd kernel; make clean
	cd arch/$(ARCH); make clean 
