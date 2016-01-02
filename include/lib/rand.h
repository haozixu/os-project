/*
 *	include/lib/rand.h
 *
 *	kernel RNG
 */
#pragma once

#ifdef __cplusplus
extern "C" {
#endif

void srand(int seed);
int rand();

#ifdef __cplusplus
}
#endif

