/*
 *	string.c
 *
 *	"stupid string routines" (generic)
 */
#include <stddef.h>
#include <ctype.h>

#ifndef __HAVE_ARCH_STRNCASECMP
/**
 * strncasecmp - Case insensitive, length limited string comparison
 * @s1: One string
 * @s2: The other string
 * @len: The maximum number of characters to compare
 */
int strncasecmp(const char *s1, const char *s2, size_t len)
{
	unsigned char c1, c2;

	if (!len)
		return 0;

	do {
		c1 = *s1++;
		c2 = *s2++;
		if (!c1 || !c2)
			break;
		if (c1 == c2)
			continue;
		c1 = tolower(c1);
		c2 = tolower(c2);
		if (c1 != c2)
			break;
	} while (--len);
	
	return (int)c1 - (int)c2;
}
#endif

