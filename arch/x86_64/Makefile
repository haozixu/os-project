# arch/x86_64
 
BOOT_OBJS = boot/boot.o boot/boot.2.o

CC = gcc -std=c99
OBJCOPY = objcopy

CFLAGS = -m32 -O1 -ffreestanding -I../../include
ASMFLAGS = -I../../include/boot

.PHONY: boot clean

boot/boot.o: boot/boot.S
	gcc $(ASMFLAGS) -c $<

boot/boot.2.o: boot/boot.2.c
	gcc $(CFLAGS) -c $<
	
clean: 
	rm -f $(BOOT_OBJS)

boot: boot/boot.o boot/boot.2.o
	$(OBJCOPY) -O elf64-x86-64 boot/boot.2.o boot/boot.2.o
	cp $^ ../../build/

