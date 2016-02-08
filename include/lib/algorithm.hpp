/*
 *	include/lib/algorithm.hpp
 *
 *	NOT FULLY IMPLEMENTED
 */
#pragma once

namespace lib {

template<typename T>
constexpr const T& max(const T& a, const T& b)
{
	return a > b ? a : b;
}

template<typename T>
constexpr const T& min(const T& a, const T& b)
{
	return a < b ? a : b;
}

}
