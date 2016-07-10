/*
 *	include/lib/bitmap.h
 *
 *	bitmap manipulation (bitops)
 */
#pragma once

#include <stddef.h>
#include <string.h>
//#include <stdbool.h>

#include <arch/cpu/bitwidth.hpp>

// note: when giving range begin & end, it means [begin, end)

static inline size_t __which_word(size_t pos)
{
	return pos / BITS_PER_LONG;
}

static inline size_t __which_bit(size_t pos)
{
	return pos % BITS_PER_LONG;
}

static inline size_t __align_up(size_t n, size_t alignment)
{
	return (n + alignment - 1) & (size_t)(-alignment);
}

static inline size_t __align_down(size_t n, size_t alignment)
{
	return n & (size_t)(-alignment);
}

static inline unsigned long mask_bit(size_t pos)
{
	return 1 << __which_bit(pos);
}

static inline size_t bitmap_size(size_t nr_bits)
{
	return (nr_bits - 1) / 8 + 1; // byte
}

static inline size_t bitmap_length(size_t nr_bits)
{
	return (nr_bits - 1) / BITS_PER_LONG + 1; // long
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

static inline unsigned long bitmap_get(const unsigned long* bitmap, size_t pos)
{
	return bitmap[__which_word(pos)] & mask_bit(pos);
}

static inline unsigned long bitmap_get_and_set(unsigned long* bitmap, size_t pos)
{
	unsigned long ret = bitmap_get(bitmap, pos);
	bitmap_set(bitmap, pos);
	return ret;
}

static inline unsigned long bitmap_get_and_clear(unsigned long* bitmap, size_t pos)
{
	unsigned long ret = bitmap_get(bitmap, pos);
	bitmap_clear(bitmap, pos);
	return ret;
}

static inline unsigned long bitmap_get_and_flip(unsigned long* bitmap, size_t pos)
{
	unsigned long ret = bitmap_get(bitmap, pos);
	bitmap_flip(bitmap, pos);
	return ret;
}

static inline void bitmap_set_all(unsigned long* bitmap, size_t nr_bits)
{
	memset(bitmap, ~0, bitmap_size(nr_bits));
}

static inline void bitmap_clear_all(unsigned long* bitmap, size_t nr_bits)
{
	memset(bitmap, 0, bitmap_size(nr_bits));
}

static inline void bitmap_set_range(unsigned long* bitmap, size_t begin, size_t end)
{
	size_t front, back;
	front = __align_up(begin, BITS_PER_LONG);
	back = __align_down(end, BITS_PER_LONG);

	if (front > back) {
		/* overlap:  (high)|front...end...begin...back|(low) */
		size_t mask = (~0UL << __which_bit(begin)) & (~0UL >> (BITS_PER_LONG - __which_bit(end)));
		bitmap[__which_word(begin)] |= mask;
		return;
	}
	if (begin < front) {
		bitmap[__which_word(begin)] |= (~0UL << __which_bit(begin));
	}
	if (back < end) {
		bitmap[__which_word(back)] |= (~0UL >> (BITS_PER_LONG - __which_bit(end)));
	}
	if (front < back) {
		for (size_t i = __which_word(front); i < __which_word(back); ++i) 
			bitmap[i] = ~0UL;
	}
}

static inline void bitmap_clear_range(unsigned long* bitmap, size_t begin, size_t end)
{
	size_t front, back;
	front = __align_up(begin, BITS_PER_LONG);
	back = __align_down(end, BITS_PER_LONG);

	if (front > back) {
		size_t mask = (~0UL >> (BITS_PER_LONG - __which_bit(begin))) | (~0UL << __which_bit(end));
		bitmap[__which_word(begin)] &= mask;
		return;
	}
	if (begin < front) {
		bitmap[__which_word(begin)] &= (~0UL >> (BITS_PER_LONG - __which_bit(begin)));
	}
	if (back < end) {
		bitmap[__which_word(back)] &= (~0UL << __which_bit(end));
	}
	if (front < back) {
		for (size_t i = __which_word(front); i < __which_word(back); ++i)
			bitmap[i] = 0UL;
	}
}

static inline bool bitmap_range_is_set(const unsigned long* bitmap, size_t begin, size_t end)
{
	size_t front, back;
	front = __align_up(begin, BITS_PER_LONG);
	back = __align_down(end, BITS_PER_LONG);

	if (front > back) {
		size_t mask = (~0UL << __which_bit(begin)) & (~0UL >> (BITS_PER_LONG - __which_bit(end)));
		return !((~bitmap[__which_word(begin)]) & mask);
	}
	if (begin < front) {
		if ((~bitmap[__which_word(begin)]) & (~0UL << __which_bit(begin)))
			return false;
	}
	if (back < end) {
		if ((~bitmap[__which_word(back)]) & (~0UL >> (BITS_PER_LONG - __which_bit(end))))
			return false;
	}
	if (front < back) {
		for (size_t i = __which_word(front); i < __which_word(back); ++i) {
			if (~bitmap[i])
				return false;
		}
	}
	
	return true;	
}

static inline bool bitmap_range_is_zero(const unsigned long* bitmap, size_t begin, size_t end)
{
	size_t front, back;
	front = __align_up(begin, BITS_PER_LONG);
	back = __align_down(end, BITS_PER_LONG);

	if (front > back) {
		size_t mask = (~0UL << __which_bit(begin)) & (~0UL >> (BITS_PER_LONG - __which_bit(end)));
		return !(bitmap[__which_word(begin)] & mask);
	}
	if (begin < front) {
		if (bitmap[__which_word(begin)] & (~0UL << __which_bit(begin)))
			return false;
	}
	if (back < end) {
		if (bitmap[__which_word(back)] & (~0UL >> (BITS_PER_LONG - __which_bit(end))))
			return false;
	}
	if (front < back) {
		for (size_t i = __which_word(front); i < __which_word(back); ++i) {
			if (bitmap[i])
				return false;
		}
	}
	
	return true;	
}  

static inline void bitmap_set_bits(unsigned long* bitmap, size_t pos, size_t nr_bits)
{
	bitmap_set_range(bitmap, pos, pos + nr_bits);
}

static inline void bitmap_clear_bits(unsigned long* bitmap, size_t pos, size_t nr_bits)
{
	bitmap_clear_range(bitmap, pos, pos + nr_bits);
}

static inline size_t bitmap_find_first_bit(const unsigned long* bitmap)
{
	size_t pos, i = 0;
	while (1) {
		pos = __builtin_ffsl(bitmap[i]);
		if (pos)
			return i * BITS_PER_LONG + pos - 1;
		++i;
	}
}

static inline void bitmap_clear_first_bit(unsigned long* bitmap, size_t words_limit)
{
	size_t pos, i = 0;
	do {
		pos = __builtin_ffsl(bitmap[i]);
		if (pos) {
			bitmap[i] &= ~(1 << (pos - 1));
			return;
		}
		++i;
	} while (i < words_limit);
}

static inline void bitmap_clear_first_bits(unsigned long* bitmap, size_t nr_bits, size_t words_limit)
{
	size_t pos, i = 0;
	do {
		pos = __builtin_ffsl(bitmap[i]);
		if (pos) {
			bitmap_clear_bits(bitmap, i * BITS_PER_LONG + pos - 1, nr_bits);
			return;
		}
		++i;
	} while (i < words_limit);
}

static inline size_t bitmap_find_first_zero_bit(const unsigned long* bitmap)
{
	size_t pos, i = 0;
	while (1) {
		pos = __builtin_ffsl(~bitmap[i]);
		if (pos)
			return i * BITS_PER_LONG + pos - 1;
		++i;
	}
}

static inline void bitmap_set_first_zero_bit(unsigned long* bitmap, size_t words_limit)
{
	size_t pos, i = 0;
	do {
		pos = __builtin_ffsl(~bitmap[i]);
		if (pos) {
			bitmap[i] |= (1 << (pos - 1));
			return;
		}
		++i;
	} while (i < words_limit);
}

static inline void bitmap_set_first_zero_bits(unsigned long* bitmap, size_t nr_bits, size_t words_limit)
{
	size_t pos, i = 0;
	do {
		pos = __builtin_ffsl(~bitmap[i]);
		if (pos) {
			bitmap_set_bits(bitmap, i * BITS_PER_LONG + pos - 1, nr_bits);
			return;
		}
		++i;
	} while (i < words_limit);
}

static inline size_t bitmap_count_bits(const unsigned long* bitmap, size_t words_limit)
{
	size_t result = 0;
	for (size_t i = 0; i < words_limit; ++i) {
		result += __builtin_popcountl(bitmap[i]);
	}
	return result;
}

static inline size_t bitmap_count_zero_bits(const unsigned long* bitmap, size_t words_limit)
{
	size_t result;
	for (size_t i = 0; i < words_limit; ++i) {
		result += __builtin_popcountl(~bitmap[i]);
	}
	return result;
}
