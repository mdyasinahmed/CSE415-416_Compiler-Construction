
three_sum.o:     file format pe-x86-64


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
  55:	48 83 ec 50          	sub    rsp,0x50
  59:	e8 00 00 00 00       	call   5e <main+0xd>
  5e:	c7 45 d0 02 00 00 00 	mov    DWORD PTR [rbp-0x30],0x2
  65:	c7 45 d4 07 00 00 00 	mov    DWORD PTR [rbp-0x2c],0x7
  6c:	c7 45 d8 0b 00 00 00 	mov    DWORD PTR [rbp-0x28],0xb
  73:	c7 45 dc 0f 00 00 00 	mov    DWORD PTR [rbp-0x24],0xf
  7a:	c7 45 f0 09 00 00 00 	mov    DWORD PTR [rbp-0x10],0x9
  81:	c7 45 ec 04 00 00 00 	mov    DWORD PTR [rbp-0x14],0x4
  88:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  8f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
  96:	eb 57                	jmp    ef <main+0x9e>
  98:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  9b:	83 c0 01             	add    eax,0x1
  9e:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  a1:	eb 40                	jmp    e3 <main+0x92>
  a3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  a6:	48 98                	cdqe   
  a8:	8b 54 85 d0          	mov    edx,DWORD PTR [rbp+rax*4-0x30]
  ac:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  af:	48 98                	cdqe   
  b1:	8b 44 85 d0          	mov    eax,DWORD PTR [rbp+rax*4-0x30]
  b5:	01 d0                	add    eax,edx
  b7:	39 45 f0             	cmp    DWORD PTR [rbp-0x10],eax
  ba:	75 23                	jne    df <main+0x8e>
  bc:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  bf:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  c2:	41 89 d0             	mov    r8d,edx
  c5:	89 c2                	mov    edx,eax
  c7:	48 8d 05 00 00 00 00 	lea    rax,[rip+0x0]        # ce <main+0x7d>
  ce:	48 89 c1             	mov    rcx,rax
  d1:	e8 2a ff ff ff       	call   0 <printf>
  d6:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
  dd:	eb 0c                	jmp    eb <main+0x9a>
  df:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  e3:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  e6:	3b 45 ec             	cmp    eax,DWORD PTR [rbp-0x14]
  e9:	7c b8                	jl     a3 <main+0x52>
  eb:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  ef:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
  f2:	83 e8 01             	sub    eax,0x1
  f5:	39 45 f8             	cmp    DWORD PTR [rbp-0x8],eax
  f8:	7d 06                	jge    100 <main+0xaf>
  fa:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
  fe:	74 98                	je     98 <main+0x47>
 100:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
 104:	75 0f                	jne    115 <main+0xc4>
 106:	48 8d 05 11 00 00 00 	lea    rax,[rip+0x11]        # 11e <main+0xcd>
 10d:	48 89 c1             	mov    rcx,rax
 110:	e8 eb fe ff ff       	call   0 <printf>
 115:	b8 00 00 00 00       	mov    eax,0x0
 11a:	48 83 c4 50          	add    rsp,0x50
 11e:	5d                   	pop    rbp
 11f:	c3                   	ret    
