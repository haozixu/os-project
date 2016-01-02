/*
 *	include/lib/bitmap.h
 *
 *	bitmap manipulation
 */
#pragma once

#include <stddef.h>
#include <stdint.h>
#include <string.h>

#define _BITS_PER_LONG (sizeof(long) * 8)

static inline size_t __which_word(size_t pos)
{
	return pos / _BITS_PER_LONG;
}

static inline size_t __which_bit(size_t pos)
{
	return pos % _BITS_PER_LONG;
}

static inline unsigned long mask_bit(size_t pos)
{
	return 1 << __which_bit(pos);
}

static inline size_t bitmap_size(size_t nr_bits)
{
	return (nr_bits - 1) / 8 + 1; // to bytes
}

static inline void bitmap_set(unsigned long* bitmap, size_t pos)
{
	bitmap[__which_word(pos)] |= mask_bit(pos);
}

static inline void bitmap_clear(unsigned long* bitmap, size_t pos)
{
	bitmap[__which_word(pos)] &= ~mask_bit(pos);
}

static inline void bitmap_flip(unsigned long* bitmap, size_t pos)
{
	bitmap[__which_word(pos)] ^= mask_bit(pos);
}

static inline unsigned long bitmap_get(unsigned long* bitmap, size_t pos)
{
	return bitmap[__which_word(pos)] & mask_bit(pos);
}

static inline void bitmap_set_all(unsigned long* bitmap, size_t nr_bits)
{
	memset(bitmap, -1, bitmap_size(nr_bits));
}

static inline void bitmap_clear_all(unsigned long* bitmap, size_t nr_bits)
{
	memset(bitmap, 0, bitmap_size(nr_bits));
}
