/*
 *	kernel/lib/kitoa.c
 *
 *	kernel library
 */
#include <lib/kstdlib.h>

/*
 * note: the kernel only use radix 2, 8, 10, 16, 
 * so this is not the full implementation.
 */

/*
 *	returns the pointer to the end of the string.
 */
char* kuitoa_reverse(unsigned int num, char* buf, unsigned radix)
{
	do {
		*buf++ = "0123456789abcdef"[num % radix];
		num /= radix;
	} while (num > 0);

	*buf = '\0';
	return buf;
}
/*
 *	returns the pointer to the original buffer.
 */
char* kuitoa(unsigned int num, char* buf, unsigned radix)
{
	char *p, *q;

	p = buf;
	q = kuitoa_reverse(num, buf, radix) - 1;
	
	while (q > p) {
		char tmp = *p;
		*p++ = *q;
		*q-- = tmp;
	}
	
	return buf;
}

char* kitoa(int num, char* buf, unsigned radix)
{
	if (radix == 10 && num < 0) {
		*buf++ = '-';
		return kuitoa(-num, buf, radix) - 1;
	}

	return kuitoa(num, buf, radix);
}

/*
 *	returns the pointer to the end of the string.
 */
char* kulltoa_reverse(unsigned long long num, char* buf, unsigned radix)
{
	do {
		*buf++ = "0123456789abcdef"[num % radix];
		num /= radix;
	} while (num > 0);

	*buf = '\0';
	return buf;
}

/*
 *	returns the pointer to the original buffer.
 */
char* kulltoa(unsigned long long num, char* buf, unsigned radix)
{
	char *p, *q;

	p = buf;
	q = kulltoa_reverse(num, buf, radix) - 1;
	
	while (q > p) {
		char tmp = *p;
		*p++ = *q;
		*q-- = tmp;
	}
	
	return buf;
}

char* klltoa(long long num, char *buf, unsigned radix)
{
	if (radix == 10 && num < 0) {
		*buf++ = '-';
		return kulltoa(-num, buf, radix) - 1;
	}

	return kulltoa(num, buf, radix);
}

