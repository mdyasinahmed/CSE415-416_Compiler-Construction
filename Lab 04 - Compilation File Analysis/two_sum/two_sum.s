	.file	"two_sum.c"
	.text
	.def	printf;	.scl	3;	.type	32;	.endef
	.seh_proc	printf
printf:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	48(%rsp), %rbp
	.seh_setframe	%rbp, 48
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movq	%r8, 48(%rbp)
	movq	%r9, 56(%rbp)
	leaq	40(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rbx
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rbx, %r8
	movq	32(%rbp), %rdx
	movq	%rax, %rcx
	call	__mingw_vfprintf
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.globl	two_sum
	.def	two_sum;	.scl	2;	.type	32;	.endef
	.seh_proc	two_sum
two_sum:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movq	%rcx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	%r8d, 32(%rbp)
	movq	%r9, 40(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L4
.L9:
	movl	-4(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.L5
.L8:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	16(%rbp), %rax
	addq	%rdx, %rax
	movl	(%rax), %edx
	movl	-8(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rcx
	movq	16(%rbp), %rax
	addq	%rcx, %rax
	movl	(%rax), %eax
	addl	%edx, %eax
	cmpl	%eax, 32(%rbp)
	jne	.L6
	movq	40(%rbp), %rax
	movl	-4(%rbp), %edx
	movl	%edx, (%rax)
	movq	48(%rbp), %rax
	movl	-8(%rbp), %edx
	movl	%edx, (%rax)
	movl	$1, %eax
	jmp	.L7
.L6:
	addl	$1, -8(%rbp)
.L5:
	movl	-8(%rbp), %eax
	cmpl	24(%rbp), %eax
	jl	.L8
	addl	$1, -4(%rbp)
.L4:
	movl	24(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -4(%rbp)
	jl	.L9
	movl	$0, %eax
.L7:
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "Indices: %d, %d\12\0"
.LC1:
	.ascii "Numbers: %d, %d\12\0"
.LC2:
	.ascii "No two numbers add up to %d\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$96, %rsp
	.seh_stackalloc	96
	.seh_endprologue
	call	__main
	movl	$2, -32(%rbp)
	movl	$7, -28(%rbp)
	movl	$11, -24(%rbp)
	movl	$15, -20(%rbp)
	movl	$4, -4(%rbp)
	movl	$9, -8(%rbp)
	leaq	-36(%rbp), %r9
	movl	-8(%rbp), %r8d
	movl	-4(%rbp), %edx
	leaq	-32(%rbp), %rax
	leaq	-40(%rbp), %rcx
	movq	%rcx, 32(%rsp)
	movq	%rax, %rcx
	call	two_sum
	testb	%al, %al
	je	.L11
	movl	-40(%rbp), %edx
	movl	-36(%rbp), %eax
	movl	%edx, %r8d
	movl	%eax, %edx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	-40(%rbp), %eax
	cltq
	movl	-32(%rbp,%rax,4), %edx
	movl	-36(%rbp), %eax
	cltq
	movl	-32(%rbp,%rax,4), %eax
	movl	%edx, %r8d
	movl	%eax, %edx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	printf
	jmp	.L12
.L11:
	movl	-8(%rbp), %eax
	movl	%eax, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	printf
.L12:
	movl	$0, %eax
	addq	$96, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 11.2.0"
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
