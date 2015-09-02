/* 
 *	arch/x86_64/lib/strcpy.S
 *
 *	c library routine
 */

#include "asm-syntax.h"

	.text
strcpy:
_strcpy:
	mov	%rsi, %rcx
	mov	%rdi, %rdx
	cmpb	$0, (%rcx)
	jz	L(Exit1)
	cmpb	$0, 1(%rcx)
	jz	L(Exit2)
	cmpb	$0, 2(%rcx)
	jz	L(Exit3)
	cmpb	$0, 3(%rcx)
	jz	L(Exit4)
	cmpb	$0, 4(%rcx)
	jz	L(Exit5)
	cmpb	$0, 5(%rcx)
	jz	L(Exit6)
	cmpb	$0, 6(%rcx)
	jz	L(Exit7)
	cmpb	$0, 7(%rcx)
	jz	L(Exit8)
	cmpb	$0, 8(%rcx)
	jz	L(Exit9)
	cmpb	$0, 9(%rcx)
	jz	L(Exit10)
	cmpb	$0, 10(%rcx)
	jz	L(Exit11)
	cmpb	$0, 11(%rcx)
	jz	L(Exit12)
	cmpb	$0, 12(%rcx)
	jz	L(Exit13)
	cmpb	$0, 13(%rcx)
	jz	L(Exit14)
	cmpb	$0, 14(%rcx)
	jz	L(Exit15)
	cmpb	$0, 15(%rcx)
	jz	L(Exit16)

	lea	16(%rcx), %rsi
	and	$-16, %rsi
	pxor	%xmm0, %xmm0
	mov	(%rcx), %r9
	mov	%r9, (%rdx)
	pcmpeqb	(%rsi), %xmm0
	mov	8(%rcx), %r9
	mov	%r9, 8(%rdx)

/* convert byte mask in xmm0 to bit mask */

	pmovmskb %xmm0, %rax
	sub	%rcx, %rsi

	test	%rax, %rax
	jnz	L(CopyFrom1To16Bytes)

	mov	%rdx, %rax
	lea	16(%rdx), %rdx
	and	$-16, %rdx
	sub	%rdx, %rax

	sub	%rax, %rcx
	mov	%rcx, %rax
	and	$0xf, %rax
	mov	$0, %rsi

/* case: rcx_offset == rdx_offset */

	jz	L(Align16Both)

	cmp	$8, %rax
	jae	L(ShlHigh8)
	cmp	$1, %rax
	je	L(Shl1)
	cmp	$2, %rax
	je	L(Shl2)
	cmp	$3, %rax
	je	L(Shl3)
	cmp	$4, %rax
	je	L(Shl4)
	cmp	$5, %rax
	je	L(Shl5)
	cmp	$6, %rax
	je	L(Shl6)
	jmp	L(Shl7)

L(ShlHigh8):
	je	L(Shl8)
	cmp	$9, %rax
	je	L(Shl9)
	cmp	$10, %rax
	je	L(Shl10)
	cmp	$11, %rax
	je	L(Shl11)
	cmp	$12, %rax
	je	L(Shl12)
	cmp	$13, %rax
	je	L(Shl13)
	cmp	$14, %rax
	je	L(Shl14)
	jmp	L(Shl15)

L(Align16Both):
	movaps	(%rcx), %xmm1
	movaps	16(%rcx), %xmm2
	movaps	%xmm1, (%rdx)
	pcmpeqb	%xmm2, %xmm0
	pmovmskb %xmm0, %rax
	lea	16(%rsi), %rsi
	test	%rax, %rax
	jnz	L(CopyFrom1To16Bytes)

	movaps	16(%rcx, %rsi), %xmm3
	movaps	%xmm2, (%rdx, %rsi)
	pcmpeqb	%xmm3, %xmm0
	pmovmskb %xmm0, %rax
	lea	16(%rsi), %rsi
	test	%rax, %rax
	jnz	L(CopyFrom1To16Bytes)

	movaps	16(%rcx, %rsi), %xmm4
	movaps	%xmm3, (%rdx, %rsi)
	pcmpeqb	%xmm4, %xmm0
	pmovmskb %xmm0, %rax
	lea	16(%rsi), %rsi
	test	%rax, %rax
	jnz	L(CopyFrom1To16Bytes)

	movaps	16(%rcx, %rsi), %xmm1
	movaps	%xmm4, (%rdx, %rsi)
	pcmpeqb	%xmm1, %xmm0
	pmovmskb %xmm0, %rax
	lea	16(%rsi), %rsi
	test	%rax, %rax
	jnz	L(CopyFrom1To16Bytes)

	movaps	16(%rcx, %rsi), %xmm2
	movaps	%xmm1, (%rdx, %rsi)
	pcmpeqb	%xmm2, %xmm0
	pmovmskb %xmm0, %rax
	lea	16(%rsi), %rsi
	test	%rax, %rax
	jnz	L(CopyFrom1To16Bytes)

	movaps	16(%rcx, %rsi), %xmm3
	movaps	%xmm2, (%rdx, %rsi)
	pcmpeqb	%xmm3, %xmm0
	pmovmskb %xmm0, %rax
	lea	16(%rsi), %rsi
	test	%rax, %rax
	jnz	L(CopyFrom1To16Bytes)

	movaps	%xmm3, (%rdx, %rsi)
	mov	%rcx, %rax
	lea	16(%rcx, %rsi), %rcx
	and	$-0x40, %rcx
	sub	%rcx, %rax
	sub	%rax, %rdx
	mov	$-0x40, %rsi

	.p2align 4
L(Aligned64Loop):
	movaps	(%rcx), %xmm2
	movaps	%xmm2, %xmm4
	movaps	16(%rcx), %xmm5
	movaps	32(%rcx), %xmm3
	movaps	%xmm3, %xmm6
	movaps	48(%rcx), %xmm7
	pminub	%xmm5, %xmm2
	pminub	%xmm7, %xmm3
	pminub	%xmm2, %xmm3
	pcmpeqb	%xmm0, %xmm3
	pmovmskb %xmm3, %rax
	lea	64(%rdx), %rdx
	lea	64(%rcx), %rcx
	test	%rax, %rax
	jnz	L(Aligned64Leave)
	movaps	%xmm4, -64(%rdx)
	movaps	%xmm5, -48(%rdx)
	movaps	%xmm6, -32(%rdx)
	movaps	%xmm7, -16(%rdx)
	jmp	L(Aligned64Loop)

L(Aligned64Leave):
	pcmpeqb	%xmm4, %xmm0
	pmovmskb %xmm0, %rax
	test	%rax, %rax
	jnz	L(CopyFrom1To16Bytes)

	pcmpeqb	%xmm5, %xmm0
	pmovmskb %xmm0, %rax
	movaps	%xmm4, -64(%rdx)
	test	%rax, %rax
	lea	16(%rsi), %rsi
	jnz	L(CopyFrom1To16Bytes)

	pcmpeqb	%xmm6, %xmm0
	pmovmskb %xmm0, %rax
	movaps	%xmm5, -48(%rdx)
	test	%rax, %rax
	lea	16(%rsi), %rsi
	jnz	L(CopyFrom1To16Bytes)

	movaps	%xmm6, -32(%rdx)
	pcmpeqb	%xmm7, %xmm0
	pmovmskb %xmm0, %rax
	lea	16(%rsi), %rsi
	jmp	L(CopyFrom1To16Bytes)

	.p2align 4
L(Shl1):
	movaps	-1(%rcx), %xmm1
	movaps	15(%rcx), %xmm2
L(Shl1Start):
	pcmpeqb	%xmm2, %xmm0
	pmovmskb %xmm0, %rax
	movaps	%xmm2, %xmm3
	test	%rax, %rax
	jnz	L(Shl1LoopExit)

	palignr	$1, %xmm1, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	31(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	movaps	%xmm2, %xmm1
	test	%rax, %rax
	jnz	L(Shl1LoopExit)

	palignr	$1, %xmm3, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	31(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	movaps	%xmm2, %xmm3
	test	%rax, %rax
	jnz	L(Shl1LoopExit)

	palignr	$1, %xmm1, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	31(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	test	%rax, %rax
	jnz	L(Shl1LoopExit)

	palignr	$1, %xmm3, %xmm2
	movaps	%xmm2, (%rdx)
	lea	31(%rcx), %rcx
	lea	16(%rdx), %rdx

	mov	%rcx, %rax
	and	$-0x40, %rcx
	sub	%rcx, %rax
	lea	-15(%rcx), %rcx
	sub	%rax, %rdx
	movaps	-1(%rcx), %xmm1

/* 64 bytes loop */
	.p2align 4
L(Shl1LoopStart):
	movaps	15(%rcx), %xmm2
	movaps	31(%rcx), %xmm3
	movaps	%xmm3, %xmm6
	movaps	47(%rcx), %xmm4
	movaps	%xmm4, %xmm7
	movaps	63(%rcx), %xmm5
	pminub	%xmm2, %xmm6
	pminub	%xmm5, %xmm7
	pminub	%xmm6, %xmm7
	pcmpeqb	%xmm0, %xmm7
	pmovmskb %xmm7, %rax
	movaps	%xmm5, %xmm7
	palignr	$1, %xmm4, %xmm5
	test	%rax, %rax
	palignr	$1, %xmm3, %xmm4
	jnz	L(Shl1Start)
	palignr	$1, %xmm2, %xmm3
	lea	64(%rcx), %rcx
	palignr	$1, %xmm1, %xmm2
	movaps	%xmm7, %xmm1
	movaps	%xmm5, 48(%rdx)
	movaps	%xmm4, 32(%rdx)
	movaps	%xmm3, 16(%rdx)
	movaps	%xmm2, (%rdx)
	lea	64(%rdx), %rdx
	jmp	L(Shl1LoopStart)

L(Shl1LoopExit):
	movdqu	-1(%rcx), %xmm1
	mov	$15, %rsi
	movdqu	%xmm1, -1(%rdx)
	jmp	L(CopyFrom1To16Bytes)

	.p2align 4
L(Shl2):
	movaps	-2(%rcx), %xmm1
	movaps	14(%rcx), %xmm2
L(Shl2Start):
	pcmpeqb	%xmm2, %xmm0
	pmovmskb %xmm0, %rax
	movaps	%xmm2, %xmm3
	test	%rax, %rax
	jnz	L(Shl2LoopExit)

	palignr	$2, %xmm1, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	30(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	movaps	%xmm2, %xmm1
	test	%rax, %rax
	jnz	L(Shl2LoopExit)

	palignr	$2, %xmm3, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	30(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	movaps	%xmm2, %xmm3
	test	%rax, %rax
	jnz	L(Shl2LoopExit)

	palignr	$2, %xmm1, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	30(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	test	%rax, %rax
	jnz	L(Shl2LoopExit)

	palignr	$2, %xmm3, %xmm2
	movaps	%xmm2, (%rdx)
	lea	30(%rcx), %rcx
	lea	16(%rdx), %rdx

	mov	%rcx, %rax
	and	$-0x40, %rcx
	sub	%rcx, %rax
	lea	-14(%rcx), %rcx
	sub	%rax, %rdx
	movaps	-2(%rcx), %xmm1

/* 64 bytes loop */
	.p2align 4
L(Shl2LoopStart):
	movaps	14(%rcx), %xmm2
	movaps	30(%rcx), %xmm3
	movaps	%xmm3, %xmm6
	movaps	46(%rcx), %xmm4
	movaps	%xmm4, %xmm7
	movaps	62(%rcx), %xmm5
	pminub	%xmm2, %xmm6
	pminub	%xmm5, %xmm7
	pminub	%xmm6, %xmm7
	pcmpeqb	%xmm0, %xmm7
	pmovmskb %xmm7, %rax
	movaps	%xmm5, %xmm7
	palignr	$2, %xmm4, %xmm5
	test	%rax, %rax
	palignr	$2, %xmm3, %xmm4
	jnz	L(Shl2Start)
	palignr	$2, %xmm2, %xmm3
	lea	64(%rcx), %rcx
	palignr	$2, %xmm1, %xmm2
	movaps	%xmm7, %xmm1
	movaps	%xmm5, 48(%rdx)
	movaps	%xmm4, 32(%rdx)
	movaps	%xmm3, 16(%rdx)
	movaps	%xmm2, (%rdx)
	lea	64(%rdx), %rdx
	jmp	L(Shl2LoopStart)

L(Shl2LoopExit):
	movdqu	-2(%rcx), %xmm1
	mov	$14, %rsi
	movdqu	%xmm1, -2(%rdx)
	jmp	L(CopyFrom1To16Bytes)

	.p2align 4
L(Shl3):
	movaps	-3(%rcx), %xmm1
	movaps	13(%rcx), %xmm2
L(Shl3Start):
	pcmpeqb	%xmm2, %xmm0
	pmovmskb %xmm0, %rax
	movaps	%xmm2, %xmm3
	test	%rax, %rax
	jnz	L(Shl3LoopExit)

	palignr	$3, %xmm1, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	29(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	movaps	%xmm2, %xmm1
	test	%rax, %rax
	jnz	L(Shl3LoopExit)

	palignr	$3, %xmm3, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	29(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	movaps	%xmm2, %xmm3
	test	%rax, %rax
	jnz	L(Shl3LoopExit)

	palignr	$3, %xmm1, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	29(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	test	%rax, %rax
	jnz	L(Shl3LoopExit)

	palignr	$3, %xmm3, %xmm2
	movaps	%xmm2, (%rdx)
	lea	29(%rcx), %rcx
	lea	16(%rdx), %rdx

	mov	%rcx, %rax
	and	$-0x40, %rcx
	sub	%rcx, %rax
	lea	-13(%rcx), %rcx
	sub	%rax, %rdx
	movaps	-3(%rcx), %xmm1

/* 64 bytes loop */
	.p2align 4
L(Shl3LoopStart):
	movaps	13(%rcx), %xmm2
	movaps	29(%rcx), %xmm3
	movaps	%xmm3, %xmm6
	movaps	45(%rcx), %xmm4
	movaps	%xmm4, %xmm7
	movaps	61(%rcx), %xmm5
	pminub	%xmm2, %xmm6
	pminub	%xmm5, %xmm7
	pminub	%xmm6, %xmm7
	pcmpeqb	%xmm0, %xmm7
	pmovmskb %xmm7, %rax
	movaps	%xmm5, %xmm7
	palignr	$3, %xmm4, %xmm5
	test	%rax, %rax
	palignr	$3, %xmm3, %xmm4
	jnz	L(Shl3Start)
	palignr	$3, %xmm2, %xmm3
	lea	64(%rcx), %rcx
	palignr	$3, %xmm1, %xmm2
	movaps	%xmm7, %xmm1
	movaps	%xmm5, 48(%rdx)
	movaps	%xmm4, 32(%rdx)
	movaps	%xmm3, 16(%rdx)
	movaps	%xmm2, (%rdx)
	lea	64(%rdx), %rdx
	jmp	L(Shl3LoopStart)

L(Shl3LoopExit):
	movdqu	-3(%rcx), %xmm1
	mov	$13, %rsi
	movdqu	%xmm1, -3(%rdx)
	jmp	L(CopyFrom1To16Bytes)

	.p2align 4
L(Shl4):
	movaps	-4(%rcx), %xmm1
	movaps	12(%rcx), %xmm2
L(Shl4Start):
	pcmpeqb	%xmm2, %xmm0
	pmovmskb %xmm0, %rax
	movaps	%xmm2, %xmm3
	test	%rax, %rax
	jnz	L(Shl4LoopExit)

	palignr	$4, %xmm1, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	28(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	movaps	%xmm2, %xmm1
	test	%rax, %rax
	jnz	L(Shl4LoopExit)

	palignr	$4, %xmm3, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	28(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	movaps	%xmm2, %xmm3
	test	%rax, %rax
	jnz	L(Shl4LoopExit)

	palignr	$4, %xmm1, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	28(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	test	%rax, %rax
	jnz	L(Shl4LoopExit)

	palignr	$4, %xmm3, %xmm2
	movaps	%xmm2, (%rdx)
	lea	28(%rcx), %rcx
	lea	16(%rdx), %rdx

	mov	%rcx, %rax
	and	$-0x40, %rcx
	sub	%rcx, %rax
	lea	-12(%rcx), %rcx
	sub	%rax, %rdx
	movaps	-4(%rcx), %xmm1

/* 64 bytes loop */
	.p2align 4
L(Shl4LoopStart):
	movaps	12(%rcx), %xmm2
	movaps	28(%rcx), %xmm3
	movaps	%xmm3, %xmm6
	movaps	44(%rcx), %xmm4
	movaps	%xmm4, %xmm7
	movaps	60(%rcx), %xmm5
	pminub	%xmm2, %xmm6
	pminub	%xmm5, %xmm7
	pminub	%xmm6, %xmm7
	pcmpeqb	%xmm0, %xmm7
	pmovmskb %xmm7, %rax
	movaps	%xmm5, %xmm7
	palignr	$4, %xmm4, %xmm5
	test	%rax, %rax
	palignr	$4, %xmm3, %xmm4
	jnz	L(Shl4Start)
	palignr	$4, %xmm2, %xmm3
	lea	64(%rcx), %rcx
	palignr	$4, %xmm1, %xmm2
	movaps	%xmm7, %xmm1
	movaps	%xmm5, 48(%rdx)
	movaps	%xmm4, 32(%rdx)
	movaps	%xmm3, 16(%rdx)
	movaps	%xmm2, (%rdx)
	lea	64(%rdx), %rdx
	jmp	L(Shl4LoopStart)

L(Shl4LoopExit):
	movdqu	-4(%rcx), %xmm1
	mov	$12, %rsi
	movdqu	%xmm1, -4(%rdx)
	jmp	L(CopyFrom1To16Bytes)

	.p2align 4
L(Shl5):
	movaps	-5(%rcx), %xmm1
	movaps	11(%rcx), %xmm2
L(Shl5Start):
	pcmpeqb	%xmm2, %xmm0
	pmovmskb %xmm0, %rax
	movaps	%xmm2, %xmm3
	test	%rax, %rax
	jnz	L(Shl5LoopExit)

	palignr	$5, %xmm1, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	27(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	movaps	%xmm2, %xmm1
	test	%rax, %rax
	jnz	L(Shl5LoopExit)

	palignr	$5, %xmm3, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	27(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	movaps	%xmm2, %xmm3
	test	%rax, %rax
	jnz	L(Shl5LoopExit)

	palignr	$5, %xmm1, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	27(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	test	%rax, %rax
	jnz	L(Shl5LoopExit)

	palignr	$5, %xmm3, %xmm2
	movaps	%xmm2, (%rdx)
	lea	27(%rcx), %rcx
	lea	16(%rdx), %rdx

	mov	%rcx, %rax
	and	$-0x40, %rcx
	sub	%rcx, %rax
	lea	-11(%rcx), %rcx
	sub	%rax, %rdx

	movaps	-5(%rcx), %xmm1

/* 64 bytes loop */
	.p2align 4
L(Shl5LoopStart):
	movaps	11(%rcx), %xmm2
	movaps	27(%rcx), %xmm3
	movaps	%xmm3, %xmm6
	movaps	43(%rcx), %xmm4
	movaps	%xmm4, %xmm7
	movaps	59(%rcx), %xmm5
	pminub	%xmm2, %xmm6
	pminub	%xmm5, %xmm7
	pminub	%xmm6, %xmm7
	pcmpeqb	%xmm0, %xmm7
	pmovmskb %xmm7, %rax
	movaps	%xmm5, %xmm7
	palignr	$5, %xmm4, %xmm5
	test	%rax, %rax
	palignr	$5, %xmm3, %xmm4
	jnz	L(Shl5Start)
	palignr	$5, %xmm2, %xmm3
	lea	64(%rcx), %rcx
	palignr	$5, %xmm1, %xmm2
	movaps	%xmm7, %xmm1
	movaps	%xmm5, 48(%rdx)
	movaps	%xmm4, 32(%rdx)
	movaps	%xmm3, 16(%rdx)
	movaps	%xmm2, (%rdx)
	lea	64(%rdx), %rdx
	jmp	L(Shl5LoopStart)

L(Shl5LoopExit):
	movdqu	-5(%rcx), %xmm1
	mov	$11, %rsi
	movdqu	%xmm1, -5(%rdx)
	jmp	L(CopyFrom1To16Bytes)

	.p2align 4
L(Shl6):
	movaps	-6(%rcx), %xmm1
	movaps	10(%rcx), %xmm2
L(Shl6Start):
	pcmpeqb	%xmm2, %xmm0
	pmovmskb %xmm0, %rax
	movaps	%xmm2, %xmm3
	test	%rax, %rax
	jnz	L(Shl6LoopExit)

	palignr	$6, %xmm1, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	26(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	movaps	%xmm2, %xmm1
	test	%rax, %rax
	jnz	L(Shl6LoopExit)

	palignr	$6, %xmm3, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	26(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	movaps	%xmm2, %xmm3
	test	%rax, %rax
	jnz	L(Shl6LoopExit)

	palignr	$6, %xmm1, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	26(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	test	%rax, %rax
	jnz	L(Shl6LoopExit)

	palignr	$6, %xmm3, %xmm2
	movaps	%xmm2, (%rdx)
	lea	26(%rcx), %rcx
	lea	16(%rdx), %rdx

	mov	%rcx, %rax
	and	$-0x40, %rcx
	sub	%rcx, %rax
	lea	-10(%rcx), %rcx
	sub	%rax, %rdx
	movaps	-6(%rcx), %xmm1

/* 64 bytes loop */
	.p2align 4
L(Shl6LoopStart):
	movaps	10(%rcx), %xmm2
	movaps	26(%rcx), %xmm3
	movaps	%xmm3, %xmm6
	movaps	42(%rcx), %xmm4
	movaps	%xmm4, %xmm7
	movaps	58(%rcx), %xmm5
	pminub	%xmm2, %xmm6
	pminub	%xmm5, %xmm7
	pminub	%xmm6, %xmm7
	pcmpeqb	%xmm0, %xmm7
	pmovmskb %xmm7, %rax
	movaps	%xmm5, %xmm7
	palignr	$6, %xmm4, %xmm5
	test	%rax, %rax
	palignr	$6, %xmm3, %xmm4
	jnz	L(Shl6Start)
	palignr	$6, %xmm2, %xmm3
	lea	64(%rcx), %rcx
	palignr	$6, %xmm1, %xmm2
	movaps	%xmm7, %xmm1
	movaps	%xmm5, 48(%rdx)
	movaps	%xmm4, 32(%rdx)
	movaps	%xmm3, 16(%rdx)
	movaps	%xmm2, (%rdx)
	lea	64(%rdx), %rdx
	jmp	L(Shl6LoopStart)

L(Shl6LoopExit):
	mov	(%rcx), %r9
	mov	6(%rcx), %esi
	mov	%r9, (%rdx)
	mov	%esi, 6(%rdx)
	mov	$10, %rsi
	jmp	L(CopyFrom1To16Bytes)

	.p2align 4
L(Shl7):
	movaps	-7(%rcx), %xmm1
	movaps	9(%rcx), %xmm2
L(Shl7Start):
	pcmpeqb	%xmm2, %xmm0
	pmovmskb %xmm0, %rax
	movaps	%xmm2, %xmm3
	test	%rax, %rax
	jnz	L(Shl7LoopExit)

	palignr	$7, %xmm1, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	25(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	movaps	%xmm2, %xmm1
	test	%rax, %rax
	jnz	L(Shl7LoopExit)

	palignr	$7, %xmm3, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	25(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	movaps	%xmm2, %xmm3
	test	%rax, %rax
	jnz	L(Shl7LoopExit)

	palignr	$7, %xmm1, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	25(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	test	%rax, %rax
	jnz	L(Shl7LoopExit)

	palignr	$7, %xmm3, %xmm2
	movaps	%xmm2, (%rdx)
	lea	25(%rcx), %rcx
	lea	16(%rdx), %rdx

	mov	%rcx, %rax
	and	$-0x40, %rcx
	sub	%rcx, %rax
	lea	-9(%rcx), %rcx
	sub	%rax, %rdx
	movaps	-7(%rcx), %xmm1

/* 64 bytes loop */
	.p2align 4
L(Shl7LoopStart):
	movaps	9(%rcx), %xmm2
	movaps	25(%rcx), %xmm3
	movaps	%xmm3, %xmm6
	movaps	41(%rcx), %xmm4
	movaps	%xmm4, %xmm7
	movaps	57(%rcx), %xmm5
	pminub	%xmm2, %xmm6
	pminub	%xmm5, %xmm7
	pminub	%xmm6, %xmm7
	pcmpeqb	%xmm0, %xmm7
	pmovmskb %xmm7, %rax
	movaps	%xmm5, %xmm7
	palignr	$7, %xmm4, %xmm5
	test	%rax, %rax
	palignr	$7, %xmm3, %xmm4
	jnz	L(Shl7Start)
	palignr	$7, %xmm2, %xmm3
	lea	64(%rcx), %rcx
	palignr	$7, %xmm1, %xmm2
	movaps	%xmm7, %xmm1
	movaps	%xmm5, 48(%rdx)
	movaps	%xmm4, 32(%rdx)
	movaps	%xmm3, 16(%rdx)
	movaps	%xmm2, (%rdx)
	lea	64(%rdx), %rdx
	jmp	L(Shl7LoopStart)

L(Shl7LoopExit):
	mov	(%rcx), %r9
	mov	5(%rcx), %esi
	mov	%r9, (%rdx)
	mov	%esi, 5(%rdx)
	mov	$9, %rsi
	jmp	L(CopyFrom1To16Bytes)

	.p2align 4
L(Shl8):
	movaps	-8(%rcx), %xmm1
	movaps	8(%rcx), %xmm2
L(Shl8Start):
	pcmpeqb	%xmm2, %xmm0
	pmovmskb %xmm0, %rax
	movaps	%xmm2, %xmm3
	test	%rax, %rax
	jnz	L(Shl8LoopExit)

	palignr	$8, %xmm1, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	24(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	movaps	%xmm2, %xmm1
	test	%rax, %rax
	jnz	L(Shl8LoopExit)

	palignr	$8, %xmm3, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	24(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	movaps	%xmm2, %xmm3
	test	%rax, %rax
	jnz	L(Shl8LoopExit)

	palignr	$8, %xmm1, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	24(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	test	%rax, %rax
	jnz	L(Shl8LoopExit)

	palignr	$8, %xmm3, %xmm2
	movaps	%xmm2, (%rdx)
	lea	24(%rcx), %rcx
	lea	16(%rdx), %rdx

	mov	%rcx, %rax
	and	$-0x40, %rcx
	sub	%rcx, %rax
	lea	-8(%rcx), %rcx
	sub	%rax, %rdx
	movaps	-8(%rcx), %xmm1

/* 64 bytes loop */
	.p2align 4
L(Shl8LoopStart):
	movaps	8(%rcx), %xmm2
	movaps	24(%rcx), %xmm3
	movaps	%xmm3, %xmm6
	movaps	40(%rcx), %xmm4
	movaps	%xmm4, %xmm7
	movaps	56(%rcx), %xmm5
	pminub	%xmm2, %xmm6
	pminub	%xmm5, %xmm7
	pminub	%xmm6, %xmm7
	pcmpeqb	%xmm0, %xmm7
	pmovmskb %xmm7, %rax
	movaps	%xmm5, %xmm7
	palignr	$8, %xmm4, %xmm5
	test	%rax, %rax
	palignr	$8, %xmm3, %xmm4
	jnz	L(Shl8Start)
	palignr	$8, %xmm2, %xmm3
	lea	64(%rcx), %rcx
	palignr	$8, %xmm1, %xmm2
	movaps	%xmm7, %xmm1
	movaps	%xmm5, 48(%rdx)
	movaps	%xmm4, 32(%rdx)
	movaps	%xmm3, 16(%rdx)
	movaps	%xmm2, (%rdx)
	lea	64(%rdx), %rdx
	jmp	L(Shl8LoopStart)

L(Shl8LoopExit):
	mov	(%rcx), %r9
	mov	$8, %rsi
	mov	%r9, (%rdx)
	jmp	L(CopyFrom1To16Bytes)

	.p2align 4
L(Shl9):
	movaps	-9(%rcx), %xmm1
	movaps	7(%rcx), %xmm2
L(Shl9Start):
	pcmpeqb	%xmm2, %xmm0
	pmovmskb %xmm0, %rax
	movaps	%xmm2, %xmm3
	test	%rax, %rax
	jnz	L(Shl9LoopExit)

	palignr	$9, %xmm1, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	23(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	movaps	%xmm2, %xmm1
	test	%rax, %rax
	jnz	L(Shl9LoopExit)

	palignr	$9, %xmm3, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	23(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	movaps	%xmm2, %xmm3
	test	%rax, %rax
	jnz	L(Shl9LoopExit)

	palignr	$9, %xmm1, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	23(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	test	%rax, %rax
	jnz	L(Shl9LoopExit)

	palignr	$9, %xmm3, %xmm2
	movaps	%xmm2, (%rdx)
	lea	23(%rcx), %rcx
	lea	16(%rdx), %rdx

	mov	%rcx, %rax
	and	$-0x40, %rcx
	sub	%rcx, %rax
	lea	-7(%rcx), %rcx
	sub	%rax, %rdx
	movaps	-9(%rcx), %xmm1

/* 64 bytes loop */
	.p2align 4
L(Shl9LoopStart):
	movaps	7(%rcx), %xmm2
	movaps	23(%rcx), %xmm3
	movaps	%xmm3, %xmm6
	movaps	39(%rcx), %xmm4
	movaps	%xmm4, %xmm7
	movaps	55(%rcx), %xmm5
	pminub	%xmm2, %xmm6
	pminub	%xmm5, %xmm7
	pminub	%xmm6, %xmm7
	pcmpeqb	%xmm0, %xmm7
	pmovmskb %xmm7, %rax
	movaps	%xmm5, %xmm7
	palignr	$9, %xmm4, %xmm5
	test	%rax, %rax
	palignr	$9, %xmm3, %xmm4
	jnz	L(Shl9Start)
	palignr	$9, %xmm2, %xmm3
	lea	64(%rcx), %rcx
	palignr	$9, %xmm1, %xmm2
	movaps	%xmm7, %xmm1
	movaps	%xmm5, 48(%rdx)
	movaps	%xmm4, 32(%rdx)
	movaps	%xmm3, 16(%rdx)
	movaps	%xmm2, (%rdx)
	lea	64(%rdx), %rdx
	jmp	L(Shl9LoopStart)

L(Shl9LoopExit):
	mov	-1(%rcx), %r9
	mov	$7, %rsi
	mov	%r9, -1(%rdx)
	jmp	L(CopyFrom1To16Bytes)

	.p2align 4
L(Shl10):
	movaps	-10(%rcx), %xmm1
	movaps	6(%rcx), %xmm2
L(Shl10Start):
	pcmpeqb	%xmm2, %xmm0
	pmovmskb %xmm0, %rax
	movaps	%xmm2, %xmm3
	test	%rax, %rax
	jnz	L(Shl10LoopExit)

	palignr	$10, %xmm1, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	22(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	movaps	%xmm2, %xmm1
	test	%rax, %rax
	jnz	L(Shl10LoopExit)

	palignr	$10, %xmm3, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	22(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	movaps	%xmm2, %xmm3
	test	%rax, %rax
	jnz	L(Shl10LoopExit)

	palignr	$10, %xmm1, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	22(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	test	%rax, %rax
	jnz	L(Shl10LoopExit)

	palignr	$10, %xmm3, %xmm2
	movaps	%xmm2, (%rdx)
	lea	22(%rcx), %rcx
	lea	16(%rdx), %rdx

	mov	%rcx, %rax
	and	$-0x40, %rcx
	sub	%rcx, %rax
	lea	-6(%rcx), %rcx
	sub	%rax, %rdx
	movaps	-10(%rcx), %xmm1

/* 64 bytes loop */
	.p2align 4
L(Shl10LoopStart):
	movaps	6(%rcx), %xmm2
	movaps	22(%rcx), %xmm3
	movaps	%xmm3, %xmm6
	movaps	38(%rcx), %xmm4
	movaps	%xmm4, %xmm7
	movaps	54(%rcx), %xmm5
	pminub	%xmm2, %xmm6
	pminub	%xmm5, %xmm7
	pminub	%xmm6, %xmm7
	pcmpeqb	%xmm0, %xmm7
	pmovmskb %xmm7, %rax
	movaps	%xmm5, %xmm7
	palignr	$10, %xmm4, %xmm5
	test	%rax, %rax
	palignr	$10, %xmm3, %xmm4
	jnz	L(Shl10Start)
	palignr	$10, %xmm2, %xmm3
	lea	64(%rcx), %rcx
	palignr	$10, %xmm1, %xmm2
	movaps	%xmm7, %xmm1
	movaps	%xmm5, 48(%rdx)
	movaps	%xmm4, 32(%rdx)
	movaps	%xmm3, 16(%rdx)
	movaps	%xmm2, (%rdx)
	lea	64(%rdx), %rdx
	jmp	L(Shl10LoopStart)

L(Shl10LoopExit):
	mov	-2(%rcx), %r9
	mov	$6, %rsi
	mov	%r9, -2(%rdx)
	jmp	L(CopyFrom1To16Bytes)

	.p2align 4
L(Shl11):
	movaps	-11(%rcx), %xmm1
	movaps	5(%rcx), %xmm2
L(Shl11Start):
	pcmpeqb	%xmm2, %xmm0
	pmovmskb %xmm0, %rax
	movaps	%xmm2, %xmm3
	test	%rax, %rax
	jnz	L(Shl11LoopExit)

	palignr	$11, %xmm1, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	21(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	movaps	%xmm2, %xmm1
	test	%rax, %rax
	jnz	L(Shl11LoopExit)

	palignr	$11, %xmm3, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	21(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	movaps	%xmm2, %xmm3
	test	%rax, %rax
	jnz	L(Shl11LoopExit)

	palignr	$11, %xmm1, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	21(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	test	%rax, %rax
	jnz	L(Shl11LoopExit)

	palignr	$11, %xmm3, %xmm2
	movaps	%xmm2, (%rdx)
	lea	21(%rcx), %rcx
	lea	16(%rdx), %rdx

	mov	%rcx, %rax
	and	$-0x40, %rcx
	sub	%rcx, %rax
	lea	-5(%rcx), %rcx
	sub	%rax, %rdx
	movaps	-11(%rcx), %xmm1

/* 64 bytes loop */
	.p2align 4
L(Shl11LoopStart):
	movaps	5(%rcx), %xmm2
	movaps	21(%rcx), %xmm3
	movaps	%xmm3, %xmm6
	movaps	37(%rcx), %xmm4
	movaps	%xmm4, %xmm7
	movaps	53(%rcx), %xmm5
	pminub	%xmm2, %xmm6
	pminub	%xmm5, %xmm7
	pminub	%xmm6, %xmm7
	pcmpeqb	%xmm0, %xmm7
	pmovmskb %xmm7, %rax
	movaps	%xmm5, %xmm7
	palignr	$11, %xmm4, %xmm5
	test	%rax, %rax
	palignr	$11, %xmm3, %xmm4
	jnz	L(Shl11Start)
	palignr	$11, %xmm2, %xmm3
	lea	64(%rcx), %rcx
	palignr	$11, %xmm1, %xmm2
	movaps	%xmm7, %xmm1
	movaps	%xmm5, 48(%rdx)
	movaps	%xmm4, 32(%rdx)
	movaps	%xmm3, 16(%rdx)
	movaps	%xmm2, (%rdx)
	lea	64(%rdx), %rdx
	jmp	L(Shl11LoopStart)

L(Shl11LoopExit):
	mov	-3(%rcx), %r9
	mov	$5, %rsi
	mov	%r9, -3(%rdx)
	jmp	L(CopyFrom1To16Bytes)

	.p2align 4
L(Shl12):
	movaps	-12(%rcx), %xmm1
	movaps	4(%rcx), %xmm2
L(Shl12Start):
	pcmpeqb	%xmm2, %xmm0
	pmovmskb %xmm0, %rax
	movaps	%xmm2, %xmm3
	test	%rax, %rax
	jnz	L(Shl12LoopExit)

	palignr	$12, %xmm1, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	20(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	movaps	%xmm2, %xmm1
	test	%rax, %rax
	jnz	L(Shl12LoopExit)

	palignr	$12, %xmm3, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	20(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	movaps	%xmm2, %xmm3
	test	%rax, %rax
	jnz	L(Shl12LoopExit)

	palignr	$12, %xmm1, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	20(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	test	%rax, %rax
	jnz	L(Shl12LoopExit)

	palignr	$12, %xmm3, %xmm2
	movaps	%xmm2, (%rdx)
	lea	20(%rcx), %rcx
	lea	16(%rdx), %rdx

	mov	%rcx, %rax
	and	$-0x40, %rcx
	sub	%rcx, %rax
	lea	-4(%rcx), %rcx
	sub	%rax, %rdx
	movaps	-12(%rcx), %xmm1

/* 64 bytes loop */
	.p2align 4
L(Shl12LoopStart):
	movaps	4(%rcx), %xmm2
	movaps	20(%rcx), %xmm3
	movaps	%xmm3, %xmm6
	movaps	36(%rcx), %xmm4
	movaps	%xmm4, %xmm7
	movaps	52(%rcx), %xmm5
	pminub	%xmm2, %xmm6
	pminub	%xmm5, %xmm7
	pminub	%xmm6, %xmm7
	pcmpeqb	%xmm0, %xmm7
	pmovmskb %xmm7, %rax
	movaps	%xmm5, %xmm7
	palignr	$12, %xmm4, %xmm5
	test	%rax, %rax
	palignr	$12, %xmm3, %xmm4
	jnz	L(Shl12Start)
	palignr	$12, %xmm2, %xmm3
	lea	64(%rcx), %rcx
	palignr	$12, %xmm1, %xmm2
	movaps	%xmm7, %xmm1
	movaps	%xmm5, 48(%rdx)
	movaps	%xmm4, 32(%rdx)
	movaps	%xmm3, 16(%rdx)
	movaps	%xmm2, (%rdx)
	lea	64(%rdx), %rdx
	jmp	L(Shl12LoopStart)

L(Shl12LoopExit):
	mov	(%rcx), %r9d
	mov	$4, %rsi
	mov	%r9d, (%rdx)
	jmp	L(CopyFrom1To16Bytes)

	.p2align 4
L(Shl13):
	movaps	-13(%rcx), %xmm1
	movaps	3(%rcx), %xmm2
L(Shl13Start):
	pcmpeqb	%xmm2, %xmm0
	pmovmskb %xmm0, %rax
	movaps	%xmm2, %xmm3
	test	%rax, %rax
	jnz	L(Shl13LoopExit)

	palignr	$13, %xmm1, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	19(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	movaps	%xmm2, %xmm1
	test	%rax, %rax
	jnz	L(Shl13LoopExit)

	palignr	$13, %xmm3, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	19(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	movaps	%xmm2, %xmm3
	test	%rax, %rax
	jnz	L(Shl13LoopExit)

	palignr	$13, %xmm1, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	19(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	test	%rax, %rax
	jnz	L(Shl13LoopExit)

	palignr	$13, %xmm3, %xmm2
	movaps	%xmm2, (%rdx)
	lea	19(%rcx), %rcx
	lea	16(%rdx), %rdx

	mov	%rcx, %rax
	and	$-0x40, %rcx
	sub	%rcx, %rax
	lea	-3(%rcx), %rcx
	sub	%rax, %rdx
	movaps	-13(%rcx), %xmm1

/* 64 bytes loop */
	.p2align 4
L(Shl13LoopStart):
	movaps	3(%rcx), %xmm2
	movaps	19(%rcx), %xmm3
	movaps	%xmm3, %xmm6
	movaps	35(%rcx), %xmm4
	movaps	%xmm4, %xmm7
	movaps	51(%rcx), %xmm5
	pminub	%xmm2, %xmm6
	pminub	%xmm5, %xmm7
	pminub	%xmm6, %xmm7
	pcmpeqb	%xmm0, %xmm7
	pmovmskb %xmm7, %rax
	movaps	%xmm5, %xmm7
	palignr	$13, %xmm4, %xmm5
	test	%rax, %rax
	palignr	$13, %xmm3, %xmm4
	jnz	L(Shl13Start)
	palignr	$13, %xmm2, %xmm3
	lea	64(%rcx), %rcx
	palignr	$13, %xmm1, %xmm2
	movaps	%xmm7, %xmm1
	movaps	%xmm5, 48(%rdx)
	movaps	%xmm4, 32(%rdx)
	movaps	%xmm3, 16(%rdx)
	movaps	%xmm2, (%rdx)
	lea	64(%rdx), %rdx
	jmp	L(Shl13LoopStart)

L(Shl13LoopExit):
	mov	-1(%rcx), %r9d
	mov	$3, %rsi
	mov	%r9d, -1(%rdx)
	jmp	L(CopyFrom1To16Bytes)

	.p2align 4
L(Shl14):
	movaps	-14(%rcx), %xmm1
	movaps	2(%rcx), %xmm2
L(Shl14Start):
	pcmpeqb	%xmm2, %xmm0
	pmovmskb %xmm0, %rax
	movaps	%xmm2, %xmm3
	test	%rax, %rax
	jnz	L(Shl14LoopExit)

	palignr	$14, %xmm1, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	18(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	movaps	%xmm2, %xmm1
	test	%rax, %rax
	jnz	L(Shl14LoopExit)

	palignr	$14, %xmm3, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	18(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	movaps	%xmm2, %xmm3
	test	%rax, %rax
	jnz	L(Shl14LoopExit)

	palignr	$14, %xmm1, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	18(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx

	test	%rax, %rax
	jnz	L(Shl14LoopExit)

	palignr	$14, %xmm3, %xmm2
	movaps	%xmm2, (%rdx)
	lea	18(%rcx), %rcx
	lea	16(%rdx), %rdx

	mov	%rcx, %rax
	and	$-0x40, %rcx
	sub	%rcx, %rax
	lea	-2(%rcx), %rcx
	sub	%rax, %rdx
	movaps	-14(%rcx), %xmm1

/* 64 bytes loop */
	.p2align 4
L(Shl14LoopStart):
	movaps	2(%rcx), %xmm2
	movaps	18(%rcx), %xmm3
	movaps	%xmm3, %xmm6
	movaps	34(%rcx), %xmm4
	movaps	%xmm4, %xmm7
	movaps	50(%rcx), %xmm5
	pminub	%xmm2, %xmm6
	pminub	%xmm5, %xmm7
	pminub	%xmm6, %xmm7
	pcmpeqb	%xmm0, %xmm7
	pmovmskb %xmm7, %rax
	movaps	%xmm5, %xmm7
	palignr	$14, %xmm4, %xmm5
	test	%rax, %rax
	palignr	$14, %xmm3, %xmm4
	jnz	L(Shl14Start)
	palignr	$14, %xmm2, %xmm3
	lea	64(%rcx), %rcx
	palignr	$14, %xmm1, %xmm2
	movaps	%xmm7, %xmm1
	movaps	%xmm5, 48(%rdx)
	movaps	%xmm4, 32(%rdx)
	movaps	%xmm3, 16(%rdx)
	movaps	%xmm2, (%rdx)
	lea	64(%rdx), %rdx
	jmp	L(Shl14LoopStart)

L(Shl14LoopExit):
	mov	-2(%rcx), %r9d
	mov	$2, %rsi
	mov	%r9d, -2(%rdx)
	jmp	L(CopyFrom1To16Bytes)

	.p2align 4
L(Shl15):
	movaps	-15(%rcx), %xmm1
	movaps	1(%rcx), %xmm2
L(Shl15Start):
	pcmpeqb	%xmm2, %xmm0
	pmovmskb %xmm0, %rax
	movaps	%xmm2, %xmm3
	test	%rax, %rax
	jnz	L(Shl15LoopExit)

	palignr	$15, %xmm1, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	17(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	movaps	%xmm2, %xmm1
	test	%rax, %rax
	jnz	L(Shl15LoopExit)

	palignr	$15, %xmm3, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	17(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	movaps	%xmm2, %xmm3
	test	%rax, %rax
	jnz	L(Shl15LoopExit)

	palignr	$15, %xmm1, %xmm2
	movaps	%xmm2, (%rdx)
	movaps	17(%rcx), %xmm2

	pcmpeqb	%xmm2, %xmm0
	lea	16(%rdx), %rdx
	pmovmskb %xmm0, %rax
	lea	16(%rcx), %rcx
	test	%rax, %rax
	jnz	L(Shl15LoopExit)

	palignr	$15, %xmm3, %xmm2
	movaps	%xmm2, (%rdx)
	lea	17(%rcx), %rcx
	lea	16(%rdx), %rdx

	mov	%rcx, %rax
	and	$-0x40, %rcx
	sub	%rcx, %rax
	lea	-1(%rcx), %rcx
	sub	%rax, %rdx
	movaps	-15(%rcx), %xmm1

/* 64 bytes loop */
	.p2align 4
L(Shl15LoopStart):
	movaps	1(%rcx), %xmm2
	movaps	17(%rcx), %xmm3
	movaps	%xmm3, %xmm6
	movaps	33(%rcx), %xmm4
	movaps	%xmm4, %xmm7
	movaps	49(%rcx), %xmm5
	pminub	%xmm2, %xmm6
	pminub	%xmm5, %xmm7
	pminub	%xmm6, %xmm7
	pcmpeqb	%xmm0, %xmm7
	pmovmskb %xmm7, %rax
	movaps	%xmm5, %xmm7
	palignr	$15, %xmm4, %xmm5
	test	%rax, %rax
	palignr	$15, %xmm3, %xmm4
	jnz	L(Shl15Start)
	palignr	$15, %xmm2, %xmm3
	lea	64(%rcx), %rcx
	palignr	$15, %xmm1, %xmm2
	movaps	%xmm7, %xmm1
	movaps	%xmm5, 48(%rdx)
	movaps	%xmm4, 32(%rdx)
	movaps	%xmm3, 16(%rdx)
	movaps	%xmm2, (%rdx)
	lea	64(%rdx), %rdx
	jmp	L(Shl15LoopStart)

L(Shl15LoopExit):
	mov	-3(%rcx), %r9d
	mov	$1, %rsi
	mov	%r9d, -3(%rdx)

	.p2align 4
L(CopyFrom1To16Bytes):
	add	%rsi, %rdx
	add	%rsi, %rcx

	test	%al, %al
	jz	L(ExitHigh)
	test	$0x01, %al
	jnz	L(Exit1)
	test	$0x02, %al
	jnz	L(Exit2)
	test	$0x04, %al
	jnz	L(Exit3)
	test	$0x08, %al
	jnz	L(Exit4)
	test	$0x10, %al
	jnz	L(Exit5)
	test	$0x20, %al
	jnz	L(Exit6)
	test	$0x40, %al
	jnz	L(Exit7)

	.p2align 4
L(Exit8):
	mov	(%rcx), %rax
	mov	%rax, (%rdx)
	mov	%rdi, %rax
	ret

	.p2align 4
L(ExitHigh):
	test	$0x01, %ah
	jnz	L(Exit9)
	test	$0x02, %ah
	jnz	L(Exit10)
	test	$0x04, %ah
	jnz	L(Exit11)
	test	$0x08, %ah
	jnz	L(Exit12)
	test	$0x10, %ah
	jnz	L(Exit13)
	test	$0x20, %ah
	jnz	L(Exit14)
	test	$0x40, %ah
	jnz	L(Exit15)

	.p2align 4
L(Exit16):
	mov	(%rcx), %rax
	mov	%rax, (%rdx)
	mov	8(%rcx), %rax
	mov	%rax, 8(%rdx)
	mov	%rdi, %rax
	ret

	.p2align 4
L(Exit1):
	movb (%rcx), %al
	movb %al, (%rdx)
	mov	%rdi, %rax
	ret

	.p2align 4
L(Exit2):
	movw (%rcx), %ax
	movw %ax, (%rdx)
	mov %rdi, %rax
	ret

	.p2align 4
L(Exit3):
	movw (%rcx), %ax
	movw %ax, (%rdx)
	movb 2(%rcx), %al
	movb %al, 2(%rdx)
	mov %rdi, %rax
	ret

	.p2align 4
L(Exit4):
	movl (%rcx), %eax
	movl %eax, (%rdx)
	mov	%rdi, %rax
	ret

	.p2align 4
L(Exit5):
	movl (%rcx), %eax
	movl %eax, (%rdx)
	movb 4(%rcx), %al
	movb %al, 4(%rdx)
	mov	%rdi, %rax
	ret

	.p2align 4
L(Exit6):
	movl (%rcx), %eax
	movl %eax, (%rdx)
	movw 4(%rcx), %ax
	movw %ax, 4(%rdx)
	mov	%rdi, %rax
	ret

	.p2align 4
L(Exit7):
	movl (%rcx), %eax
	movl %eax, (%rdx)
	movl 3(%rcx), %eax
	movl %eax, 3(%rdx)
	mov	%rdi, %rax
	ret

	.p2align 4
L(Exit9):
	mov	(%rcx), %rax
	mov	%rax, (%rdx)
	mov	5(%rcx), %eax
	mov	%eax, 5(%rdx)
	mov	%rdi, %rax
	ret

	.p2align 4
L(Exit10):
	mov	(%rcx), %rax
	mov	%rax, (%rdx)
	mov	6(%rcx), %eax
	mov	%eax, 6(%rdx)
	mov	%rdi, %rax
	ret

	.p2align 4
L(Exit11):
	mov	(%rcx), %rax
	mov	%rax, (%rdx)
	mov	7(%rcx), %eax
	mov	%eax, 7(%rdx)
	mov	%rdi, %rax
	ret

	.p2align 4
L(Exit12):
	mov	(%rcx), %rax
	mov	%rax, (%rdx)
	mov	8(%rcx), %eax
	mov	%eax, 8(%rdx)
	mov	%rdi, %rax
	ret

	.p2align 4
L(Exit13):
	mov	(%rcx), %rax
	mov	%rax, (%rdx)
	mov	5(%rcx), %rax
	mov	%rax, 5(%rdx)
	mov %rdi, %rax
	ret

	.p2align 4
L(Exit14):
	mov	(%rcx), %rax
	mov	%rax, (%rdx)
	mov	6(%rcx), %rax
	mov	%rax, 6(%rdx)
	mov	%rdi, %rax
	ret

	.p2align 4
L(Exit15):
	mov	(%rcx), %rax
	mov	%rax, (%rdx)
	mov	7(%rcx), %rax
	mov	%rax, 7(%rdx)
	mov	%rdi, %rax
	ret

