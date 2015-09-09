/*
 *	arch/x86_64/lib/memmove.S
 *
 *	c library routine
 */

.extern memcpy
.global memmove
.global _memmove

	.text
	.p2align 4
memmove:
_memmove:
	jmp memcpy

