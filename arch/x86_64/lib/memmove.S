/*
 *	arch/x86_64/lib/memmove.S
 *
 *	c library routine
 */

	.text
.extern memcpy
	.p2align 4
memmove:
_memmove:
	jmp memcpy

