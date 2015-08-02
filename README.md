# the experimental OS project

### to compile the os, follow these steps:

## check prerequisites:
+ you are using GNU/Linux
+ C and C++ compiler: gcc g++
+ genisoimage: make OS iso image(a replacement of mkisofs)
+ qemu/bochs: test OS on virtual machine

> note: the grub bootloader is also needed, its binary can be found in build/prebuilt-binaries/

## instructions
### 1. compile the kernel
> make all
### 2. generate the OS image
> make image
genisoimage is required
### 3. test/debug the OS
#### test
> make run
qemu-system-x86_64 is required
> make debug
bochs debugger is required

