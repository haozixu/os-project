# arch/x86_64
 
BOOT_OBJS = head.o boot.o

CC = gcc
OBJCOPY = objcopy

CFLAGS = -m32 -Os -ffreestanding -I../../include
ASMFLAGS = -I../../include/boot

.PHONY: boot clean

head.o: boot/head.S
	$(CC) $(ASMFLAGS) -c $<

boot.o: boot/boot.c
	$(CC) $(CFLAGS) -c $<
	
clean: 
	rm -f $(BOOT_OBJS)

boot: $(BOOT_OBJS)
	$(OBJCOPY) -O elf64-x86-64 boot.o boot.o
	cp $^ ../../build/

