/*
 *	arch/x86_64/lib/memset.S
 *
 *	c library routine
 */

#include "asm-syntax.h"

	.text
memset:
_memset:
	movd	%esi, %xmm8
	movq	%rdi, %rax
	punpcklbw	%xmm8, %xmm8
	punpcklwd	%xmm8, %xmm8
	pshufd	$0, %xmm8, %xmm8

	cmpq	$64, %rdx
	ja	L(loop_start)
	cmpq	$16, %rdx
	jbe	L(less_16_bytes)
	cmpq	$32, %rdx
	movdqu	%xmm8, (%rdi)
	movdqu	%xmm8, -16(%rdi,%rdx)
	ja	L(between_32_64_bytes)
L(return):
	rep
	ret
	.p2align 4
L(between_32_64_bytes):
	movdqu	%xmm8, 16(%rdi)
	movdqu	%xmm8, -32(%rdi,%rdx)
	ret
	.p2align 4
L(loop_start):
	leaq	64(%rdi), %rcx
	movdqu	%xmm8, (%rdi)
	andq	$-64, %rcx
	movdqu	%xmm8, -16(%rdi,%rdx)
	movdqu	%xmm8, 16(%rdi)
	movdqu	%xmm8, -32(%rdi,%rdx)
	movdqu	%xmm8, 32(%rdi)
	movdqu	%xmm8, -48(%rdi,%rdx)
	movdqu	%xmm8, 48(%rdi)
	movdqu	%xmm8, -64(%rdi,%rdx)
	addq	%rdi, %rdx
	andq	$-64, %rdx
	cmpq	%rdx, %rcx
	je	L(return)
	.p2align 4
L(loop):
	movdqa	%xmm8, (%rcx)
	movdqa	%xmm8, 16(%rcx)
	movdqa	%xmm8, 32(%rcx)
	movdqa	%xmm8, 48(%rcx)
	addq	$64, %rcx
	cmpq	%rcx, %rdx
	jne	L(loop)
	rep
	ret
L(less_16_bytes):
	movq %xmm8, %rcx
	testb	$24, %dl
	jne	L(between8_16bytes)
	testb	$4, %dl
	jne	L(between4_7bytes)
	testb	$1, %dl
	je	L(odd_byte)
	movb	%cl, (%rdi)
L(odd_byte):
	testb	$2, %dl
	je	L(return)
	movw	%cx, -2(%rax,%rdx)
	ret
L(between4_7bytes):
	movl	%ecx, (%rdi)
	movl	%ecx, -4(%rdi,%rdx)
	ret
L(between8_16bytes):
	movq	%rcx, (%rdi)
	movq	%rcx, -8(%rdi,%rdx)
	ret

