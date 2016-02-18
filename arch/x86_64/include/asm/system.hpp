/*
 * arch/x86_64/include/asm/system.hpp
 *
 * x86 system data structures etc
 */
#pragma once

#include <stdint.h>
#include <compiler.h>

namespace ARCH {

// x86 segment/system descriptor
typedef struct descriptor {
	union {
		uint64_t val;
		struct {
			uint16_t limit0;
			uint16_t base0;
			unsigned base1: 8, type: 4, system: 1, dpl: 2, present: 1;
			unsigned limit: 4, available: 1, long_mode: 1, db: 1, granularity: 1, base2: 8;
		}__packed;
	};
}__packed descriptor_t;

typedef struct selector {
	union {
		uint16_t val;
		struct {
			unsigned rpl: 2, table_indicator: 1, index: 13;
		}__packed;
	};
}__packed selector_t;

typedef struct gate64 {
	union {
		__uint128_t val;
		struct {
			uint16_t offset_low;
			uint16_t selector;
			unsigned ist: 3, zero0: 5, type: 5, dpl: 2, present: 1;
			uint16_t offset_middle;
			uint32_t offset_high;
			uint32_t zero1;
		}__packed;
	};
}__packed gate_t;

typedef struct {
	union {
		__uint128_t val;
		struct {
			uint16_t limit0;
			uint16_t base0;
			unsigned base1: 8, type: 5, dpl: 2, present: 1;
			unsigned limit1: 4, zero0: 3, granularity: 1, base2: 8;
			uint32_t base3;
			uint32_t zero1;
		}__packed;
	};
}__packed ldttss_desc_t, ldt_desc_t, tss_desc_t;

struct table_ptr {
	uint16_t size;
	unsigned long addr;
}__packed;

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

static __always_inline void lgdt(uint16_t size, unsigned long addr)
{
	struct table_ptr desc_ptr;
	desc_ptr.size = size;
	desc_ptr.addr = addr;
	asm volatile ("lgdt %0"::"m"(desc_ptr));
}

static __always_inline void lgdt(const struct table_ptr *desc_ptr)
{
	asm volatile ("lgdt (%0)"::"r"(desc_ptr));
}

static __always_inline void lidt(uint16_t size, unsigned long addr)
{
	struct table_ptr desc_ptr;
	desc_ptr.size = size;
	desc_ptr.addr = addr;
	asm volatile ("lidt %0"::"m"(desc_ptr));
}

static __always_inline void lidt(const struct table_ptr *desc_ptr)
{
	asm volatile ("lidt (%0)"::"r"(desc_ptr));
}

static __always_inline void lldt(uint16_t size, unsigned long addr)
{
	struct table_ptr desc_ptr;
	desc_ptr.size = size;
	desc_ptr.addr = addr;
	asm volatile ("lldt %0"::"m"(desc_ptr));
}

static __always_inline void lldt(const struct table_ptr *desc_ptr)
{
	asm volatile ("lldt (%0)"::"r"(desc_ptr));
}

static __always_inline void ltr(uint16_t selector)
{
	asm volatile ("ltrw %0"::"r"(selector));
}

}
