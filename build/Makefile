# build/Makefile
ARCH = x86_64

OUTPUT = cdrom

BOOT_OBJS = boot.o
KERNEL_OBJS = kernel.a arch.a

LD = ld
NM = nm
OBJCOPY = objcopy

.PHONY: all clean

all: kernel.bin ksymbs.map
	cp $^ ../$(OUTPUT)/

kernel.bin: $(KERNEL_OBJS) $(BOOT_OBJS)
	$(LD) -o kernel.elf -T ../arch/$(ARCH)/kernel.lds -nostdlib --oformat elf64-x86-64 $(BOOT_OBJS) $(KERNEL_OBJS)
	$(NM) --demangle=auto --target elf64-x86-64 kernel.elf | sort > ksymbs.map
	$(OBJCOPY) -I elf64-x86-64 -O binary kernel.elf kernel.bin

kernel.a:
	cd ../kernel; make all
	
arch.a:
	cd ../arch/$(ARCH); make all

clean:
	rm -f kernel.bin ksymbs.map $(BOOT_OBJS) $(KERNEL_OBJS)
