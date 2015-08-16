# arch/x86_64
 
BOOT_OBJS = boot.o

CC = gcc

ASMFLAGS = -I../../include/boot

.PHONY: boot clean

boot.o: boot/boot.S
	$(CC) $(ASMFLAGS) -c $<
	
clean: 
	rm -f $(BOOT_OBJS)

boot: $(BOOT_OBJS)
	cp $^ ../../build/

