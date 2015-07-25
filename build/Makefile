# build/Makefile

OUTPUT = cdrom

BOOT_OBJS = boot.o boot.2.o
# KERNEL_OBJS = kernel.a

LD = ld

.PHONY: all clean

all: kernel.bin kernel.map
	cp $^ ../$(OUTPUT)/

kernel.bin:
	$(LD) -o $@ -T kernel.lds -Map kernel.map --oformat binary $(BOOT_OBJS) $(KERNEL_OBJS)

clean:
	rm -f kernel.bin kernel.map $(BOOT_OBJS) $(KERNEL_OBJS)
