	.file	"three_sum.c"
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
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC0:
	.ascii "Indices: %d, %d\12\0"
.LC1:
	.ascii "No two sum solution found.\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$80, %rsp
	.seh_stackalloc	80
	.seh_endprologue
	call	__main
	movl	$2, -48(%rbp)
	movl	$7, -44(%rbp)
	movl	$11, -40(%rbp)
	movl	$15, -36(%rbp)
	movl	$9, -16(%rbp)
	movl	$4, -20(%rbp)
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
	jmp	.L4
.L10:
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -12(%rbp)
	jmp	.L5
.L8:
	movl	-8(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %edx
	movl	-12(%rbp), %eax
	cltq
	movl	-48(%rbp,%rax,4), %eax
	addl	%edx, %eax
	cmpl	%eax, -16(%rbp)
	jne	.L6
	movl	-12(%rbp), %edx
	movl	-8(%rbp), %eax
	movl	%edx, %r8d
	movl	%eax, %edx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$1, -4(%rbp)
	jmp	.L7
.L6:
	addl	$1, -12(%rbp)
.L5:
	movl	-12(%rbp), %eax
	cmpl	-20(%rbp), %eax
	jl	.L8
.L7:
	addl	$1, -8(%rbp)
.L4:
	movl	-20(%rbp), %eax
	subl	$1, %eax
	cmpl	%eax, -8(%rbp)
	jge	.L9
	cmpl	$0, -4(%rbp)
	je	.L10
.L9:
	cmpl	$0, -4(%rbp)
	jne	.L11
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	printf
.L11:
	movl	$0, %eax
	addq	$80, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 11.2.0"
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
