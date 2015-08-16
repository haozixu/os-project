# kernel makefile

CXX = g++ -std=c++11

CXXFLAGS = -m64 -O2 -ffreestanding -fno-exception -fno-rtti -fno-strict-aliasing -mno-red-zone -mcmodel=kernel -nostdlib -DARCH=x86_64

.PHONY: all

all: kernel.a

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $<

kernel.a: *.o
	ar rcs $@ $^
