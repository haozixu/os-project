/*
 *	kernel/lib/kitoa.c
 *
 *	kernel library
 */
#include <lib/kitoa.h>

/*
 * note: the kernel only use radix 2, 8, 10, 16, 
 * so this is not the full implementation.
 */

char * kuitoa(unsigned int num, char *buf, unsigned int radix)
{
	char *p = buf, *q;
	
	do {
		*p++ = "0123456789abcdef"[num % radix];
		num /= radix;
	} while (num > 0);
	
	*p = '\0';
	q = p - 1;
	p = buf;
	
	while (q > p) {
		char tmp = *p;
		*p++ = *q;
		*q-- = tmp;
	}
	
	return buf;
}

char * kitoa(int num, char *buf, unsigned int radix)
{
	if (radix == 10 && num < 0) {
		*buf++ = '-';
		return kuitoa(-num, buf, radix) - 1;
	}

	return kuitoa(num, buf, radix);
}

char * kulltoa(unsigned long long num, char *buf, unsigned int radix)
{
	char *p = buf, *q;
	
	do {
		*p++ = "0123456789abcdef"[num % radix];
		num /= radix;
	} while (num > 0);
	
	*p = '\0';
	q = p - 1;
	p = buf;
	
	while (q > p) {
		char tmp = *p;
		*p++ = *q;
		*q-- = tmp;
	}
	
	return buf;
}

char * klltoa(long long num, char *buf, unsigned int radix)
{
	if (radix == 10 && num < 0) {
		*buf++ = '-';
		return kulltoa(-num, buf, radix) - 1;
	}

	return kulltoa(num, buf, radix);
}