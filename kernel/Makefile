# kernel makefile

CXX = g++ -std=c++11
CXXFLAGS = -ffreestanding -nostdlib -fno-strict-aliasing -I../include

# configurations
ARCH = x86_64
OPTIMIZE_LEVEL = LEVEL2
HAVE_EXT_FEATURE = NO

ifeq ($(ARCH),x86_64)
	CXXFLAGS += -m64 -I../arch/x86_64/include -DARCH=x86_64 -mcmodel=large -mno-red-zone
endif

ifeq ($(OPTIMIZE_LEVEL),LEVEL2)
	CXXFLAGS += -O2
else
ifeq ($(OPTIMIZE_LEVEL),SIZE)
	CXXFLAGS += -Os
endif
endif

ifeq ($(HAVE_EXT_FEATURE),NO)
	CXXFLAGS += -fno-exceptions -fno-rtti
endif

KERNEL_SRC = $(wildcard *.cpp) $(wildcard debug/*.cpp)
KERNEL_OBJS = $(patsubst %.cpp,%.o,$(KERNEL_SRC))

.PHONY: all clean

all: kernel.a
	cp $^ ../build/

kernel.a: $(KERNEL_OBJS)
	ar rcs $@ $(KERNEL_OBJS)

clean:
	rm -f kernel.a $(KERNEL_OBJS)

