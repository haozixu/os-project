# kernel makefile

CXX = g++ -std=c++11
CXXFLAGS = -ffreestanding -fno-strict-aliasing -I../include
CC = gcc -std=gnu99
CFLAGS = -ffreestanding -fno-strict-aliasing -I../include

# configurations
ARCH = x86_64
OPTIMIZE_LEVEL = LEVEL2
HAVE_EXT_FEATURE = NO

ifeq ($(ARCH),x86_64)
	CXXFLAGS += -m64 -I../arch/x86_64/include -DARCH=x86_64 -mcmodel=large -mno-red-zone
	CFLAGS += -m64 -I../arch/x86_64/include -DARCH=x86_64 -mcmodel=large -mno-red-zone
endif

ifeq ($(OPTIMIZE_LEVEL),LEVEL2)
	CXXFLAGS += -O2
	CFLAGS += -O0
else
ifeq ($(OPTIMIZE_LEVEL),SIZE)
	CXXFLAGS += -Os
	CFLAGS += -O0
endif
endif

ifeq ($(HAVE_EXT_FEATURE),NO)
	CXXFLAGS += -fno-exceptions -fno-rtti
endif

KERNEL_CXX_SRC = $(wildcard *.cpp) $(wildcard debug/*.cpp)
KERNEL_C_SRC = $(wildcard lib/*.c)

KERNEL_OBJS = $(patsubst %.cpp,%.o,$(KERNEL_CXX_SRC))
KERNEL_OBJS += $(patsubst %.c,%.o,$(KERNEL_C_SRC))

.PHONY: all clean

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<
	
%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

all: kernel.a
	cp $^ ../build/

kernel.a: $(KERNEL_OBJS)
	ar rcs $@ $^

clean:
	rm -f kernel.a $(KERNEL_OBJS)

