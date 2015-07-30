# main Makefile

ARCH = x86_64

OUTPUT = cdrom
OUTPUT_TARGET = $(OUTPUT)/kernel.bin $(OUTPUT)/g2ldr

# GRUB_PREFIX = grub2
# GRUB_CONFIG = build/grub2/grub.cfg

CC = gcc -std=c99
CXX = g++ -std=c++11

.PHONY: all run debug image kernel_depend kernel boot bootloader clean

image: $(OUTPUT_TARGET)
	genisoimage -R -no-emul-boot -boot-info-table -boot-load-size 4 \
	-b g2ldr -o cdimage.iso $(OUTPUT) 

all: *
	make boot
	make kernel
	make image

run: cdimage.iso
	qemu-system-x86_64 -cdrom cdimage.iso -boot d

debug: cdimage.iso
	bochs -q -f build/config.bxrc

kernel_depend:
	cd kernel; make all

kernel: $(OUTPUT)/kernel.bin

$(OUTPUT)/kernel.bin: build/kernel.a build/head.o build/boot.o
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
	
