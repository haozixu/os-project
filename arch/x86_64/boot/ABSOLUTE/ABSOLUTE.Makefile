# arch/x86_64/boot

boot.o: boot.S
	gcc -I../../../include/boot -c $<

boot.2.o: boot.2.c
	gcc -m32 -ffreestanding -nostdlib -O2 -I../../../include -c $<
	
.PHONY: test clean
clean: 
	rm -f boot.o boot.2.o

test: boot.o boot.2.o
	objcopy -O elf64-x86-64 boot.2.o boot.2.o
	cp $^ ../../../cdrom/
	ld -T../../../build/kernel.lds -s --oformat binary -o ../../../cdrom/kernel.txt ../../../cdrom/boot.o ../../../cdrom/boot.2.o

