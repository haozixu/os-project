# arch/x86_64
 
BOOT_OBJS = boot.o boot.2.o

CC = gcc -std=c99
OBJCOPY = objcopy

CFLAGS = -m32 -O1 -ffreestanding -I../../include
ASMFLAGS = -I../../include/boot

.PHONY: boot clean

boot.o: boot/boot.S
	gcc $(ASMFLAGS) -c $<

boot.2.o: boot/boot.2.c
	gcc $(CFLAGS) -c $<
	
clean: 
	rm -f $(BOOT_OBJS)

boot: $(BOOT_OBJS)
	$(OBJCOPY) -O elf64-x86-64 boot.2.o boot.2.o
	cp $^ ../../build/

