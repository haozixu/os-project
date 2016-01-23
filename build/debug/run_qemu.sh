qemu-system-x86_64 -cdrom cdimage.iso -boot d \
	-m 4G -smp 4,sockets=1,cores=2 -cpu Haswell -serial stdio
