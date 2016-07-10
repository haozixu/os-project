# A personal experimental OS project (just for fun :-)

### to compile the OS, follow these steps:

## check prerequisites:
+ you are using GNU/Linux
+ C and C++ compiler: gcc g++
+ genisoimage: make kernel/OS iso image(a replacement of mkisofs)
+ python: to do some configuration work
+ qemu/bochs: test OS on virtual machines

> note: the grub bootloader is also needed, its binary can be found in build/prebuilt-binaries/

## instructions
### 1. compile the kernel and generate a bootable CD image
> *make all*

note: genisoimage is required, if you want to rebuild it, type *make rebuild*

### 2. test/debug the OS
#### test
> *make run*

note: qemu-system-x86_64 is required

> *make debug* 

note: bochs debugger is required

