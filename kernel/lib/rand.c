/*
 *	kernel/lib/rand.c
 *
 *	kernel RNG using Mesenne Twister (mt19937-32)
 */
#include <lib/kstdlib.h>

static int initialized, index, MT[624];

void srand(int seed)
{
	int i;

	initialized = 1; // true
	index = 0;
	MT[0] = seed;

	for (i = 0; i < 624; ++i) {
		MT[i] = 1812433253 * (MT[i - 1] ^ (MT[i - 1] >> 30)) + i;
	}
}

static void generate()
{
	int i, y;

	for (i = 0; i < 624; ++i) {
		y = (MT[i] & 0x80000000) + (MT[(i + 1) % 624] & 0x7fffffff);
		MT[i] = MT[(i + 397) % 624] ^ (y >> 1);
		if (y & 1)
			MT[i] ^= 2567483615;
	}
}

int rand()
{
	if (!initialized)
		srand(0xdeadbeef);
	if (index == 0)
		generate();

	int y = MT[index];
	y = y ^ (y >> 11);
	y = y ^ ((y << 7) & 2636928640);
	y = y ^ ((y << 15) & 4022730752);
	y = y ^ (y >> 18);

	index = (index + 1) % 624;

	return y;
}

