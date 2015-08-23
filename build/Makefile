# build/Makefile

OUTPUT = cdrom

BOOT_OBJ = boot.o
KERNEL_OBJ = kernel.a

LD = ld
NM = nm
OBJCOPY = objcopy

.PHONY: all clean

all: kernel.bin ksymbs.map
	cp $^ ../$(OUTPUT)/

kernel.bin: $(BOOT_OBJ) $(KERNEL_OBJ)
	$(LD) -o kernel.elf -T kernel.lds --oformat elf64-x86-64 $(BOOT_OBJ) $(KERNEL_OBJ)
	$(NM) --demangle=auto --target elf64-x86-64 kernel.elf > ksymbs.map
	$(OBJCOPY) -I elf64-x86-64 -O binary kernel.elf kernel.bin

kernel.a:
	cd ../kernel; make all

clean:
	rm -f kernel.bin ksymbs.map $(BOOT_OBJ) $(KERNEL_OBJ)
