# build/Makefile

OUTPUT = cdrom

BOOT_OBJS = boot.o
KERNEL_OBJS = kernel.a

LD = ld
NM = nm
OBJCOPY = objcopy

.PHONY: all clean

all: kernel.bin ksymbs.map
	cp $^ ../$(OUTPUT)/

kernel.bin: $(BOOT_OBJS) $(KERNEL_OBJS)
	$(LD) -o kernel.elf -T kernel.lds --oformat elf64-x86-64 $(BOOT_OBJS)
	$(NM) --demangle=auto --target elf64-x86-64 kernel.elf > ksymbs.map
	$(OBJCOPY) -I elf64-x86-64 -O binary kernel.elf kernel.bin

clean:
	rm -f kernel.bin kernel.map $(BOOT_OBJS) $(KERNEL_OBJS)
