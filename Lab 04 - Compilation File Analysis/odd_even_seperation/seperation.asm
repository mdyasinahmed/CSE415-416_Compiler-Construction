
seperation.o:     file format pe-x86-64


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

00000000000000a2 <main>:
  a2:	55                   	push   rbp
  a3:	41 55                	push   r13
  a5:	41 54                	push   r12
  a7:	57                   	push   rdi
  a8:	56                   	push   rsi
  a9:	53                   	push   rbx
  aa:	48 83 ec 48          	sub    rsp,0x48
  ae:	48 8d 6c 24 40       	lea    rbp,[rsp+0x40]
  b3:	e8 00 00 00 00       	call   b8 <main+0x16>
  b8:	48 89 e0             	mov    rax,rsp
  bb:	48 89 c3             	mov    rbx,rax
  be:	48 8d 05 00 00 00 00 	lea    rax,[rip+0x0]        # c5 <main+0x23>
  c5:	48 89 c1             	mov    rcx,rax
  c8:	e8 84 ff ff ff       	call   51 <printf>
  cd:	48 8d 45 e4          	lea    rax,[rbp-0x1c]
  d1:	48 89 c2             	mov    rdx,rax
  d4:	48 8d 05 1f 00 00 00 	lea    rax,[rip+0x1f]        # fa <main+0x58>
  db:	48 89 c1             	mov    rcx,rax
  de:	e8 1d ff ff ff       	call   0 <scanf>
  e3:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
  e6:	48 63 d0             	movsxd rdx,eax
  e9:	48 83 ea 01          	sub    rdx,0x1
  ed:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
  f1:	48 63 d0             	movsxd rdx,eax
  f4:	49 89 d4             	mov    r12,rdx
  f7:	41 bd 00 00 00 00    	mov    r13d,0x0
  fd:	48 63 d0             	movsxd rdx,eax
 100:	48 89 d6             	mov    rsi,rdx
 103:	bf 00 00 00 00       	mov    edi,0x0
 108:	48 98                	cdqe   
 10a:	48 c1 e0 02          	shl    rax,0x2
 10e:	48 83 c0 0f          	add    rax,0xf
 112:	48 c1 e8 04          	shr    rax,0x4
 116:	48 c1 e0 04          	shl    rax,0x4
 11a:	e8 00 00 00 00       	call   11f <main+0x7d>
 11f:	48 29 c4             	sub    rsp,rax
 122:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
 127:	48 83 c0 03          	add    rax,0x3
 12b:	48 c1 e8 02          	shr    rax,0x2
 12f:	48 c1 e0 02          	shl    rax,0x2
 133:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
 137:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
 13a:	89 c2                	mov    edx,eax
 13c:	48 8d 05 22 00 00 00 	lea    rax,[rip+0x22]        # 165 <main+0xc3>
 143:	48 89 c1             	mov    rcx,rax
 146:	e8 06 ff ff ff       	call   51 <printf>
 14b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
 152:	eb 2a                	jmp    17e <main+0xdc>
 154:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
 157:	48 98                	cdqe   
 159:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
 160:	00 
 161:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
 165:	48 01 d0             	add    rax,rdx
 168:	48 89 c2             	mov    rdx,rax
 16b:	48 8d 05 1f 00 00 00 	lea    rax,[rip+0x1f]        # 191 <main+0xef>
 172:	48 89 c1             	mov    rcx,rax
 175:	e8 86 fe ff ff       	call   0 <scanf>
 17a:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
 17e:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
 181:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
 184:	7c ce                	jl     154 <main+0xb2>
 186:	48 8d 05 36 00 00 00 	lea    rax,[rip+0x36]        # 1c3 <main+0x121>
 18d:	48 89 c1             	mov    rcx,rax
 190:	e8 bc fe ff ff       	call   51 <printf>
 195:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
 19c:	eb 36                	jmp    1d4 <main+0x132>
 19e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
 1a2:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
 1a5:	48 63 d2             	movsxd rdx,edx
 1a8:	8b 04 90             	mov    eax,DWORD PTR [rax+rdx*4]
 1ab:	83 e0 01             	and    eax,0x1
 1ae:	85 c0                	test   eax,eax
 1b0:	74 1e                	je     1d0 <main+0x12e>
 1b2:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
 1b6:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
 1b9:	48 63 d2             	movsxd rdx,edx
 1bc:	8b 04 90             	mov    eax,DWORD PTR [rax+rdx*4]
 1bf:	89 c2                	mov    edx,eax
 1c1:	48 8d 05 44 00 00 00 	lea    rax,[rip+0x44]        # 20c <main+0x16a>
 1c8:	48 89 c1             	mov    rcx,rax
 1cb:	e8 81 fe ff ff       	call   51 <printf>
 1d0:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
 1d4:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
 1d7:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
 1da:	7c c2                	jl     19e <main+0xfc>
 1dc:	48 8d 05 48 00 00 00 	lea    rax,[rip+0x48]        # 22b <main+0x189>
 1e3:	48 89 c1             	mov    rcx,rax
 1e6:	e8 66 fe ff ff       	call   51 <printf>
 1eb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
 1f2:	eb 36                	jmp    22a <main+0x188>
 1f4:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
 1f8:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
 1fb:	48 63 d2             	movsxd rdx,edx
 1fe:	8b 04 90             	mov    eax,DWORD PTR [rax+rdx*4]
 201:	83 e0 01             	and    eax,0x1
 204:	85 c0                	test   eax,eax
 206:	75 1e                	jne    226 <main+0x184>
 208:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
 20c:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
 20f:	48 63 d2             	movsxd rdx,edx
 212:	8b 04 90             	mov    eax,DWORD PTR [rax+rdx*4]
 215:	89 c2                	mov    edx,eax
 217:	48 8d 05 44 00 00 00 	lea    rax,[rip+0x44]        # 262 <main+0x1c0>
 21e:	48 89 c1             	mov    rcx,rax
 221:	e8 2b fe ff ff       	call   51 <printf>
 226:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
 22a:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
 22d:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
 230:	7c c2                	jl     1f4 <main+0x152>
 232:	48 8d 05 58 00 00 00 	lea    rax,[rip+0x58]        # 291 <main+0x1ef>
 239:	48 89 c1             	mov    rcx,rax
 23c:	e8 10 fe ff ff       	call   51 <printf>
 241:	b8 00 00 00 00       	mov    eax,0x0
 246:	48 89 dc             	mov    rsp,rbx
 249:	48 8d 65 08          	lea    rsp,[rbp+0x8]
 24d:	5b                   	pop    rbx
 24e:	5e                   	pop    rsi
 24f:	5f                   	pop    rdi
 250:	41 5c                	pop    r12
 252:	41 5d                	pop    r13
 254:	5d                   	pop    rbp
 255:	c3                   	ret    
 256:	90                   	nop
 257:	90                   	nop
 258:	90                   	nop
 259:	90                   	nop
 25a:	90                   	nop
 25b:	90                   	nop
 25c:	90                   	nop
 25d:	90                   	nop
 25e:	90                   	nop
 25f:	90                   	nop
