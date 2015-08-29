/*
 *	arch/x86_64/lib/strcpy.S
 *
 *	...
 */

	.text
strcpy:
_strcpy:
	movq %rsi, %rcx
	andl $7, %ecx
	movq %rdi, %rdx

	jz 5f

	neg %ecx
	addl $8, %ecx
0:
	movb (%rsi), %al
	testb %al, %al
	movb %al, (%rdx)
	jz 4f
	incq %rsi
	incq %rdx
	decl %ecx
	jnz 0b

5:
	movq $0xfefefefefefefeff, %r8

	.p2align 4
1:
	# 1st unroll
	movq (%rsi), %rax
	addq $8, %rsi
	movq %rax, %r9
	addq %r8, %r9
	jnc 3f
	
	xorq %rax, %r9
	orq %r8, %r9
	incq %r9
	jnz 3f

	movq %rax, (%rdx)
	addq $8, %rdx
	
	# 2nd unroll
	movq (%rsi), %rax
	addq $8, %rsi
	movq %rax, %r9
	addq %r8, %r9
	jnc 3f
	
	xorq %rax, %r9
	orq %r8, %r9
	incq %r9
	jnz 3f

	movq %rax, (%rdx)
	addq $8, %rdx
	
	# 3rd unroll
	movq (%rsi), %rax
	addq $8, %rsi
	movq %rax, %r9
	addq %r8, %r9
	jnc 3f
	
	xorq %rax, %r9
	orq %r8, %r9
	incq %r9
	jnz 3f

	movq %rax, (%rdx)
	addq $8, %rdx
	
	# 4th unroll
	movq (%rsi), %rax
	addq $8, %rsi
	movq %rax, %r9
	addq %r8, %r9
	jnc 3f
	
	xorq %rax, %r9
	orq %r8, %r9
	incq %r9
	jnz 3f

	movq %rax, (%rdx)
	addq $8, %rdx
	
	jmp 1b

	.p2align 4
3:
	movb %al, (%rdx)
	testb %al, %al
	jz 4f
	incq %rdx
	movb %ah, (%rdx)
	testb %ah, %ah
	jz 4f
	incq %rdx
	shrq $16, %rax
	jmp	3b

4:
	movq	%rdi, %rax
	retq
	