/* 
 *	arch/x86_64/lib/strcpy.S
 *
 *	c library routine
 */

/* strcpy SSE2 unaligned version */

#include "asm-syntax.h"

# define JMPTBL(I, B)	I - B
# define BRANCH_TO_JMPTBL_ENTRY(TABLE, INDEX, SCALE)             \
	lea	TABLE(%rip), %r11;                              \
	movslq	(%r11, INDEX, SCALE), %rcx;                     \
	lea	(%r11, %rcx), %rcx;                             \
	jmp	*%rcx

.global strcpy
.global _strcpy

	.text
strcpy:
_strcpy:
	mov	%rsi, %rcx

	and	$63, %rcx
	cmp	$32, %rcx
	jbe	L(SourceStringAlignmentLess32)

	and	$-16, %rsi
	and	$15, %rcx
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1

	pcmpeqb	(%rsi), %xmm1
	pmovmskb %xmm1, %rdx
	shr	%cl, %rdx
	test	%rdx, %rdx
	jnz	L(CopyFrom1To16BytesTail)

	pcmpeqb	16(%rsi), %xmm0
	pmovmskb %xmm0, %rdx
	test	%rdx, %rdx
	jnz	L(CopyFrom1To32Bytes)

	movdqu	(%rsi, %rcx), %xmm1   /* copy 16 bytes */
	movdqu	%xmm1, (%rdi)

/* If source address alignment != destination address alignment */
	.p2align 4
L(Unalign16Both):
	sub	%rcx, %rdi
	mov	$16, %rcx
	movdqa	(%rsi, %rcx), %xmm1
	movaps	16(%rsi, %rcx), %xmm2
	movdqu	%xmm1, (%rdi, %rcx)
	pcmpeqb	%xmm2, %xmm0
	pmovmskb %xmm0, %rdx
	add	$16, %rcx

	test	%rdx, %rdx
	jnz	L(CopyFrom1To16Bytes)

	movaps	16(%rsi, %rcx), %xmm3
	movdqu	%xmm2, (%rdi, %rcx)
	pcmpeqb	%xmm3, %xmm0
	pmovmskb %xmm0, %rdx
	add	$16, %rcx
	test	%rdx, %rdx
	jnz	L(CopyFrom1To16Bytes)

	movaps	16(%rsi, %rcx), %xmm4
	movdqu	%xmm3, (%rdi, %rcx)
	pcmpeqb	%xmm4, %xmm0
	pmovmskb %xmm0, %rdx
	add	$16, %rcx
	test	%rdx, %rdx
	jnz	L(CopyFrom1To16Bytes)

	movaps	16(%rsi, %rcx), %xmm1
	movdqu	%xmm4, (%rdi, %rcx)
	pcmpeqb	%xmm1, %xmm0
	pmovmskb %xmm0, %rdx
	add	$16, %rcx
	test	%rdx, %rdx
	jnz	L(CopyFrom1To16Bytes)

	movaps	16(%rsi, %rcx), %xmm2
	movdqu	%xmm1, (%rdi, %rcx)
	pcmpeqb	%xmm2, %xmm0
	pmovmskb %xmm0, %rdx
	add	$16, %rcx
	test	%rdx, %rdx
	jnz	L(CopyFrom1To16Bytes)

	movaps	16(%rsi, %rcx), %xmm3
	movdqu	%xmm2, (%rdi, %rcx)
	pcmpeqb	%xmm3, %xmm0
	pmovmskb %xmm0, %rdx
	add	$16, %rcx
	test	%rdx, %rdx
	jnz	L(CopyFrom1To16Bytes)

	movdqu	%xmm3, (%rdi, %rcx)
	mov	%rsi, %rdx
	lea	16(%rsi, %rcx), %rsi
	and	$-0x40, %rsi
	sub	%rsi, %rdx
	sub	%rdx, %rdi
L(Unaligned64Loop):
	movaps	(%rsi), %xmm2
	movaps	%xmm2, %xmm4
	movaps	16(%rsi), %xmm5
	movaps	32(%rsi), %xmm3
	movaps	%xmm3, %xmm6
	movaps	48(%rsi), %xmm7
	pminub	%xmm5, %xmm2
	pminub	%xmm7, %xmm3
	pminub	%xmm2, %xmm3
	pcmpeqb	%xmm0, %xmm3
	pmovmskb %xmm3, %rdx
	test	%rdx, %rdx
	jnz	L(Unaligned64Leave)

L(Unaligned64Loop_start):
	add	$64, %rdi
	add	$64, %rsi
	movdqu	%xmm4, -64(%rdi)
	movaps	(%rsi), %xmm2
	movdqa	%xmm2, %xmm4
	movdqu	%xmm5, -48(%rdi)
	movaps	16(%rsi), %xmm5
	pminub	%xmm5, %xmm2
	movaps	32(%rsi), %xmm3
	movdqu	%xmm6, -32(%rdi)
	movaps	%xmm3, %xmm6
	movdqu	%xmm7, -16(%rdi)
	movaps	48(%rsi), %xmm7
	pminub	%xmm7, %xmm3
	pminub	%xmm2, %xmm3
	pcmpeqb	%xmm0, %xmm3
	pmovmskb %xmm3, %rdx
	test	%rdx, %rdx
	jz	L(Unaligned64Loop_start)

L(Unaligned64Leave):
	pxor	%xmm1, %xmm1

	pcmpeqb	%xmm4, %xmm0
	pcmpeqb	%xmm5, %xmm1
	pmovmskb %xmm0, %rdx
	pmovmskb %xmm1, %rcx
	test	%rdx, %rdx
	jnz	L(CopyFrom1To16BytesUnaligned_0)
	test	%rcx, %rcx
	jnz	L(CopyFrom1To16BytesUnaligned_16)

	pcmpeqb	%xmm6, %xmm0
	pcmpeqb	%xmm7, %xmm1
	pmovmskb %xmm0, %rdx
	pmovmskb %xmm1, %rcx
	test	%rdx, %rdx
	jnz	L(CopyFrom1To16BytesUnaligned_32)

	bsf	%rcx, %rdx
	movdqu	%xmm4, (%rdi)
	movdqu	%xmm5, 16(%rdi)
	movdqu	%xmm6, 32(%rdi)
	add	$48, %rsi
	add	$48, %rdi
	BRANCH_TO_JMPTBL_ENTRY (L(ExitTable), %rdx, 4)

/* If source address alignment == destination address alignment */

L(SourceStringAlignmentLess32):
	pxor	%xmm0, %xmm0
	movdqu	(%rsi), %xmm1
	movdqu	16(%rsi), %xmm2
	pcmpeqb	%xmm1, %xmm0
	pmovmskb %xmm0, %rdx

	test	%rdx, %rdx
	jnz	L(CopyFrom1To16BytesTail1)

	pcmpeqb	%xmm2, %xmm0
	movdqu	%xmm1, (%rdi)
	pmovmskb %xmm0, %rdx

	test	%rdx, %rdx
	jnz	L(CopyFrom1To32Bytes1)

	and	$-16, %rsi
	and	$15, %rcx
	jmp	L(Unalign16Both)

/*------End of main part with loops---------------------*/

/* Case1 */

	.p2align 4
L(CopyFrom1To16Bytes):
	add	%rcx, %rdi
	add	%rcx, %rsi
	bsf	%rdx, %rdx
	BRANCH_TO_JMPTBL_ENTRY (L(ExitTable), %rdx, 4)

	.p2align 4
L(CopyFrom1To16BytesTail):
	add	%rcx, %rsi
	bsf	%rdx, %rdx
	BRANCH_TO_JMPTBL_ENTRY (L(ExitTable), %rdx, 4)

	.p2align 4
L(CopyFrom1To32Bytes1):
	add	$16, %rsi
	add	$16, %rdi

L(CopyFrom1To16BytesTail1):
	bsf	%rdx, %rdx
	BRANCH_TO_JMPTBL_ENTRY (L(ExitTable), %rdx, 4)

	.p2align 4
L(CopyFrom1To32Bytes):
	bsf	%rdx, %rdx
	add	%rcx, %rsi
	add	$16, %rdx
	sub	%rcx, %rdx
	BRANCH_TO_JMPTBL_ENTRY (L(ExitTable), %rdx, 4)

	.p2align 4
L(CopyFrom1To16BytesUnaligned_0):
	bsf	%rdx, %rdx
	BRANCH_TO_JMPTBL_ENTRY (L(ExitTable), %rdx, 4)

	.p2align 4
L(CopyFrom1To16BytesUnaligned_16):
	bsf	%rcx, %rdx
	movdqu	%xmm4, (%rdi)
	add	$16, %rsi
	add	$16, %rdi
	BRANCH_TO_JMPTBL_ENTRY (L(ExitTable), %rdx, 4)

	.p2align 4
L(CopyFrom1To16BytesUnaligned_32):
	bsf	%rdx, %rdx
	movdqu	%xmm4, (%rdi)
	movdqu	%xmm5, 16(%rdi)
	add	$32, %rsi
	add	$32, %rdi
	BRANCH_TO_JMPTBL_ENTRY (L(ExitTable), %rdx, 4)

/*------------End labels regarding with copying 1-16 bytes--and 1-32 bytes----*/

	.p2align 4
L(Exit1):
	mov	%dh, (%rdi)
	ret

	.p2align 4
L(Exit2):
	mov	(%rsi), %dx
	mov	%dx, (%rdi)
	ret

	.p2align 4
L(Exit3):
	mov	(%rsi), %cx
	mov	%cx, (%rdi)
	mov	%dh, 2(%rdi)
	ret

	.p2align 4
L(Exit4):
	mov	(%rsi), %edx
	mov	%edx, (%rdi)
	ret

	.p2align 4
L(Exit5):
	mov	(%rsi), %ecx
	mov	%dh, 4(%rdi)
	mov	%ecx, (%rdi)
	ret

	.p2align 4
L(Exit6):
	mov	(%rsi), %ecx
	mov	4(%rsi), %dx
	mov	%ecx, (%rdi)
	mov	%dx, 4(%rdi)
	ret

	.p2align 4
L(Exit7):
	mov	(%rsi), %ecx
	mov	3(%rsi), %edx
	mov	%ecx, (%rdi)
	mov	%edx, 3(%rdi)
	ret

	.p2align 4
L(Exit8):
	mov	(%rsi), %rdx
	mov	%rdx, (%rdi)
	ret

	.p2align 4
L(Exit9):
	mov	(%rsi), %rcx
	mov	%dh, 8(%rdi)
	mov	%rcx, (%rdi)
	ret

	.p2align 4
L(Exit10):
	mov	(%rsi), %rcx
	mov	8(%rsi), %dx
	mov	%rcx, (%rdi)
	mov	%dx, 8(%rdi)
	ret

	.p2align 4
L(Exit11):
	mov	(%rsi), %rcx
	mov	7(%rsi), %edx
	mov	%rcx, (%rdi)
	mov	%edx, 7(%rdi)
	ret

	.p2align 4
L(Exit12):
	mov	(%rsi), %rcx
	mov	8(%rsi), %edx
	mov	%rcx, (%rdi)
	mov	%edx, 8(%rdi)
	ret

	.p2align 4
L(Exit13):
	mov	(%rsi), %rcx
	mov	5(%rsi), %rdx
	mov	%rcx, (%rdi)
	mov	%rdx, 5(%rdi)
	ret

	.p2align 4
L(Exit14):
	mov	(%rsi), %rcx
	mov	6(%rsi), %rdx
	mov	%rcx, (%rdi)
	mov	%rdx, 6(%rdi)
	ret

	.p2align 4
L(Exit15):
	mov	(%rsi), %rcx
	mov	7(%rsi), %rdx
	mov	%rcx, (%rdi)
	mov	%rdx, 7(%rdi)
	ret

	.p2align 4
L(Exit16):
	movdqu	(%rsi), %xmm0
	movdqu	%xmm0, (%rdi)
	ret

	.p2align 4
L(Exit17):
	movdqu	(%rsi), %xmm0
	movdqu	%xmm0, (%rdi)
	mov	%dh, 16(%rdi)
	ret

	.p2align 4
L(Exit18):
	movdqu	(%rsi), %xmm0
	mov	16(%rsi), %cx
	movdqu	%xmm0, (%rdi)
	mov	%cx, 16(%rdi)
	ret

	.p2align 4
L(Exit19):
	movdqu	(%rsi), %xmm0
	mov	15(%rsi), %ecx
	movdqu	%xmm0, (%rdi)
	mov	%ecx, 15(%rdi)
	ret

	.p2align 4
L(Exit20):
	movdqu	(%rsi), %xmm0
	mov	16(%rsi), %ecx
	movdqu	%xmm0, (%rdi)
	mov	%ecx, 16(%rdi)
	ret

	.p2align 4
L(Exit21):
	movdqu	(%rsi), %xmm0
	mov	16(%rsi), %ecx
	movdqu	%xmm0, (%rdi)
	mov	%ecx, 16(%rdi)
	mov	%dh, 20(%rdi)
	ret

	.p2align 4
L(Exit22):
	movdqu	(%rsi), %xmm0
	mov	14(%rsi), %rcx
	movdqu	%xmm0, (%rdi)
	mov	%rcx, 14(%rdi)
	ret

	.p2align 4
L(Exit23):
	movdqu	(%rsi), %xmm0
	mov	15(%rsi), %rcx
	movdqu	%xmm0, (%rdi)
	mov	%rcx, 15(%rdi)
	ret

	.p2align 4
L(Exit24):
	movdqu	(%rsi), %xmm0
	mov	16(%rsi), %rcx
	movdqu	%xmm0, (%rdi)
	mov	%rcx, 16(%rdi)
	ret

	.p2align 4
L(Exit25):
	movdqu	(%rsi), %xmm0
	mov	16(%rsi), %rcx
	movdqu	%xmm0, (%rdi)
	mov	%rcx, 16(%rdi)
	mov	%dh, 24(%rdi)
	ret

	.p2align 4
L(Exit26):
	movdqu	(%rsi), %xmm0
	mov	16(%rsi), %rdx
	mov	24(%rsi), %cx
	movdqu	%xmm0, (%rdi)
	mov	%rdx, 16(%rdi)
	mov	%cx, 24(%rdi)
	ret

	.p2align 4
L(Exit27):
	movdqu	(%rsi), %xmm0
	mov	16(%rsi), %rdx
	mov	23(%rsi), %ecx
	movdqu	%xmm0, (%rdi)
	mov	%rdx, 16(%rdi)
	mov	%ecx, 23(%rdi)
	ret

	.p2align 4
L(Exit28):
	movdqu	(%rsi), %xmm0
	mov	16(%rsi), %rdx
	mov	24(%rsi), %ecx
	movdqu	%xmm0, (%rdi)
	mov	%rdx, 16(%rdi)
	mov	%ecx, 24(%rdi)
	ret

	.p2align 4
L(Exit29):
	movdqu	(%rsi), %xmm0
	movdqu	13(%rsi), %xmm2
	movdqu	%xmm0, (%rdi)
	movdqu	%xmm2, 13(%rdi)
	ret

	.p2align 4
L(Exit30):
	movdqu	(%rsi), %xmm0
	movdqu	14(%rsi), %xmm2
	movdqu	%xmm0, (%rdi)
	movdqu	%xmm2, 14(%rdi)
	ret

	.p2align 4
L(Exit31):
	movdqu	(%rsi), %xmm0
	movdqu	15(%rsi), %xmm2
	movdqu	%xmm0, (%rdi)
	movdqu	%xmm2, 15(%rdi)
	ret

	.p2align 4
L(Exit32):
	movdqu	(%rsi), %xmm0
	movdqu	16(%rsi), %xmm2
	movdqu	%xmm0, (%rdi)
	movdqu	%xmm2, 16(%rdi)
	ret
	
	.size	strcpy, .-strcpy
	.size	_strcpy, .-_strcpy

	.p2align 4
	.section .rodata
L(ExitTable):
	.int	JMPTBL(L(Exit1), L(ExitTable))
	.int	JMPTBL(L(Exit2), L(ExitTable))
	.int	JMPTBL(L(Exit3), L(ExitTable))
	.int	JMPTBL(L(Exit4), L(ExitTable))
	.int	JMPTBL(L(Exit5), L(ExitTable))
	.int	JMPTBL(L(Exit6), L(ExitTable))
	.int	JMPTBL(L(Exit7), L(ExitTable))
	.int	JMPTBL(L(Exit8), L(ExitTable))
	.int	JMPTBL(L(Exit9), L(ExitTable))
	.int	JMPTBL(L(Exit10), L(ExitTable))
	.int	JMPTBL(L(Exit11), L(ExitTable))
	.int	JMPTBL(L(Exit12), L(ExitTable))
	.int	JMPTBL(L(Exit13), L(ExitTable))
	.int	JMPTBL(L(Exit14), L(ExitTable))
	.int	JMPTBL(L(Exit15), L(ExitTable))
	.int	JMPTBL(L(Exit16), L(ExitTable))
	.int	JMPTBL(L(Exit17), L(ExitTable))
	.int	JMPTBL(L(Exit18), L(ExitTable))
	.int	JMPTBL(L(Exit19), L(ExitTable))
	.int	JMPTBL(L(Exit20), L(ExitTable))
	.int	JMPTBL(L(Exit21), L(ExitTable))
	.int	JMPTBL(L(Exit22), L(ExitTable))
	.int    JMPTBL(L(Exit23), L(ExitTable))
	.int	JMPTBL(L(Exit24), L(ExitTable))
	.int	JMPTBL(L(Exit25), L(ExitTable))
	.int	JMPTBL(L(Exit26), L(ExitTable))
	.int	JMPTBL(L(Exit27), L(ExitTable))
	.int	JMPTBL(L(Exit28), L(ExitTable))
	.int	JMPTBL(L(Exit29), L(ExitTable))
	.int	JMPTBL(L(Exit30), L(ExitTable))
	.int	JMPTBL(L(Exit31), L(ExitTable))
	.int	JMPTBL(L(Exit32), L(ExitTable))

