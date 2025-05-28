	.file	"seperation.c"
	.text
	.def	scanf;	.scl	3;	.type	32;	.endef
	.seh_proc	scanf
scanf:
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
	movl	$0, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rbx, %r8
	movq	32(%rbp), %rdx
	movq	%rax, %rcx
	call	__mingw_vfscanf
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
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
	.align 8
.LC0:
	.ascii "Enter the number of elements: \0"
.LC1:
	.ascii "%d\0"
.LC2:
	.ascii "Enter %d integers:\12\0"
.LC3:
	.ascii "Odd numbers: \0"
.LC4:
	.ascii "%d \0"
.LC5:
	.ascii "\12Even numbers: \0"
.LC6:
	.ascii "\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%r13
	.seh_pushreg	%r13
	pushq	%r12
	.seh_pushreg	%r12
	pushq	%rdi
	.seh_pushreg	%rdi
	pushq	%rsi
	.seh_pushreg	%rsi
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$72, %rsp
	.seh_stackalloc	72
	leaq	64(%rsp), %rbp
	.seh_setframe	%rbp, 64
	.seh_endprologue
	call	__main
	movq	%rsp, %rax
	movq	%rax, %rbx
	leaq	.LC0(%rip), %rax
	movq	%rax, %rcx
	call	printf
	leaq	-28(%rbp), %rax
	movq	%rax, %rdx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	scanf
	movl	-28(%rbp), %eax
	movslq	%eax, %rdx
	subq	$1, %rdx
	movq	%rdx, -16(%rbp)
	movslq	%eax, %rdx
	movq	%rdx, %r12
	movl	$0, %r13d
	movslq	%eax, %rdx
	movq	%rdx, %rsi
	movl	$0, %edi
	cltq
	salq	$2, %rax
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	call	___chkstk_ms
	subq	%rax, %rsp
	leaq	32(%rsp), %rax
	addq	$3, %rax
	shrq	$2, %rax
	salq	$2, %rax
	movq	%rax, -24(%rbp)
	movl	-28(%rbp), %eax
	movl	%eax, %edx
	leaq	.LC2(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$0, -4(%rbp)
	jmp	.L6
.L7:
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, %rdx
	leaq	.LC1(%rip), %rax
	movq	%rax, %rcx
	call	scanf
	addl	$1, -4(%rbp)
.L6:
	movl	-28(%rbp), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L7
	leaq	.LC3(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$0, -4(%rbp)
	jmp	.L8
.L10:
	movq	-24(%rbp), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	andl	$1, %eax
	testl	%eax, %eax
	je	.L9
	movq	-24(%rbp), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	movl	%eax, %edx
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	printf
.L9:
	addl	$1, -4(%rbp)
.L8:
	movl	-28(%rbp), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L10
	leaq	.LC5(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$0, -4(%rbp)
	jmp	.L11
.L13:
	movq	-24(%rbp), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	andl	$1, %eax
	testl	%eax, %eax
	jne	.L12
	movq	-24(%rbp), %rax
	movl	-4(%rbp), %edx
	movslq	%edx, %rdx
	movl	(%rax,%rdx,4), %eax
	movl	%eax, %edx
	leaq	.LC4(%rip), %rax
	movq	%rax, %rcx
	call	printf
.L12:
	addl	$1, -4(%rbp)
.L11:
	movl	-28(%rbp), %eax
	cmpl	%eax, -4(%rbp)
	jl	.L13
	leaq	.LC6(%rip), %rax
	movq	%rax, %rcx
	call	printf
	movl	$0, %eax
	movq	%rbx, %rsp
	leaq	8(%rbp), %rsp
	popq	%rbx
	popq	%rsi
	popq	%rdi
	popq	%r12
	popq	%r13
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (GNU) 11.2.0"
	.def	__mingw_vfscanf;	.scl	2;	.type	32;	.endef
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
