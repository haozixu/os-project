/*
 *	include/lib/sort.hpp
 *
 *	heap sort
 */
#pragma once

//#include <stddef.h>
//#include <util/utility.hpp> // doesn't exist yet
namespace lib {

// we need move_swap
template<typename T>
void __copy_swap(T& a, T& b)
{
	T t = a;
	a = b;
	b = t;
}

template<typename T>
int __less(T& a, T& b)
{
	return a - b;
}

template<typename T>
void sort(T* data, unsigned num, 
		int (*cmp)(T& a, T& b) = __less,
		void (*swap)(T&, T&) = __copy_swap)
{
	int c, r, i = num / 2 - 1;

	for ( ; i >= 0; i--) {
		for (r = i; r * 2 + 1 < num; r = c) {
			c = r * 2 + 1;
			if (c < num - 1 && cmp(data[c], data[c + 1]) < 0)
				++c;
			if (cmp(data[r], data[c]) >= 0)
				break;
			swap(data[r], data[c]);
		}
	}

	for (i = num - 1; i > 0; i--) {
		swap(data[0], data[i]);
		for (r = 0; r * 2 + 1 < i; r = c) {
			c = r * 2 + 1;
			if (c < i - 1 && cmp(data[c], data[c + 1]) < 0)
				++c;
			if (cmp(data[r], data[c]) >= 0)
				break;
			swap(data[r], data[c]);
		}
	}
}

}


