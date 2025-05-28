
palindrome.o:     file format pe-x86-64


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

00000000000000a2 <isPalindrome>:
  a2:	55                   	push   rbp
  a3:	48 89 e5             	mov    rbp,rsp
  a6:	48 83 ec 10          	sub    rsp,0x10
  aa:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
  ad:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
  b4:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
  b7:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  ba:	eb 64                	jmp    120 <isPalindrome+0x7e>
  bc:	8b 55 10             	mov    edx,DWORD PTR [rbp+0x10]
  bf:	48 63 c2             	movsxd rax,edx
  c2:	48 69 c0 67 66 66 66 	imul   rax,rax,0x66666667
  c9:	48 c1 e8 20          	shr    rax,0x20
  cd:	c1 f8 02             	sar    eax,0x2
  d0:	41 89 d0             	mov    r8d,edx
  d3:	41 c1 f8 1f          	sar    r8d,0x1f
  d7:	44 29 c0             	sub    eax,r8d
  da:	89 c1                	mov    ecx,eax
  dc:	89 c8                	mov    eax,ecx
  de:	c1 e0 02             	shl    eax,0x2
  e1:	01 c8                	add    eax,ecx
  e3:	01 c0                	add    eax,eax
  e5:	29 c2                	sub    edx,eax
  e7:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
  ea:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
  ed:	89 d0                	mov    eax,edx
  ef:	c1 e0 02             	shl    eax,0x2
  f2:	01 d0                	add    eax,edx
  f4:	01 c0                	add    eax,eax
  f6:	89 c2                	mov    edx,eax
  f8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  fb:	01 d0                	add    eax,edx
  fd:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
 100:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
 103:	48 63 d0             	movsxd rdx,eax
 106:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
 10d:	48 c1 ea 20          	shr    rdx,0x20
 111:	c1 fa 02             	sar    edx,0x2
 114:	c1 f8 1f             	sar    eax,0x1f
 117:	89 c1                	mov    ecx,eax
 119:	89 d0                	mov    eax,edx
 11b:	29 c8                	sub    eax,ecx
 11d:	89 45 10             	mov    DWORD PTR [rbp+0x10],eax
 120:	83 7d 10 00          	cmp    DWORD PTR [rbp+0x10],0x0
 124:	7f 96                	jg     bc <isPalindrome+0x1a>
 126:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
 129:	3b 45 fc             	cmp    eax,DWORD PTR [rbp-0x4]
 12c:	0f 94 c0             	sete   al
 12f:	0f b6 c0             	movzx  eax,al
 132:	48 83 c4 10          	add    rsp,0x10
 136:	5d                   	pop    rbp
 137:	c3                   	ret    

0000000000000138 <main>:
 138:	55                   	push   rbp
 139:	48 89 e5             	mov    rbp,rsp
 13c:	48 83 ec 30          	sub    rsp,0x30
 140:	e8 00 00 00 00       	call   145 <main+0xd>
 145:	48 8d 05 00 00 00 00 	lea    rax,[rip+0x0]        # 14c <main+0x14>
 14c:	48 89 c1             	mov    rcx,rax
 14f:	e8 fd fe ff ff       	call   51 <printf>
 154:	48 8d 45 fc          	lea    rax,[rbp-0x4]
 158:	48 89 c2             	mov    rdx,rax
 15b:	48 8d 05 11 00 00 00 	lea    rax,[rip+0x11]        # 173 <main+0x3b>
 162:	48 89 c1             	mov    rcx,rax
 165:	e8 96 fe ff ff       	call   0 <scanf>
 16a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
 16d:	89 c1                	mov    ecx,eax
 16f:	e8 2e ff ff ff       	call   a2 <isPalindrome>
 174:	85 c0                	test   eax,eax
 176:	74 16                	je     18e <main+0x56>
 178:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
 17b:	89 c2                	mov    edx,eax
 17d:	48 8d 05 14 00 00 00 	lea    rax,[rip+0x14]        # 198 <main+0x60>
 184:	48 89 c1             	mov    rcx,rax
 187:	e8 c5 fe ff ff       	call   51 <printf>
 18c:	eb 14                	jmp    1a2 <main+0x6a>
 18e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
 191:	89 c2                	mov    edx,eax
 193:	48 8d 05 30 00 00 00 	lea    rax,[rip+0x30]        # 1ca <main+0x92>
 19a:	48 89 c1             	mov    rcx,rax
 19d:	e8 af fe ff ff       	call   51 <printf>
 1a2:	b8 00 00 00 00       	mov    eax,0x0
 1a7:	48 83 c4 30          	add    rsp,0x30
 1ab:	5d                   	pop    rbp
 1ac:	c3                   	ret    
 1ad:	90                   	nop
 1ae:	90                   	nop
 1af:	90                   	nop
