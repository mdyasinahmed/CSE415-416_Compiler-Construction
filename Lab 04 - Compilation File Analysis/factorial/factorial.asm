
factorial.o:     file format pe-x86-64


Disassembly of section .text:

0000000000000000 <scanf>:
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
  27:	b9 00 00 00 00       	mov    ecx,0x0
  2c:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 33 <scanf+0x33>
  33:	ff d0                	call   rax
  35:	49 89 d8             	mov    r8,rbx
  38:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  3c:	48 89 c1             	mov    rcx,rax
  3f:	e8 00 00 00 00       	call   44 <scanf+0x44>
  44:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  47:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  4a:	48 83 c4 38          	add    rsp,0x38
  4e:	5b                   	pop    rbx
  4f:	5d                   	pop    rbp
  50:	c3                   	ret    

0000000000000051 <printf>:
  51:	55                   	push   rbp
  52:	53                   	push   rbx
  53:	48 83 ec 38          	sub    rsp,0x38
  57:	48 8d 6c 24 30       	lea    rbp,[rsp+0x30]
  5c:	48 89 4d 20          	mov    QWORD PTR [rbp+0x20],rcx
  60:	48 89 55 28          	mov    QWORD PTR [rbp+0x28],rdx
  64:	4c 89 45 30          	mov    QWORD PTR [rbp+0x30],r8
  68:	4c 89 4d 38          	mov    QWORD PTR [rbp+0x38],r9
  6c:	48 8d 45 28          	lea    rax,[rbp+0x28]
  70:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  74:	48 8b 5d f0          	mov    rbx,QWORD PTR [rbp-0x10]
  78:	b9 01 00 00 00       	mov    ecx,0x1
  7d:	48 8b 05 00 00 00 00 	mov    rax,QWORD PTR [rip+0x0]        # 84 <printf+0x33>
  84:	ff d0                	call   rax
  86:	49 89 d8             	mov    r8,rbx
  89:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
  8d:	48 89 c1             	mov    rcx,rax
  90:	e8 00 00 00 00       	call   95 <printf+0x44>
  95:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  98:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  9b:	48 83 c4 38          	add    rsp,0x38
  9f:	5b                   	pop    rbx
  a0:	5d                   	pop    rbp
  a1:	c3                   	ret    

00000000000000a2 <factorial>:
  a2:	55                   	push   rbp
  a3:	48 89 e5             	mov    rbp,rsp
  a6:	48 83 ec 10          	sub    rsp,0x10
  aa:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
  ad:	83 7d 10 00          	cmp    DWORD PTR [rbp+0x10],0x0
  b1:	79 07                	jns    ba <factorial+0x18>
  b3:	b8 00 00 00 00       	mov    eax,0x0
  b8:	eb 32                	jmp    ec <factorial+0x4a>
  ba:	48 c7 45 f8 01 00 00 	mov    QWORD PTR [rbp-0x8],0x1
  c1:	00 
  c2:	c7 45 f4 02 00 00 00 	mov    DWORD PTR [rbp-0xc],0x2
  c9:	eb 15                	jmp    e0 <factorial+0x3e>
  cb:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  ce:	48 98                	cdqe   
  d0:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
  d4:	48 0f af c2          	imul   rax,rdx
  d8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  dc:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
  e0:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  e3:	3b 45 10             	cmp    eax,DWORD PTR [rbp+0x10]
  e6:	7e e3                	jle    cb <factorial+0x29>
  e8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  ec:	48 83 c4 10          	add    rsp,0x10
  f0:	5d                   	pop    rbp
  f1:	c3                   	ret    

00000000000000f2 <main>:
  f2:	55                   	push   rbp
  f3:	48 89 e5             	mov    rbp,rsp
  f6:	48 83 ec 30          	sub    rsp,0x30
  fa:	e8 00 00 00 00       	call   ff <main+0xd>
  ff:	48 8d 05 00 00 00 00 	lea    rax,[rip+0x0]        # 106 <main+0x14>
 106:	48 89 c1             	mov    rcx,rax
 109:	e8 43 ff ff ff       	call   51 <printf>
 10e:	48 8d 45 fc          	lea    rax,[rbp-0x4]
 112:	48 89 c2             	mov    rdx,rax
 115:	48 8d 05 1f 00 00 00 	lea    rax,[rip+0x1f]        # 13b <main+0x49>
 11c:	48 89 c1             	mov    rcx,rax
 11f:	e8 dc fe ff ff       	call   0 <scanf>
 124:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
 127:	85 c0                	test   eax,eax
 129:	79 11                	jns    13c <main+0x4a>
 12b:	48 8d 05 28 00 00 00 	lea    rax,[rip+0x28]        # 15a <main+0x68>
 132:	48 89 c1             	mov    rcx,rax
 135:	e8 17 ff ff ff       	call   51 <printf>
 13a:	eb 24                	jmp    160 <main+0x6e>
 13c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
 13f:	89 c1                	mov    ecx,eax
 141:	e8 5c ff ff ff       	call   a2 <factorial>
 146:	48 89 c2             	mov    rdx,rax
 149:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
 14c:	49 89 d0             	mov    r8,rdx
 14f:	89 c2                	mov    edx,eax
 151:	48 8d 05 58 00 00 00 	lea    rax,[rip+0x58]        # 1b0 <main+0xbe>
 158:	48 89 c1             	mov    rcx,rax
 15b:	e8 f1 fe ff ff       	call   51 <printf>
 160:	b8 00 00 00 00       	mov    eax,0x0
 165:	48 83 c4 30          	add    rsp,0x30
 169:	5d                   	pop    rbp
 16a:	c3                   	ret    
 16b:	90                   	nop
 16c:	90                   	nop
 16d:	90                   	nop
 16e:	90                   	nop
 16f:	90                   	nop
