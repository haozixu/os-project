# arch/x86_64

CC = gcc
ASMFLAGS = -I../../include/boot
CXX = g++ -std=c++11
CXXFLAGS = -m64 -O2 -mcmodel=large -ffreestanding -fno-strict-aliasing -Iinclude -I../../include
CXXFLAGS += -fno-exceptions -fno-rtti

ARCH_CXX_SRC = $(wildcard *.cpp)

ARCH_OBJS =  $(patsubst %.cpp,%.o,$(ARCH_CXX_SRC))
BOOT_OBJS = boot.o

.PHONY: all boot clean

%o: %.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

boot.o: boot/boot.S
	$(CC) $(ASMFLAGS) -c $<

boot: $(BOOT_OBJS)
	cp $^ ../../build/

all: arch.a
	cp $^ ../../build/
	
arch.a: $(ARCH_OBJS)
	ar rcs $@ $^

clean: 
	rm -f arch.a $(BOOT_OBJS) $(ARCH_OBJS)
	
