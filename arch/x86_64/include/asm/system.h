/*
 * arch/x86_64/include/asm/system.h
 *
 * x86 system data structures etc
 */
#ifndef _ASM_SYSTEM_H
#define _ASM_SYSTEM_H

#include <stdint.h>
#include <compiler.h>

// x86 segment/system descriptor
typedef struct descriptor {
	union {
		uint64_t desc;
		struct {
			uint16_t limit0;
			uint16_t base0;
			unsigned base1: 8, type: 4, s: 1, dpl: 2, p: 1;
			unsigned limit: 4, avl: 1, l: 1, d: 1, g: 1, base2: 8;
		};
	};
}__packed descriptor_t;

typedef struct selector {
	union {
		uint16_t sel;
		struct {
			unsigned rpl: 2, ti: 1, index: 13;
		};
	};
}__packed selector_t;

typedef struct gate64 {
	union {
		uint64_t gate;
		struct {
			uint16_t offset_low;
			uint16_t selector;
			unsigned ist: 3, zero0: 5, type: 5, dpl: 2, p: 1;
			uint16_t offset_middle;
			uint32_t offset_high;
			uint32_t zero1;
		};
	};
}__packed gate_t;

typedef struct {
	union {
		uint64_t desc;
		struct {
			uint16_t limit0;
			uint16_t base0;
			unsigned base1: 8, type: 5, dpl: 2, p: 1;
			unsigned limit1: 4, zero0: 3, g: 1, base2: 8;
			uint32_t base3;
			uint32_t zero1;
		};
	};
}__packed ldt_desc_t, tss_desc_t;

struct dt_ptr {
	uint16_t size;
	uint32_t addr;
};

enum {
	GATE_INTERRUPT = 0xE,
	GATE_TRAP = 0xF,
	GATE_CALL = 0xC,
	GATE_TASK = 0x5
};

enum {
	DESC_TSS = 0x9,
	DESC_LDT = 0x2,
	DESC_SEG = 0x10,  /* !system */
};

static always_inline void __lgdt(uint16_t size, uint32_t addr)
{
	struct dt_ptr desc_ptr;
	desc_ptr.size = size;
	desc_ptr.addr = addr;
	asm volatile("lgdt %0"::"m"(desc_ptr));
}

static always_inline void __lgdt0(struct dt_ptr desc_ptr)
{
	asm volatile("lgdt %0"::"m"(desc_ptr));
}

static always_inline void __lidt(uint16_t size, uint32_t addr)
{
	struct dt_ptr desc_ptr;
	desc_ptr.size = size;
	desc_ptr.addr = addr;
	asm volatile("lidt %0"::"m"(desc_ptr));
}

static always_inline void __lidt0(struct dt_ptr desc_ptr)
{
	asm volatile("lidt %0"::"m"(desc_ptr));
}

static always_inline void __lldt(uint16_t size, uint32_t addr)
{
	struct dt_ptr desc_ptr;
	desc_ptr.size = size;
	desc_ptr.addr = addr;
	asm volatile("lldt %0"::"m"(desc_ptr));
}

static always_inline void __lldt0(struct dt_ptr desc_ptr)
{
	asm volatile("lldt %0"::"m"(desc_ptr));
}

static always_inline void __ltr(uint16_t selector)
{
	asm volatile("ltrw %0"::"r"(selector));
}


#endif
