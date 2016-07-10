# arch/x86_64/Makefile

PLATFORM =
ASM = $(PLATFORM)gcc
CXX = $(PLATFORM)g++ -std=c++11

CXXFLAGS = -m64 -O2 -mcmodel=large -ffreestanding -fno-strict-aliasing -Iinclude -I../../include -DARCH=x86_64 -w
CXXFLAGS += -fno-exceptions -fno-rtti -fno-threadsafe-statics

ASMFLAGS = -I../../include

ARCH_CXX_SRC = $(wildcard *.cpp)
ARCH_CXX_SRC += $(wildcard kernel/*.cpp)
ARCH_CXX_SRC += $(wildcard memory/*.cpp)
ARCH_ASM_SRC = $(wildcard *.S)
ARCH_ASM_SRC += $(wildcard lib/*.S)

ARCH_OBJS = $(patsubst %.cpp,%.o,$(ARCH_CXX_SRC))
ARCH_OBJS += $(patsubst %.S,%.o,$(ARCH_ASM_SRC))

.PHONY: all clean

%.o: %.S
	$(ASM) $(ASMFLAGS) -c -o $@ $<

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

all: arch.a boot.o
	cp $^ ../../build/
	
arch.a: $(ARCH_OBJS)
	ar rcs $@ $^

boot.o: boot/boot.S
	$(ASM) $(ASMFLAGS) -c -o $@ $<

clean: 
	rm -f arch.a boot.o $(ARCH_OBJS) 
