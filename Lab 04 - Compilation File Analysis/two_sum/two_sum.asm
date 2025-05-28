
two_sum.o:     file format pe-x86-64


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

0000000000000051 <two_sum>:
  51:	55                   	push   rbp
  52:	48 89 e5             	mov    rbp,rsp
  55:	48 83 ec 10          	sub    rsp,0x10
  59:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
  5d:	89 55 18             	mov    DWORD PTR [rbp+0x18],edx
  60:	44 89 45 20          	mov    DWORD PTR [rbp+0x20],r8d
  64:	4c 89 4d 28          	mov    QWORD PTR [rbp+0x28],r9
  68:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  6f:	eb 67                	jmp    d8 <two_sum+0x87>
  71:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  74:	83 c0 01             	add    eax,0x1
  77:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  7a:	eb 50                	jmp    cc <two_sum+0x7b>
  7c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  7f:	48 98                	cdqe   
  81:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
  88:	00 
  89:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  8d:	48 01 d0             	add    rax,rdx
  90:	8b 10                	mov    edx,DWORD PTR [rax]
  92:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  95:	48 98                	cdqe   
  97:	48 8d 0c 85 00 00 00 	lea    rcx,[rax*4+0x0]
  9e:	00 
  9f:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  a3:	48 01 c8             	add    rax,rcx
  a6:	8b 00                	mov    eax,DWORD PTR [rax]
  a8:	01 d0                	add    eax,edx
  aa:	39 45 20             	cmp    DWORD PTR [rbp+0x20],eax
  ad:	75 19                	jne    c8 <two_sum+0x77>
  af:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
  b3:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  b6:	89 10                	mov    DWORD PTR [rax],edx
  b8:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
  bc:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  bf:	89 10                	mov    DWORD PTR [rax],edx
  c1:	b8 01 00 00 00       	mov    eax,0x1
  c6:	eb 20                	jmp    e8 <two_sum+0x97>
  c8:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
  cc:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  cf:	3b 45 18             	cmp    eax,DWORD PTR [rbp+0x18]
  d2:	7c a8                	jl     7c <two_sum+0x2b>
  d4:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
  d8:	8b 45 18             	mov    eax,DWORD PTR [rbp+0x18]
  db:	83 e8 01             	sub    eax,0x1
  de:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
  e1:	7c 8e                	jl     71 <two_sum+0x20>
  e3:	b8 00 00 00 00       	mov    eax,0x0
  e8:	48 83 c4 10          	add    rsp,0x10
  ec:	5d                   	pop    rbp
  ed:	c3                   	ret    

00000000000000ee <main>:
  ee:	55                   	push   rbp
  ef:	48 89 e5             	mov    rbp,rsp
  f2:	48 83 ec 60          	sub    rsp,0x60
  f6:	e8 00 00 00 00       	call   fb <main+0xd>
  fb:	c7 45 e0 02 00 00 00 	mov    DWORD PTR [rbp-0x20],0x2
 102:	c7 45 e4 07 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x7
 109:	c7 45 e8 0b 00 00 00 	mov    DWORD PTR [rbp-0x18],0xb
 110:	c7 45 ec 0f 00 00 00 	mov    DWORD PTR [rbp-0x14],0xf
 117:	c7 45 fc 04 00 00 00 	mov    DWORD PTR [rbp-0x4],0x4
 11e:	c7 45 f8 09 00 00 00 	mov    DWORD PTR [rbp-0x8],0x9
 125:	4c 8d 4d dc          	lea    r9,[rbp-0x24]
 129:	44 8b 45 f8          	mov    r8d,DWORD PTR [rbp-0x8]
 12d:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
 130:	48 8d 45 e0          	lea    rax,[rbp-0x20]
 134:	48 8d 4d d8          	lea    rcx,[rbp-0x28]
 138:	48 89 4c 24 20       	mov    QWORD PTR [rsp+0x20],rcx
 13d:	48 89 c1             	mov    rcx,rax
 140:	e8 0c ff ff ff       	call   51 <two_sum>
 145:	84 c0                	test   al,al
 147:	74 42                	je     18b <main+0x9d>
 149:	8b 55 d8             	mov    edx,DWORD PTR [rbp-0x28]
 14c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
 14f:	41 89 d0             	mov    r8d,edx
 152:	89 c2                	mov    edx,eax
 154:	48 8d 05 00 00 00 00 	lea    rax,[rip+0x0]        # 15b <main+0x6d>
 15b:	48 89 c1             	mov    rcx,rax
 15e:	e8 9d fe ff ff       	call   0 <printf>
 163:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
 166:	48 98                	cdqe   
 168:	8b 54 85 e0          	mov    edx,DWORD PTR [rbp+rax*4-0x20]
 16c:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
 16f:	48 98                	cdqe   
 171:	8b 44 85 e0          	mov    eax,DWORD PTR [rbp+rax*4-0x20]
 175:	41 89 d0             	mov    r8d,edx
 178:	89 c2                	mov    edx,eax
 17a:	48 8d 05 11 00 00 00 	lea    rax,[rip+0x11]        # 192 <main+0xa4>
 181:	48 89 c1             	mov    rcx,rax
 184:	e8 77 fe ff ff       	call   0 <printf>
 189:	eb 14                	jmp    19f <main+0xb1>
 18b:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
 18e:	89 c2                	mov    edx,eax
 190:	48 8d 05 22 00 00 00 	lea    rax,[rip+0x22]        # 1b9 <main+0xcb>
 197:	48 89 c1             	mov    rcx,rax
 19a:	e8 61 fe ff ff       	call   0 <printf>
 19f:	b8 00 00 00 00       	mov    eax,0x0
 1a4:	48 83 c4 60          	add    rsp,0x60
 1a8:	5d                   	pop    rbp
 1a9:	c3                   	ret    
 1aa:	90                   	nop
 1ab:	90                   	nop
 1ac:	90                   	nop
 1ad:	90                   	nop
 1ae:	90                   	nop
 1af:	90                   	nop
