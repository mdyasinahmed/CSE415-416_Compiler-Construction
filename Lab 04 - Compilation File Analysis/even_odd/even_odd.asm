
even_odd.o:     file format pe-x86-64


Disassembly of section .text:

0000000000000000 <printf>:
   0:	55                   	push   rbp
   1:	53                   	push   rbx
   2:	48 83 ec 38          	sub    rsp,0x38
   6:	48 8d 6c 24 30       	lea    rbp,[rsp+0x30]
   b:	48 89 4d 20          	mov    QWORD PTR [rbp+0x20],rcx
   f:	48 89 55 28          	mov    QWORD PTR [rbp+0x28],rdx
  13:	4c 89 45 30          	mov    QWORD PTR [rbp+0x30],r8
  17:	4c 89 4d 38          	mov    QWORD PTR [rbp+0x38],r9
  1b:	48 8d 45 28          	lea    rax,[rbp+0x28]
  1f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  23:	48 8b 5d f0          	mov    rbx,QWORD PTR [rbp-0x10]
  27:	b9 01 00 00 00       	mov    ecx,0x1
  2c:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 33 <printf+0x33>
  33:	ff d0                	call   rax
  35:	49 89 d8             	mov    r8,rbx
  38:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  3c:	48 89 c1             	mov    rcx,rax
  3f:	e8 00 00 00 00       	call   44 <printf+0x44>
  44:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  47:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  4a:	48 83 c4 38          	add    rsp,0x38
  4e:	5b                   	pop    rbx
  4f:	5d                   	pop    rbp
  50:	c3                   	ret    

0000000000000051 <main>:
  51:	55                   	push   rbp
  52:	48 89 e5             	mov    rbp,rsp
  55:	48 83 ec 30          	sub    rsp,0x30
  59:	e8 00 00 00 00       	call   5e <main+0xd>
  5e:	c7 45 fc 07 00 00 00 	mov    DWORD PTR [rbp-0x4],0x7
  65:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  68:	83 e0 01             	and    eax,0x1
  6b:	85 c0                	test   eax,eax
  6d:	75 16                	jne    85 <main+0x34>
  6f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  72:	89 c2                	mov    edx,eax
  74:	48 8d 05 00 00 00 00 	lea    rax,[rip+0x0]        # 7b <main+0x2a>
  7b:	48 89 c1             	mov    rcx,rax
  7e:	e8 7d ff ff ff       	call   0 <printf>
  83:	eb 14                	jmp    99 <main+0x48>
  85:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  88:	89 c2                	mov    edx,eax
  8a:	48 8d 05 0d 00 00 00 	lea    rax,[rip+0xd]        # 9e <main+0x4d>
  91:	48 89 c1             	mov    rcx,rax
  94:	e8 67 ff ff ff       	call   0 <printf>
  99:	b8 00 00 00 00       	mov    eax,0x0
  9e:	48 83 c4 30          	add    rsp,0x30
  a2:	5d                   	pop    rbp
  a3:	c3                   	ret    
  a4:	90                   	nop
  a5:	90                   	nop
  a6:	90                   	nop
  a7:	90                   	nop
  a8:	90                   	nop
  a9:	90                   	nop
  aa:	90                   	nop
  ab:	90                   	nop
  ac:	90                   	nop
  ad:	90                   	nop
  ae:	90                   	nop
  af:	90                   	nop
