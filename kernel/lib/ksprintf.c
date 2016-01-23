/*
 *	kernel/lib/ksprintf.c
 *
 *	kernel library
 */
#include <lib/ksprintf.h>
#include <lib/kstdlib.h>
#include <stdarg.h>

int kvsprintf(char* buf, const char* fmt, va_list args)
{
	char c, *p, *p0, *q, nbuf[32];
	
	p = buf;
	
	while (c = *fmt++) {
		if (c != '%') {
			*p++ = c;
			continue;
		} 
		int pad_with_0, pad;

		c = *fmt++;
			
		if (c == '0') {
			pad_with_0 = 1; // true
			c = *fmt++;
		}
			
		if (c > '0' && c <= '9') {
			pad = c - '0';
			c = *fmt++;
			
			if (c >= '0' && c <= '9') {
				pad = pad * 10 + c - '0';
				c = *fmt++;
			}
		}

		switch (c) {
			case 'd':
				kitoa(va_arg(args, long), nbuf, 10);
				goto number;
				break;
			case 'u':
				kuitoa(va_arg(args, long), nbuf, 10);
				goto number;
				break;
			case 'x':
				kuitoa(va_arg(args, long), nbuf, 16);
				goto number;
				break;
			case 'p':
				kulltoa(va_arg(args, long), nbuf, 16);
				*p++ = '0';
				*p++ = 'x';
				pad_with_0 = 1, pad = 8;
				goto number;
				break;			
			case 'l':
				switch (*fmt++) {
				case 'd':
					klltoa(va_arg(args, long long), nbuf, 10);
					goto number;
					break;
				case 'u':
					kulltoa(va_arg(args, long long), nbuf, 10);
					goto number;
					break;
				case 'x':
					kulltoa(va_arg(args, long long), nbuf, 16);
					goto number;
					break;
				default:
					break;	
				}
				break;
			case 'c':
				*p++ = (char)va_arg(args, long);
				break;
			case 's':
				p0 = va_arg(args, char*);
				if (!p0)
					p0 = "(NULL)";
				goto string;
				break;
			number:
				p0 = nbuf;
			string:
				for (q = p0; *q; q++);
				for (; q < p0 + pad; q++)
					*p++ = pad_with_0 ? '0' : ' ';
				while (*p0)
					*p++ = *p0++;
				break;
			default:
				break;
		}
		
		pad_with_0 = 0, pad = 0;			
	}
	
	*p = '\0';	
	return p - buf;
}

int ksprintf(char* buffer, const char* format, ...)
{
	int done;
	va_list args;
	
	va_start(args, format);
	done = kvsprintf(buffer, format, args);
	va_end(args);
	
	return done;
}

