
kernel.elf：     文件格式 elf64-x86-64


Disassembly of section .boot:

0000000000100000 <multiboot_header>:
  100000:	d6                   	(bad)  
  100001:	50                   	push   %rax
  100002:	52                   	push   %rdx
  100003:	e8 00 00 00 00       	callq  100008 <multiboot_header+0x8>
  100008:	58                   	pop    %rax
  100009:	00 00                	add    %al,(%rax)
  10000b:	00 d2                	add    %dl,%dl
  10000d:	ae                   	scas   %es:(%rdi),%al
  10000e:	ad                   	lods   %ds:(%rsi),%eax
  10000f:	17                   	(bad)  

0000000000100010 <address_tag_start>:
  100010:	02 00                	add    (%rax),%al
  100012:	01 00                	add    %eax,(%rax)
  100014:	18 00                	sbb    %al,(%rax)
  100016:	00 00                	add    %al,(%rax)
  100018:	00 00                	add    %al,(%rax)
  10001a:	10 00                	adc    %al,(%rax)
  10001c:	00 00                	add    %al,(%rax)
  10001e:	10 00                	adc    %al,(%rax)
  100020:	00 60 10             	add    %ah,0x10(%rax)
  100023:	00 00                	add    %al,(%rax)
  100025:	00 00                	add    %al,(%rax)
	...

0000000000100028 <address_tag_end>:
  100028:	03 00                	add    (%rax),%eax
  10002a:	01 00                	add    %eax,(%rax)
  10002c:	10 00                	adc    %al,(%rax)
  10002e:	00 00                	add    %al,(%rax)
  100030:	c0 00 10             	rolb   $0x10,(%rax)
  100033:	00 00                	add    %al,(%rax)
  100035:	00 00                	add    %al,(%rax)
	...

0000000000100038 <entry_tag_end>:
  100038:	05 00 01 00 18       	add    $0x18000100,%eax
  10003d:	00 00                	add    %al,(%rax)
  10003f:	00 00                	add    %al,(%rax)
  100041:	04 00                	add    $0x0,%al
  100043:	00 00                	add    %al,(%rax)
  100045:	03 00                	add    (%rax),%eax
  100047:	00 20                	add    %ah,(%rax)
  100049:	00 00                	add    %al,(%rax)
  10004b:	00 00                	add    %al,(%rax)
  10004d:	00 00                	add    %al,(%rax)
	...

0000000000100050 <framebuffer_tag_end>:
  100050:	00 00                	add    %al,(%rax)
  100052:	00 00                	add    %al,(%rax)
  100054:	08 00                	or     %al,(%rax)
	...

0000000000100058 <gdt0>:
	...
  100064:	00 9a 20 00 00 00    	add    %bl,0x20(%rdx)
  10006a:	00 00                	add    %al,(%rax)
  10006c:	00 92 20 00 17 00    	add    %dl,0x170020(%rdx)

0000000000100070 <temp_gdt_ptr>:
  100070:	17                   	(bad)  
  100071:	00 00                	add    %al,(%rax)
  100073:	10 00                	adc    %al,(%rax)
  100075:	00 00                	add    %al,(%rax)
  100077:	00 00                	add    %al,(%rax)
	...

000000000010007a <gdt_ptr>:
  10007a:	ff 07                	incl   (%rdi)
  10007c:	00 10                	add    %dl,(%rax)
  10007e:	00 00                	add    %al,(%rax)
  100080:	00 ff                	add    %bh,%bh
  100082:	ff                   	(bad)  
  100083:	ff 90 90 90 90 90    	callq  *-0x6f6f6f70(%rax)
  100089:	90                   	nop
  10008a:	90                   	nop
  10008b:	90                   	nop
  10008c:	90                   	nop
  10008d:	90                   	nop
  10008e:	90                   	nop
  10008f:	90                   	nop
  100090:	90                   	nop
  100091:	90                   	nop
  100092:	90                   	nop
  100093:	90                   	nop
  100094:	90                   	nop
  100095:	90                   	nop
  100096:	90                   	nop
  100097:	90                   	nop
  100098:	90                   	nop
  100099:	90                   	nop
  10009a:	90                   	nop
  10009b:	90                   	nop
  10009c:	90                   	nop
  10009d:	90                   	nop
  10009e:	90                   	nop
  10009f:	90                   	nop
  1000a0:	90                   	nop
  1000a1:	90                   	nop
  1000a2:	90                   	nop
  1000a3:	90                   	nop
  1000a4:	90                   	nop
  1000a5:	90                   	nop
  1000a6:	90                   	nop
  1000a7:	90                   	nop
  1000a8:	90                   	nop
  1000a9:	90                   	nop
  1000aa:	90                   	nop
  1000ab:	90                   	nop
  1000ac:	90                   	nop
  1000ad:	90                   	nop
  1000ae:	90                   	nop
  1000af:	90                   	nop
  1000b0:	90                   	nop
  1000b1:	90                   	nop
  1000b2:	90                   	nop
  1000b3:	90                   	nop
  1000b4:	90                   	nop
  1000b5:	90                   	nop
  1000b6:	90                   	nop
  1000b7:	90                   	nop
  1000b8:	90                   	nop
  1000b9:	90                   	nop
  1000ba:	90                   	nop
  1000bb:	90                   	nop
  1000bc:	90                   	nop
  1000bd:	90                   	nop
  1000be:	90                   	nop
  1000bf:	90                   	nop

00000000001000c0 <_start>:
  1000c0:	66 8c d8             	mov    %ds,%ax
  1000c3:	8e c0                	mov    %eax,%es
  1000c5:	8b 0b                	mov    (%rbx),%ecx
  1000c7:	c1 e9 02             	shr    $0x2,%ecx
  1000ca:	89 de                	mov    %ebx,%esi
  1000cc:	bf 00 05 00 00       	mov    $0x500,%edi
  1000d1:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  1000d3:	be 58 00 10 00       	mov    $0x100058,%esi
  1000d8:	bf 00 10 00 00       	mov    $0x1000,%edi
  1000dd:	b9 06 00 00 00       	mov    $0x6,%ecx
  1000e2:	f3 a5                	rep movsl %ds:(%rsi),%es:(%rdi)
  1000e4:	b8 01 00 00 00       	mov    $0x1,%eax
  1000e9:	0f a2                	cpuid  
  1000eb:	c1 eb 10             	shr    $0x10,%ebx
  1000ee:	81 e3 ff 00 00 00    	and    $0xff,%ebx
  1000f4:	b8 00 20 00 00       	mov    $0x2000,%eax
  1000f9:	f7 e3                	mul    %ebx
  1000fb:	05 00 e0 00 00       	add    $0xe000,%eax
  100100:	89 c4                	mov    %eax,%esp
  100102:	b8 00 80 00 00       	mov    $0x8000,%eax
  100107:	f7 e3                	mul    %ebx
  100109:	05 00 80 00 00       	add    $0x8000,%eax
  10010e:	6a 00                	pushq  $0x0
  100110:	50                   	push   %rax
  100111:	b8 00 80 00 00       	mov    $0x8000,%eax
  100116:	c7 00 83 00 00 00    	movl   $0x83,(%rax)
  10011c:	c7 40 08 83 00 20 00 	movl   $0x200083,0x8(%rax)
  100123:	c7 40 10 83 00 40 00 	movl   $0x400083,0x10(%rax)
  10012a:	c7 40 18 83 00 60 00 	movl   $0x600083,0x18(%rax)
  100131:	31 d2                	xor    %edx,%edx
  100133:	89 50 04             	mov    %edx,0x4(%rax)
  100136:	89 50 0c             	mov    %edx,0xc(%rax)
  100139:	89 50 14             	mov    %edx,0x14(%rax)
  10013c:	89 50 1c             	mov    %edx,0x1c(%rax)
  10013f:	0c 03                	or     $0x3,%al
  100141:	be 00 30 00 00       	mov    $0x3000,%esi
  100146:	89 06                	mov    %eax,(%rsi)
  100148:	89 56 04             	mov    %edx,0x4(%rsi)
  10014b:	bf 00 50 00 00       	mov    $0x5000,%edi
  100150:	89 07                	mov    %eax,(%rdi)
  100152:	89 57 04             	mov    %edx,0x4(%rdi)
  100155:	b8 00 20 00 00       	mov    $0x2000,%eax
  10015a:	c7 00 07 30 00 00    	movl   $0x3007,(%rax)
  100160:	89 50 04             	mov    %edx,0x4(%rax)
  100163:	c7 80 f0 0f 00 00 03 	movl   $0x5003,0xff0(%rax)
  10016a:	50 00 00 
  10016d:	89 90 f4 0f 00 00    	mov    %edx,0xff4(%rax)
  100173:	0f 22 d8             	mov    %rax,%cr3
  100176:	0f 20 e0             	mov    %cr4,%rax
  100179:	0d a0 06 00 00       	or     $0x6a0,%eax
  10017e:	0f 22 e0             	mov    %rax,%cr4
  100181:	b9 80 00 00 c0       	mov    $0xc0000080,%ecx
  100186:	0f 32                	rdmsr  
  100188:	0d 01 09 00 00       	or     $0x901,%eax
  10018d:	0f 30                	wrmsr  
  10018f:	0f 20 c0             	mov    %cr0,%rax
  100192:	25 fb ff ff 1f       	and    $0x1ffffffb,%eax
  100197:	0d 02 00 00 80       	or     $0x80000002,%eax
  10019c:	0f 22 c0             	mov    %rax,%cr0
  10019f:	0f 01 15 70 00 10 00 	lgdt   0x100070(%rip)        # 200216 <__multiboot_load_end+0xfa216>
  1001a6:	ea                   	(bad)  
  1001a7:	ad                   	lods   %ds:(%rsi),%eax
  1001a8:	01 10                	add    %edx,(%rax)
  1001aa:	00 08                	add    %cl,(%rax)
  1001ac:	00 48 b9             	add    %cl,-0x47(%rax)
  1001af:	00 30                	add    %dh,(%rax)
  1001b1:	10 00                	adc    %al,(%rax)
  1001b3:	00 ff                	add    %bh,%bh
  1001b5:	ff                   	(bad)  
  1001b6:	ff                   	(bad)  
  1001b7:	ff e1                	jmpq   *%rcx

Disassembly of section .init:

ffffff0000101000 <__init_array_start>:
ffffff0000101000:	f0 47 10 00          	lock rex.RXB adc %r8b,(%r8)
ffffff0000101004:	00 ff                	add    %bh,%bh
ffffff0000101006:	ff                   	(bad)  
ffffff0000101007:	ff 0f                	decl   (%rdi)

ffffff0000101008 <__init_array_end>:
ffffff0000101008:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
ffffff000010100f:	00 

ffffff0000101010 <_ZN6x86_648pre_initEm>:
ffffff0000101010:	48 89 f8             	mov    %rdi,%rax
ffffff0000101013:	48 a3 30 56 10 00 00 	movabs %rax,0xffffff0000105630
ffffff000010101a:	ff ff ff 
ffffff000010101d:	c3                   	retq   
ffffff000010101e:	66 90                	xchg   %ax,%ax

ffffff0000101020 <_ZN6x86_644initEv>:
ffffff0000101020:	55                   	push   %rbp
ffffff0000101021:	53                   	push   %rbx
ffffff0000101022:	48 bf e0 55 10 00 00 	movabs $0xffffff00001055e0,%rdi
ffffff0000101029:	ff ff ff 
ffffff000010102c:	48 b8 a0 13 10 00 00 	movabs $0xffffff00001013a0,%rax
ffffff0000101033:	ff ff ff 
ffffff0000101036:	48 83 ec 08          	sub    $0x8,%rsp
ffffff000010103a:	ff d0                	callq  *%rax
ffffff000010103c:	48 b8 10 40 10 00 00 	movabs $0xffffff0000104010,%rax
ffffff0000101043:	ff ff ff 
ffffff0000101046:	ff d0                	callq  *%rax
ffffff0000101048:	48 b8 e0 13 10 00 00 	movabs $0xffffff00001013e0,%rax
ffffff000010104f:	ff ff ff 
ffffff0000101052:	ff d0                	callq  *%rax
ffffff0000101054:	be 1b 00 00 00       	mov    $0x1b,%esi
ffffff0000101059:	89 f1                	mov    %esi,%ecx
ffffff000010105b:	0f 32                	rdmsr  
ffffff000010105d:	48 25 00 f0 ff ff    	and    $0xfffffffffffff000,%rax
ffffff0000101063:	48 89 c5             	mov    %rax,%rbp
ffffff0000101066:	0f 32                	rdmsr  
ffffff0000101068:	80 cc 08             	or     $0x8,%ah
ffffff000010106b:	0f 30                	wrmsr  
ffffff000010106d:	b8 01 00 00 00       	mov    $0x1,%eax
ffffff0000101072:	0f a2                	cpuid  
ffffff0000101074:	c1 eb 18             	shr    $0x18,%ebx
ffffff0000101077:	89 f1                	mov    %esi,%ecx
ffffff0000101079:	89 da                	mov    %ebx,%edx
ffffff000010107b:	0f 32                	rdmsr  
ffffff000010107d:	48 be 89 51 10 00 00 	movabs $0xffffff0000105189,%rsi
ffffff0000101084:	ff ff ff 
ffffff0000101087:	f6 c4 01             	test   $0x1,%ah
ffffff000010108a:	48 b8 8d 51 10 00 00 	movabs $0xffffff000010518d,%rax
ffffff0000101091:	ff ff ff 
ffffff0000101094:	48 0f 44 f0          	cmove  %rax,%rsi
ffffff0000101098:	48 89 e9             	mov    %rbp,%rcx
ffffff000010109b:	31 c0                	xor    %eax,%eax
ffffff000010109d:	48 bf 90 51 10 00 00 	movabs $0xffffff0000105190,%rdi
ffffff00001010a4:	ff ff ff 
ffffff00001010a7:	49 b8 e0 34 10 00 00 	movabs $0xffffff00001034e0,%r8
ffffff00001010ae:	ff ff ff 
ffffff00001010b1:	41 ff d0             	callq  *%r8
ffffff00001010b4:	48 b8 00 00 00 00 00 	movabs $0xffffff0000000000,%rax
ffffff00001010bb:	ff ff ff 
ffffff00001010be:	48 01 e8             	add    %rbp,%rax
ffffff00001010c1:	48 a3 10 57 10 00 00 	movabs %rax,0xffffff0000105710
ffffff00001010c8:	ff ff ff 
ffffff00001010cb:	48 83 c4 08          	add    $0x8,%rsp
ffffff00001010cf:	48 b8 a0 12 10 00 00 	movabs $0xffffff00001012a0,%rax
ffffff00001010d6:	ff ff ff 
ffffff00001010d9:	5b                   	pop    %rbx
ffffff00001010da:	5d                   	pop    %rbp
ffffff00001010db:	ff e0                	jmpq   *%rax
ffffff00001010dd:	0f 1f 00             	nopl   (%rax)

ffffff00001010e0 <_ZN6x86_644acpiL9init_restEv>:
ffffff00001010e0:	41 55                	push   %r13
ffffff00001010e2:	41 54                	push   %r12
ffffff00001010e4:	48 b8 d0 55 10 00 00 	movabs $0xffffff00001055d0,%rax
ffffff00001010eb:	ff ff ff 
ffffff00001010ee:	55                   	push   %rbp
ffffff00001010ef:	53                   	push   %rbx
ffffff00001010f0:	48 bf c0 51 10 00 00 	movabs $0xffffff00001051c0,%rdi
ffffff00001010f7:	ff ff ff 
ffffff00001010fa:	49 bd e0 34 10 00 00 	movabs $0xffffff00001034e0,%r13
ffffff0000101101:	ff ff ff 
ffffff0000101104:	48 bd f0 3d 10 00 00 	movabs $0xffffff0000103df0,%rbp
ffffff000010110b:	ff ff ff 
ffffff000010110e:	48 83 ec 38          	sub    $0x38,%rsp
ffffff0000101112:	48 8b 18             	mov    (%rax),%rbx
ffffff0000101115:	31 c0                	xor    %eax,%eax
ffffff0000101117:	4c 8d 64 24 20       	lea    0x20(%rsp),%r12
ffffff000010111c:	0f b6 4b 0f          	movzbl 0xf(%rbx),%ecx
ffffff0000101120:	48 8d 53 09          	lea    0x9(%rbx),%rdx
ffffff0000101124:	48 89 de             	mov    %rbx,%rsi
ffffff0000101127:	41 ff d5             	callq  *%r13
ffffff000010112a:	8b 5b 10             	mov    0x10(%rbx),%ebx
ffffff000010112d:	48 b8 00 00 00 00 00 	movabs $0xffffff0000000000,%rax
ffffff0000101134:	ff ff ff 
ffffff0000101137:	48 89 e7             	mov    %rsp,%rdi
ffffff000010113a:	ba 04 00 00 00       	mov    $0x4,%edx
ffffff000010113f:	48 01 c3             	add    %rax,%rbx
ffffff0000101142:	48 89 d8             	mov    %rbx,%rax
ffffff0000101145:	48 89 de             	mov    %rbx,%rsi
ffffff0000101148:	48 a3 c8 55 10 00 00 	movabs %rax,0xffffff00001055c8
ffffff000010114f:	ff ff ff 
ffffff0000101152:	ff d5                	callq  *%rbp
ffffff0000101154:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
ffffff0000101159:	48 8d 73 0a          	lea    0xa(%rbx),%rsi
ffffff000010115d:	ba 06 00 00 00       	mov    $0x6,%edx
ffffff0000101162:	ff d5                	callq  *%rbp
ffffff0000101164:	48 8d 73 10          	lea    0x10(%rbx),%rsi
ffffff0000101168:	ba 08 00 00 00       	mov    $0x8,%edx
ffffff000010116d:	4c 89 e7             	mov    %r12,%rdi
ffffff0000101170:	ff d5                	callq  *%rbp
ffffff0000101172:	c6 44 24 28 00       	movb   $0x0,0x28(%rsp)
ffffff0000101177:	c6 44 24 16 00       	movb   $0x0,0x16(%rsp)
ffffff000010117c:	48 83 ec 08          	sub    $0x8,%rsp
ffffff0000101180:	c6 44 24 0c 00       	movb   $0x0,0xc(%rsp)
ffffff0000101185:	8b 4b 04             	mov    0x4(%rbx),%ecx
ffffff0000101188:	31 c0                	xor    %eax,%eax
ffffff000010118a:	41 54                	push   %r12
ffffff000010118c:	44 0f b6 43 08       	movzbl 0x8(%rbx),%r8d
ffffff0000101191:	48 89 da             	mov    %rbx,%rdx
ffffff0000101194:	48 bf f8 51 10 00 00 	movabs $0xffffff00001051f8,%rdi
ffffff000010119b:	ff ff ff 
ffffff000010119e:	4c 8d 4c 24 20       	lea    0x20(%rsp),%r9
ffffff00001011a3:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
ffffff00001011a8:	41 ff d5             	callq  *%r13
ffffff00001011ab:	48 b8 c8 55 10 00 00 	movabs $0xffffff00001055c8,%rax
ffffff00001011b2:	ff ff ff 
ffffff00001011b5:	48 8b 08             	mov    (%rax),%rcx
ffffff00001011b8:	5e                   	pop    %rsi
ffffff00001011b9:	5f                   	pop    %rdi
ffffff00001011ba:	8b 41 04             	mov    0x4(%rcx),%eax
ffffff00001011bd:	48 8d 51 24          	lea    0x24(%rcx),%rdx
ffffff00001011c1:	48 8d 44 01 24       	lea    0x24(%rcx,%rax,1),%rax
ffffff00001011c6:	48 39 d0             	cmp    %rdx,%rax
ffffff00001011c9:	76 2b                	jbe    ffffff00001011f6 <_ZN6x86_644acpiL9init_restEv+0x116>
ffffff00001011cb:	48 bf 7d 52 10 00 00 	movabs $0xffffff000010527d,%rdi
ffffff00001011d2:	ff ff ff 
ffffff00001011d5:	8b 17                	mov    (%rdi),%edx
ffffff00001011d7:	39 51 24             	cmp    %edx,0x24(%rcx)
ffffff00001011da:	48 8d 59 28          	lea    0x28(%rcx),%rbx
ffffff00001011de:	75 11                	jne    ffffff00001011f1 <_ZN6x86_644acpiL9init_restEv+0x111>
ffffff00001011e0:	eb 36                	jmp    ffffff0000101218 <_ZN6x86_644acpiL9init_restEv+0x138>
ffffff00001011e2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
ffffff00001011e8:	48 83 c3 04          	add    $0x4,%rbx
ffffff00001011ec:	39 53 fc             	cmp    %edx,-0x4(%rbx)
ffffff00001011ef:	74 27                	je     ffffff0000101218 <_ZN6x86_644acpiL9init_restEv+0x138>
ffffff00001011f1:	48 39 d8             	cmp    %rbx,%rax
ffffff00001011f4:	77 f2                	ja     ffffff00001011e8 <_ZN6x86_644acpiL9init_restEv+0x108>
ffffff00001011f6:	48 be 7d 52 10 00 00 	movabs $0xffffff000010527d,%rsi
ffffff00001011fd:	ff ff ff 
ffffff0000101200:	48 bf 47 52 10 00 00 	movabs $0xffffff0000105247,%rdi
ffffff0000101207:	ff ff ff 
ffffff000010120a:	31 c0                	xor    %eax,%eax
ffffff000010120c:	41 ff d5             	callq  *%r13
ffffff000010120f:	eb 6d                	jmp    ffffff000010127e <_ZN6x86_644acpiL9init_restEv+0x19e>
ffffff0000101211:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
ffffff0000101218:	48 89 e7             	mov    %rsp,%rdi
ffffff000010121b:	ba 04 00 00 00       	mov    $0x4,%edx
ffffff0000101220:	48 89 de             	mov    %rbx,%rsi
ffffff0000101223:	ff d5                	callq  *%rbp
ffffff0000101225:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
ffffff000010122a:	48 8d 73 0a          	lea    0xa(%rbx),%rsi
ffffff000010122e:	ba 06 00 00 00       	mov    $0x6,%edx
ffffff0000101233:	ff d5                	callq  *%rbp
ffffff0000101235:	48 8d 73 10          	lea    0x10(%rbx),%rsi
ffffff0000101239:	ba 08 00 00 00       	mov    $0x8,%edx
ffffff000010123e:	4c 89 e7             	mov    %r12,%rdi
ffffff0000101241:	ff d5                	callq  *%rbp
ffffff0000101243:	c6 44 24 28 00       	movb   $0x0,0x28(%rsp)
ffffff0000101248:	c6 44 24 16 00       	movb   $0x0,0x16(%rsp)
ffffff000010124d:	48 83 ec 08          	sub    $0x8,%rsp
ffffff0000101251:	c6 44 24 0c 00       	movb   $0x0,0xc(%rsp)
ffffff0000101256:	8b 4b 04             	mov    0x4(%rbx),%ecx
ffffff0000101259:	48 89 da             	mov    %rbx,%rdx
ffffff000010125c:	41 54                	push   %r12
ffffff000010125e:	44 0f b6 43 08       	movzbl 0x8(%rbx),%r8d
ffffff0000101263:	31 c0                	xor    %eax,%eax
ffffff0000101265:	48 bf f8 51 10 00 00 	movabs $0xffffff00001051f8,%rdi
ffffff000010126c:	ff ff ff 
ffffff000010126f:	4c 8d 4c 24 20       	lea    0x20(%rsp),%r9
ffffff0000101274:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
ffffff0000101279:	41 ff d5             	callq  *%r13
ffffff000010127c:	58                   	pop    %rax
ffffff000010127d:	5a                   	pop    %rdx
ffffff000010127e:	48 b8 d8 55 10 00 00 	movabs $0xffffff00001055d8,%rax
ffffff0000101285:	ff ff ff 
ffffff0000101288:	c6 00 01             	movb   $0x1,(%rax)
ffffff000010128b:	48 83 c4 38          	add    $0x38,%rsp
ffffff000010128f:	5b                   	pop    %rbx
ffffff0000101290:	5d                   	pop    %rbp
ffffff0000101291:	41 5c                	pop    %r12
ffffff0000101293:	41 5d                	pop    %r13
ffffff0000101295:	c3                   	retq   
ffffff0000101296:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
ffffff000010129d:	00 00 00 

ffffff00001012a0 <_ZN6x86_644acpi4initEv>:
ffffff00001012a0:	48 b8 8f 52 10 00 00 	movabs $0xffffff000010528f,%rax
ffffff00001012a7:	ff ff ff 
ffffff00001012aa:	48 ba 00 00 0e 00 00 	movabs $0xffffff00000e0000,%rdx
ffffff00001012b1:	ff ff ff 
ffffff00001012b4:	48 8b 38             	mov    (%rax),%rdi
ffffff00001012b7:	49 b8 00 00 10 00 00 	movabs $0xffffff0000100000,%r8
ffffff00001012be:	ff ff ff 
ffffff00001012c1:	eb 0e                	jmp    ffffff00001012d1 <_ZN6x86_644acpi4initEv+0x31>
ffffff00001012c3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
ffffff00001012c8:	48 83 c2 10          	add    $0x10,%rdx
ffffff00001012cc:	4c 39 c2             	cmp    %r8,%rdx
ffffff00001012cf:	74 3a                	je     ffffff000010130b <_ZN6x86_644acpi4initEv+0x6b>
ffffff00001012d1:	48 39 3a             	cmp    %rdi,(%rdx)
ffffff00001012d4:	75 f2                	jne    ffffff00001012c8 <_ZN6x86_644acpi4initEv+0x28>
ffffff00001012d6:	48 89 d0             	mov    %rdx,%rax
ffffff00001012d9:	48 8d 72 14          	lea    0x14(%rdx),%rsi
ffffff00001012dd:	31 c9                	xor    %ecx,%ecx
ffffff00001012df:	48 a3 d0 55 10 00 00 	movabs %rax,0xffffff00001055d0
ffffff00001012e6:	ff ff ff 
ffffff00001012e9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
ffffff00001012f0:	02 08                	add    (%rax),%cl
ffffff00001012f2:	48 83 c0 01          	add    $0x1,%rax
ffffff00001012f6:	48 39 f0             	cmp    %rsi,%rax
ffffff00001012f9:	75 f5                	jne    ffffff00001012f0 <_ZN6x86_644acpi4initEv+0x50>
ffffff00001012fb:	84 c9                	test   %cl,%cl
ffffff00001012fd:	75 c9                	jne    ffffff00001012c8 <_ZN6x86_644acpi4initEv+0x28>
ffffff00001012ff:	48 b8 e0 10 10 00 00 	movabs $0xffffff00001010e0,%rax
ffffff0000101306:	ff ff ff 
ffffff0000101309:	ff e0                	jmpq   *%rax
ffffff000010130b:	48 b8 00 04 00 00 00 	movabs $0xffffff0000000400,%rax
ffffff0000101312:	ff ff ff 
ffffff0000101315:	49 b8 00 00 00 00 00 	movabs $0xffffff0000000000,%r8
ffffff000010131c:	ff ff ff 
ffffff000010131f:	49 ba 14 00 00 00 00 	movabs $0xffffff0000000014,%r10
ffffff0000101326:	ff ff ff 
ffffff0000101329:	0f b7 50 0e          	movzwl 0xe(%rax),%edx
ffffff000010132d:	c1 e2 04             	shl    $0x4,%edx
ffffff0000101330:	44 8d 8a 00 04 00 00 	lea    0x400(%rdx),%r9d
ffffff0000101337:	eb 0f                	jmp    ffffff0000101348 <_ZN6x86_644acpi4initEv+0xa8>
ffffff0000101339:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
ffffff0000101340:	83 c2 10             	add    $0x10,%edx
ffffff0000101343:	41 39 d1             	cmp    %edx,%r9d
ffffff0000101346:	76 39                	jbe    ffffff0000101381 <_ZN6x86_644acpi4initEv+0xe1>
ffffff0000101348:	89 d1                	mov    %edx,%ecx
ffffff000010134a:	4a 8d 04 01          	lea    (%rcx,%r8,1),%rax
ffffff000010134e:	48 39 38             	cmp    %rdi,(%rax)
ffffff0000101351:	75 ed                	jne    ffffff0000101340 <_ZN6x86_644acpi4initEv+0xa0>
ffffff0000101353:	48 a3 d0 55 10 00 00 	movabs %rax,0xffffff00001055d0
ffffff000010135a:	ff ff ff 
ffffff000010135d:	4c 01 d1             	add    %r10,%rcx
ffffff0000101360:	31 f6                	xor    %esi,%esi
ffffff0000101362:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
ffffff0000101368:	40 02 30             	add    (%rax),%sil
ffffff000010136b:	48 83 c0 01          	add    $0x1,%rax
ffffff000010136f:	48 39 c8             	cmp    %rcx,%rax
ffffff0000101372:	75 f4                	jne    ffffff0000101368 <_ZN6x86_644acpi4initEv+0xc8>
ffffff0000101374:	40 84 f6             	test   %sil,%sil
ffffff0000101377:	74 86                	je     ffffff00001012ff <_ZN6x86_644acpi4initEv+0x5f>
ffffff0000101379:	83 c2 10             	add    $0x10,%edx
ffffff000010137c:	41 39 d1             	cmp    %edx,%r9d
ffffff000010137f:	77 c7                	ja     ffffff0000101348 <_ZN6x86_644acpi4initEv+0xa8>
ffffff0000101381:	48 bf 60 52 10 00 00 	movabs $0xffffff0000105260,%rdi
ffffff0000101388:	ff ff ff 
ffffff000010138b:	31 c0                	xor    %eax,%eax
ffffff000010138d:	48 ba e0 34 10 00 00 	movabs $0xffffff00001034e0,%rdx
ffffff0000101394:	ff ff ff 
ffffff0000101397:	ff e2                	jmpq   *%rdx
ffffff0000101399:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

ffffff00001013a0 <_ZN6x86_644e8205setupEv>:
ffffff00001013a0:	48 b8 f0 55 10 00 00 	movabs $0xffffff00001055f0,%rax
ffffff00001013a7:	ff ff ff 
ffffff00001013aa:	48 83 ec 08          	sub    $0x8,%rsp
ffffff00001013ae:	48 be bd 52 10 00 00 	movabs $0xffffff00001052bd,%rsi
ffffff00001013b5:	ff ff ff 
ffffff00001013b8:	8b 10                	mov    (%rax),%edx
ffffff00001013ba:	89 17                	mov    %edx,(%rdi)
ffffff00001013bc:	48 8b 40 08          	mov    0x8(%rax),%rax
ffffff00001013c0:	48 89 47 08          	mov    %rax,0x8(%rdi)
ffffff00001013c4:	48 b8 f0 3c 10 00 00 	movabs $0xffffff0000103cf0,%rax
ffffff00001013cb:	ff ff ff 
ffffff00001013ce:	ff d0                	callq  *%rax
ffffff00001013d0:	31 c0                	xor    %eax,%eax
ffffff00001013d2:	48 83 c4 08          	add    $0x8,%rsp
ffffff00001013d6:	c3                   	retq   
ffffff00001013d7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
ffffff00001013de:	00 00 

ffffff00001013e0 <_ZN6x86_6419init_memory_mappingEv>:
ffffff00001013e0:	41 57                	push   %r15
ffffff00001013e2:	41 56                	push   %r14
ffffff00001013e4:	48 b8 e0 41 10 00 00 	movabs $0xffffff00001041e0,%rax
ffffff00001013eb:	ff ff ff 
ffffff00001013ee:	41 55                	push   %r13
ffffff00001013f0:	41 54                	push   %r12
ffffff00001013f2:	55                   	push   %rbp
ffffff00001013f3:	53                   	push   %rbx
ffffff00001013f4:	48 83 ec 38          	sub    $0x38,%rsp
ffffff00001013f8:	ff d0                	callq  *%rax
ffffff00001013fa:	48 89 c3             	mov    %rax,%rbx
ffffff00001013fd:	48 a3 40 56 10 00 00 	movabs %rax,0xffffff0000105640
ffffff0000101404:	ff ff ff 
ffffff0000101407:	48 b8 48 56 10 00 00 	movabs $0xffffff0000105648,%rax
ffffff000010140e:	ff ff ff 
ffffff0000101411:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
ffffff0000101417:	48 b8 e0 55 10 00 00 	movabs $0xffffff00001055e0,%rax
ffffff000010141e:	ff ff ff 
ffffff0000101421:	8b 10                	mov    (%rax),%edx
ffffff0000101423:	85 d2                	test   %edx,%edx
ffffff0000101425:	0f 84 eb 0d 00 00    	je     ffffff0000102216 <_ZN6x86_6419init_memory_mappingEv+0xe36>
ffffff000010142b:	45 31 e4             	xor    %r12d,%r12d
ffffff000010142e:	31 ed                	xor    %ebp,%ebp
ffffff0000101430:	31 c0                	xor    %eax,%eax
ffffff0000101432:	4c 89 7c 24 08       	mov    %r15,0x8(%rsp)
ffffff0000101437:	49 bd 00 00 00 00 00 	movabs $0xffffff0000000000,%r13
ffffff000010143e:	ff ff ff 
ffffff0000101441:	4d 89 e7             	mov    %r12,%r15
ffffff0000101444:	41 be 01 00 00 00    	mov    $0x1,%r14d
ffffff000010144a:	41 89 ec             	mov    %ebp,%r12d
ffffff000010144d:	89 c1                	mov    %eax,%ecx
ffffff000010144f:	48 89 dd             	mov    %rbx,%rbp
ffffff0000101452:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
ffffff0000101458:	48 b8 e8 55 10 00 00 	movabs $0xffffff00001055e8,%rax
ffffff000010145f:	ff ff ff 
ffffff0000101462:	48 8b 30             	mov    (%rax),%rsi
ffffff0000101465:	45 31 db             	xor    %r11d,%r11d
ffffff0000101468:	4c 01 fe             	add    %r15,%rsi
ffffff000010146b:	8b 46 10             	mov    0x10(%rsi),%eax
ffffff000010146e:	8d 50 fe             	lea    -0x2(%rax),%edx
ffffff0000101471:	83 e2 fd             	and    $0xfffffffd,%edx
ffffff0000101474:	48 8b 16             	mov    (%rsi),%rdx
ffffff0000101477:	41 0f 94 c3          	sete   %r11b
ffffff000010147b:	49 89 d0             	mov    %rdx,%r8
ffffff000010147e:	4c 03 46 08          	add    0x8(%rsi),%r8
ffffff0000101482:	48 81 e2 00 f0 ff ff 	and    $0xfffffffffffff000,%rdx
ffffff0000101489:	48 8d ba ff ff 1f 00 	lea    0x1fffff(%rdx),%rdi
ffffff0000101490:	48 81 e7 00 00 e0 ff 	and    $0xffffffffffe00000,%rdi
ffffff0000101497:	4d 89 c2             	mov    %r8,%r10
ffffff000010149a:	49 81 e2 00 f0 ff ff 	and    $0xfffffffffffff000,%r10
ffffff00001014a1:	4c 39 d7             	cmp    %r10,%rdi
ffffff00001014a4:	4c 89 d6             	mov    %r10,%rsi
ffffff00001014a7:	48 0f 46 f7          	cmovbe %rdi,%rsi
ffffff00001014ab:	48 39 f2             	cmp    %rsi,%rdx
ffffff00001014ae:	73 66                	jae    ffffff0000101516 <_ZN6x86_6419init_memory_mappingEv+0x136>
ffffff00001014b0:	8d 79 01             	lea    0x1(%rcx),%edi
ffffff00001014b3:	89 f8                	mov    %edi,%eax
ffffff00001014b5:	4a 8d 3c 2a          	lea    (%rdx,%r13,1),%rdi
ffffff00001014b9:	a3 48 56 10 00 00 ff 	movabs %eax,0xffffff0000105648
ffffff00001014c0:	ff ff 
ffffff00001014c2:	89 c8                	mov    %ecx,%eax
ffffff00001014c4:	48 c1 e0 05          	shl    $0x5,%rax
ffffff00001014c8:	48 01 e8             	add    %rbp,%rax
ffffff00001014cb:	48 89 78 08          	mov    %rdi,0x8(%rax)
ffffff00001014cf:	44 89 df             	mov    %r11d,%edi
ffffff00001014d2:	48 89 10             	mov    %rdx,(%rax)
ffffff00001014d5:	81 cf 00 10 00 00    	or     $0x1000,%edi
ffffff00001014db:	89 fb                	mov    %edi,%ebx
ffffff00001014dd:	48 8d be ff ff 1f 00 	lea    0x1fffff(%rsi),%rdi
ffffff00001014e4:	48 89 58 10          	mov    %rbx,0x10(%rax)
ffffff00001014e8:	48 89 f3             	mov    %rsi,%rbx
ffffff00001014eb:	48 29 d3             	sub    %rdx,%rbx
ffffff00001014ee:	48 89 da             	mov    %rbx,%rdx
ffffff00001014f1:	48 c1 ea 0c          	shr    $0xc,%rdx
ffffff00001014f5:	48 85 d2             	test   %rdx,%rdx
ffffff00001014f8:	49 0f 44 d6          	cmove  %r14,%rdx
ffffff00001014fc:	48 81 e7 00 00 e0 ff 	and    $0xffffffffffe00000,%rdi
ffffff0000101503:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffffff0000101507:	48 b8 48 56 10 00 00 	movabs $0xffffff0000105648,%rax
ffffff000010150e:	ff ff ff 
ffffff0000101511:	8b 08                	mov    (%rax),%ecx
ffffff0000101513:	48 89 f2             	mov    %rsi,%rdx
ffffff0000101516:	48 8d b2 ff ff ff 3f 	lea    0x3fffffff(%rdx),%rsi
ffffff000010151d:	4d 89 c1             	mov    %r8,%r9
ffffff0000101520:	49 81 e1 00 00 e0 ff 	and    $0xffffffffffe00000,%r9
ffffff0000101527:	48 81 e6 00 00 00 c0 	and    $0xffffffffc0000000,%rsi
ffffff000010152e:	4c 89 cb             	mov    %r9,%rbx
ffffff0000101531:	4c 39 ce             	cmp    %r9,%rsi
ffffff0000101534:	48 0f 46 de          	cmovbe %rsi,%rbx
ffffff0000101538:	48 39 fb             	cmp    %rdi,%rbx
ffffff000010153b:	76 63                	jbe    ffffff00001015a0 <_ZN6x86_6419init_memory_mappingEv+0x1c0>
ffffff000010153d:	8d 51 01             	lea    0x1(%rcx),%edx
ffffff0000101540:	48 8d b3 ff ff ff 3f 	lea    0x3fffffff(%rbx),%rsi
ffffff0000101547:	89 d0                	mov    %edx,%eax
ffffff0000101549:	4a 8d 14 2f          	lea    (%rdi,%r13,1),%rdx
ffffff000010154d:	a3 48 56 10 00 00 ff 	movabs %eax,0xffffff0000105648
ffffff0000101554:	ff ff 
ffffff0000101556:	89 c8                	mov    %ecx,%eax
ffffff0000101558:	48 c1 e0 05          	shl    $0x5,%rax
ffffff000010155c:	48 01 e8             	add    %rbp,%rax
ffffff000010155f:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffffff0000101563:	44 89 da             	mov    %r11d,%edx
ffffff0000101566:	48 89 38             	mov    %rdi,(%rax)
ffffff0000101569:	81 ca 00 00 20 00    	or     $0x200000,%edx
ffffff000010156f:	89 d1                	mov    %edx,%ecx
ffffff0000101571:	48 89 da             	mov    %rbx,%rdx
ffffff0000101574:	48 29 fa             	sub    %rdi,%rdx
ffffff0000101577:	48 89 48 10          	mov    %rcx,0x10(%rax)
ffffff000010157b:	48 c1 ea 15          	shr    $0x15,%rdx
ffffff000010157f:	48 85 d2             	test   %rdx,%rdx
ffffff0000101582:	49 0f 44 d6          	cmove  %r14,%rdx
ffffff0000101586:	48 81 e6 00 00 00 c0 	and    $0xffffffffc0000000,%rsi
ffffff000010158d:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffffff0000101591:	48 b8 48 56 10 00 00 	movabs $0xffffff0000105648,%rax
ffffff0000101598:	ff ff ff 
ffffff000010159b:	8b 08                	mov    (%rax),%ecx
ffffff000010159d:	48 89 da             	mov    %rbx,%rdx
ffffff00001015a0:	49 81 e0 00 00 00 c0 	and    $0xffffffffc0000000,%r8
ffffff00001015a7:	49 39 f0             	cmp    %rsi,%r8
ffffff00001015aa:	76 55                	jbe    ffffff0000101601 <_ZN6x86_6419init_memory_mappingEv+0x221>
ffffff00001015ac:	8d 51 01             	lea    0x1(%rcx),%edx
ffffff00001015af:	89 d0                	mov    %edx,%eax
ffffff00001015b1:	4a 8d 14 2e          	lea    (%rsi,%r13,1),%rdx
ffffff00001015b5:	a3 48 56 10 00 00 ff 	movabs %eax,0xffffff0000105648
ffffff00001015bc:	ff ff 
ffffff00001015be:	89 c8                	mov    %ecx,%eax
ffffff00001015c0:	48 c1 e0 05          	shl    $0x5,%rax
ffffff00001015c4:	48 01 e8             	add    %rbp,%rax
ffffff00001015c7:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffffff00001015cb:	44 89 da             	mov    %r11d,%edx
ffffff00001015ce:	48 89 30             	mov    %rsi,(%rax)
ffffff00001015d1:	81 ca 00 00 00 40    	or     $0x40000000,%edx
ffffff00001015d7:	89 d3                	mov    %edx,%ebx
ffffff00001015d9:	4c 89 c2             	mov    %r8,%rdx
ffffff00001015dc:	48 29 f2             	sub    %rsi,%rdx
ffffff00001015df:	48 89 58 10          	mov    %rbx,0x10(%rax)
ffffff00001015e3:	48 c1 ea 1e          	shr    $0x1e,%rdx
ffffff00001015e7:	48 85 d2             	test   %rdx,%rdx
ffffff00001015ea:	49 0f 44 d6          	cmove  %r14,%rdx
ffffff00001015ee:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffffff00001015f2:	48 b8 48 56 10 00 00 	movabs $0xffffff0000105648,%rax
ffffff00001015f9:	ff ff ff 
ffffff00001015fc:	8b 08                	mov    (%rax),%ecx
ffffff00001015fe:	4c 89 c2             	mov    %r8,%rdx
ffffff0000101601:	48 8d b2 ff ff 1f 00 	lea    0x1fffff(%rdx),%rsi
ffffff0000101608:	48 81 e6 00 00 e0 ff 	and    $0xffffffffffe00000,%rsi
ffffff000010160f:	49 39 f1             	cmp    %rsi,%r9
ffffff0000101612:	0f 86 a0 01 00 00    	jbe    ffffff00001017b8 <_ZN6x86_6419init_memory_mappingEv+0x3d8>
ffffff0000101618:	8d 51 01             	lea    0x1(%rcx),%edx
ffffff000010161b:	89 d0                	mov    %edx,%eax
ffffff000010161d:	4a 8d 14 2e          	lea    (%rsi,%r13,1),%rdx
ffffff0000101621:	a3 48 56 10 00 00 ff 	movabs %eax,0xffffff0000105648
ffffff0000101628:	ff ff 
ffffff000010162a:	89 c8                	mov    %ecx,%eax
ffffff000010162c:	48 c1 e0 05          	shl    $0x5,%rax
ffffff0000101630:	48 01 e8             	add    %rbp,%rax
ffffff0000101633:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffffff0000101637:	44 89 da             	mov    %r11d,%edx
ffffff000010163a:	48 89 30             	mov    %rsi,(%rax)
ffffff000010163d:	81 ca 00 00 20 00    	or     $0x200000,%edx
ffffff0000101643:	89 d3                	mov    %edx,%ebx
ffffff0000101645:	4c 89 ca             	mov    %r9,%rdx
ffffff0000101648:	48 29 f2             	sub    %rsi,%rdx
ffffff000010164b:	48 89 58 10          	mov    %rbx,0x10(%rax)
ffffff000010164f:	48 c1 ea 15          	shr    $0x15,%rdx
ffffff0000101653:	48 85 d2             	test   %rdx,%rdx
ffffff0000101656:	49 0f 44 d6          	cmove  %r14,%rdx
ffffff000010165a:	4d 39 ca             	cmp    %r9,%r10
ffffff000010165d:	48 89 50 18          	mov    %rdx,0x18(%rax)
ffffff0000101661:	48 b8 48 56 10 00 00 	movabs $0xffffff0000105648,%rax
ffffff0000101668:	ff ff ff 
ffffff000010166b:	0f 87 ef 00 00 00    	ja     ffffff0000101760 <_ZN6x86_6419init_memory_mappingEv+0x380>
ffffff0000101671:	8b 08                	mov    (%rax),%ecx
ffffff0000101673:	83 f9 01             	cmp    $0x1,%ecx
ffffff0000101676:	0f 86 b6 00 00 00    	jbe    ffffff0000101732 <_ZN6x86_6419init_memory_mappingEv+0x352>
ffffff000010167c:	31 db                	xor    %ebx,%ebx
ffffff000010167e:	eb 1f                	jmp    ffffff000010169f <_ZN6x86_6419init_memory_mappingEv+0x2bf>
ffffff0000101680:	a1 48 56 10 00 00 ff 	movabs 0xffffff0000105648,%eax
ffffff0000101687:	ff ff 
ffffff0000101689:	89 d3                	mov    %edx,%ebx
ffffff000010168b:	83 f8 01             	cmp    $0x1,%eax
ffffff000010168e:	0f 86 9c 00 00 00    	jbe    ffffff0000101730 <_ZN6x86_6419init_memory_mappingEv+0x350>
ffffff0000101694:	8d 50 ff             	lea    -0x1(%rax),%edx
ffffff0000101697:	39 da                	cmp    %ebx,%edx
ffffff0000101699:	0f 86 91 00 00 00    	jbe    ffffff0000101730 <_ZN6x86_6419init_memory_mappingEv+0x350>
ffffff000010169f:	89 df                	mov    %ebx,%edi
ffffff00001016a1:	8d 73 01             	lea    0x1(%rbx),%esi
ffffff00001016a4:	48 c1 e7 05          	shl    $0x5,%rdi
ffffff00001016a8:	48 01 ef             	add    %rbp,%rdi
ffffff00001016ab:	48 89 f2             	mov    %rsi,%rdx
ffffff00001016ae:	48 c1 e6 05          	shl    $0x5,%rsi
ffffff00001016b2:	48 8b 4f 10          	mov    0x10(%rdi),%rcx
ffffff00001016b6:	48 01 ee             	add    %rbp,%rsi
ffffff00001016b9:	48 89 c8             	mov    %rcx,%rax
ffffff00001016bc:	25 00 f0 ff ff       	and    $0xfffff000,%eax
ffffff00001016c1:	48 0f af 47 18       	imul   0x18(%rdi),%rax
ffffff00001016c6:	48 03 47 08          	add    0x8(%rdi),%rax
ffffff00001016ca:	48 3b 46 08          	cmp    0x8(%rsi),%rax
ffffff00001016ce:	75 b0                	jne    ffffff0000101680 <_ZN6x86_6419init_memory_mappingEv+0x2a0>
ffffff00001016d0:	48 3b 4e 10          	cmp    0x10(%rsi),%rcx
ffffff00001016d4:	75 aa                	jne    ffffff0000101680 <_ZN6x86_6419init_memory_mappingEv+0x2a0>
ffffff00001016d6:	48 8b 07             	mov    (%rdi),%rax
ffffff00001016d9:	48 89 06             	mov    %rax,(%rsi)
ffffff00001016dc:	48 8b 47 08          	mov    0x8(%rdi),%rax
ffffff00001016e0:	48 89 46 08          	mov    %rax,0x8(%rsi)
ffffff00001016e4:	48 8b 47 18          	mov    0x18(%rdi),%rax
ffffff00001016e8:	48 01 46 18          	add    %rax,0x18(%rsi)
ffffff00001016ec:	a1 48 56 10 00 00 ff 	movabs 0xffffff0000105648,%eax
ffffff00001016f3:	ff ff 
ffffff00001016f5:	8d 50 ff             	lea    -0x1(%rax),%edx
ffffff00001016f8:	48 b8 20 49 10 00 00 	movabs $0xffffff0000104920,%rax
ffffff00001016ff:	ff ff ff 
ffffff0000101702:	29 da                	sub    %ebx,%edx
ffffff0000101704:	48 c1 e2 05          	shl    $0x5,%rdx
ffffff0000101708:	ff d0                	callq  *%rax
ffffff000010170a:	a1 48 56 10 00 00 ff 	movabs 0xffffff0000105648,%eax
ffffff0000101711:	ff ff 
ffffff0000101713:	83 e8 01             	sub    $0x1,%eax
ffffff0000101716:	83 f8 01             	cmp    $0x1,%eax
ffffff0000101719:	a3 48 56 10 00 00 ff 	movabs %eax,0xffffff0000105648
ffffff0000101720:	ff ff 
ffffff0000101722:	0f 87 6c ff ff ff    	ja     ffffff0000101694 <_ZN6x86_6419init_memory_mappingEv+0x2b4>
ffffff0000101728:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
ffffff000010172f:	00 
ffffff0000101730:	89 c1                	mov    %eax,%ecx
ffffff0000101732:	48 b8 e0 55 10 00 00 	movabs $0xffffff00001055e0,%rax
ffffff0000101739:	ff ff ff 
ffffff000010173c:	41 83 c4 01          	add    $0x1,%r12d
ffffff0000101740:	49 83 c7 18          	add    $0x18,%r15
ffffff0000101744:	44 3b 20             	cmp    (%rax),%r12d
ffffff0000101747:	0f 83 b3 00 00 00    	jae    ffffff0000101800 <_ZN6x86_6419init_memory_mappingEv+0x420>
ffffff000010174d:	48 b8 40 56 10 00 00 	movabs $0xffffff0000105640,%rax
ffffff0000101754:	ff ff ff 
ffffff0000101757:	48 8b 28             	mov    (%rax),%rbp
ffffff000010175a:	e9 f9 fc ff ff       	jmpq   ffffff0000101458 <_ZN6x86_6419init_memory_mappingEv+0x78>
ffffff000010175f:	90                   	nop
ffffff0000101760:	8b 38                	mov    (%rax),%edi
ffffff0000101762:	41 81 cb 00 10 00 00 	or     $0x1000,%r11d
ffffff0000101769:	44 89 db             	mov    %r11d,%ebx
ffffff000010176c:	8d 57 01             	lea    0x1(%rdi),%edx
ffffff000010176f:	89 d0                	mov    %edx,%eax
ffffff0000101771:	4b 8d 14 29          	lea    (%r9,%r13,1),%rdx
ffffff0000101775:	a3 48 56 10 00 00 ff 	movabs %eax,0xffffff0000105648
ffffff000010177c:	ff ff 
ffffff000010177e:	89 f8                	mov    %edi,%eax
ffffff0000101780:	48 c1 e0 05          	shl    $0x5,%rax
ffffff0000101784:	48 01 e8             	add    %rbp,%rax
ffffff0000101787:	4c 89 08             	mov    %r9,(%rax)
ffffff000010178a:	48 89 50 08          	mov    %rdx,0x8(%rax)
ffffff000010178e:	48 89 58 10          	mov    %rbx,0x10(%rax)
ffffff0000101792:	4d 29 ca             	sub    %r9,%r10
ffffff0000101795:	49 c1 ea 0c          	shr    $0xc,%r10
ffffff0000101799:	4d 85 d2             	test   %r10,%r10
ffffff000010179c:	4d 0f 44 d6          	cmove  %r14,%r10
ffffff00001017a0:	4c 89 50 18          	mov    %r10,0x18(%rax)
ffffff00001017a4:	48 b8 48 56 10 00 00 	movabs $0xffffff0000105648,%rax
ffffff00001017ab:	ff ff ff 
ffffff00001017ae:	e9 be fe ff ff       	jmpq   ffffff0000101671 <_ZN6x86_6419init_memory_mappingEv+0x291>
ffffff00001017b3:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
ffffff00001017b8:	49 39 d2             	cmp    %rdx,%r10
ffffff00001017bb:	0f 86 b2 fe ff ff    	jbe    ffffff0000101673 <_ZN6x86_6419init_memory_mappingEv+0x293>
ffffff00001017c1:	8d 71 01             	lea    0x1(%rcx),%esi
ffffff00001017c4:	41 81 cb 00 10 00 00 	or     $0x1000,%r11d
ffffff00001017cb:	49 89 d1             	mov    %rdx,%r9
ffffff00001017ce:	44 89 db             	mov    %r11d,%ebx
ffffff00001017d1:	89 f0                	mov    %esi,%eax
ffffff00001017d3:	4a 8d 34 2a          	lea    (%rdx,%r13,1),%rsi
ffffff00001017d7:	a3 48 56 10 00 00 ff 	movabs %eax,0xffffff0000105648
ffffff00001017de:	ff ff 
ffffff00001017e0:	89 c8                	mov    %ecx,%eax
ffffff00001017e2:	48 c1 e0 05          	shl    $0x5,%rax
ffffff00001017e6:	48 01 e8             	add    %rbp,%rax
ffffff00001017e9:	48 89 10             	mov    %rdx,(%rax)
ffffff00001017ec:	48 89 70 08          	mov    %rsi,0x8(%rax)
ffffff00001017f0:	48 89 58 10          	mov    %rbx,0x10(%rax)
ffffff00001017f4:	eb 9c                	jmp    ffffff0000101792 <_ZN6x86_6419init_memory_mappingEv+0x3b2>
ffffff00001017f6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
ffffff00001017fd:	00 00 00 
ffffff0000101800:	85 c9                	test   %ecx,%ecx
ffffff0000101802:	4c 8b 7c 24 08       	mov    0x8(%rsp),%r15
ffffff0000101807:	89 c8                	mov    %ecx,%eax
ffffff0000101809:	0f 84 69 0a 00 00    	je     ffffff0000102278 <_ZN6x86_6419init_memory_mappingEv+0xe98>
ffffff000010180f:	48 bb 40 56 10 00 00 	movabs $0xffffff0000105640,%rbx
ffffff0000101816:	ff ff ff 
ffffff0000101819:	48 8b 1b             	mov    (%rbx),%rbx
ffffff000010181c:	31 ff                	xor    %edi,%edi
ffffff000010181e:	41 b8 20 00 00 00    	mov    $0x20,%r8d
ffffff0000101824:	48 8b 13             	mov    (%rbx),%rdx
ffffff0000101827:	48 81 fa ff ff 0d 00 	cmp    $0xdffff,%rdx
ffffff000010182e:	76 21                	jbe    ffffff0000101851 <_ZN6x86_6419init_memory_mappingEv+0x471>
ffffff0000101830:	e9 e8 09 00 00       	jmpq   ffffff000010221d <_ZN6x86_6419init_memory_mappingEv+0xe3d>
ffffff0000101835:	0f 1f 00             	nopl   (%rax)
ffffff0000101838:	49 8d 48 20          	lea    0x20(%r8),%rcx
ffffff000010183c:	48 8b 54 0b e0       	mov    -0x20(%rbx,%rcx,1),%rdx
ffffff0000101841:	48 81 fa ff ff 0d 00 	cmp    $0xdffff,%rdx
ffffff0000101848:	0f 87 2f 07 00 00    	ja     ffffff0000101f7d <_ZN6x86_6419init_memory_mappingEv+0xb9d>
ffffff000010184e:	49 89 c8             	mov    %rcx,%r8
ffffff0000101851:	83 c7 01             	add    $0x1,%edi
ffffff0000101854:	39 c7                	cmp    %eax,%edi
ffffff0000101856:	75 e0                	jne    ffffff0000101838 <_ZN6x86_6419init_memory_mappingEv+0x458>
ffffff0000101858:	8d 57 01             	lea    0x1(%rdi),%edx
ffffff000010185b:	89 fe                	mov    %edi,%esi
ffffff000010185d:	48 c1 e6 05          	shl    $0x5,%rsi
ffffff0000101861:	83 fa 7f             	cmp    $0x7f,%edx
ffffff0000101864:	77 63                	ja     ffffff00001018c9 <_ZN6x86_6419init_memory_mappingEv+0x4e9>
ffffff0000101866:	48 01 f3             	add    %rsi,%rbx
ffffff0000101869:	48 b8 00 00 0e 00 00 	movabs $0xffffff00000e0000,%rax
ffffff0000101870:	ff ff ff 
ffffff0000101873:	48 c7 03 00 00 0e 00 	movq   $0xe0000,(%rbx)
ffffff000010187a:	48 89 43 08          	mov    %rax,0x8(%rbx)
ffffff000010187e:	48 c7 43 10 01 10 00 	movq   $0x1001,0x10(%rbx)
ffffff0000101885:	00 
ffffff0000101886:	48 c7 43 18 20 00 00 	movq   $0x20,0x18(%rbx)
ffffff000010188d:	00 
ffffff000010188e:	a1 48 56 10 00 00 ff 	movabs 0xffffff0000105648,%eax
ffffff0000101895:	ff ff 
ffffff0000101897:	48 bb 40 56 10 00 00 	movabs $0xffffff0000105640,%rbx
ffffff000010189e:	ff ff ff 
ffffff00001018a1:	48 8b 1b             	mov    (%rbx),%rbx
ffffff00001018a4:	83 c0 01             	add    $0x1,%eax
ffffff00001018a7:	a3 48 56 10 00 00 ff 	movabs %eax,0xffffff0000105648
ffffff00001018ae:	ff ff 
ffffff00001018b0:	85 c0                	test   %eax,%eax
ffffff00001018b2:	0f 84 96 09 00 00    	je     ffffff000010224e <_ZN6x86_6419init_memory_mappingEv+0xe6e>
ffffff00001018b8:	48 8b 0b             	mov    (%rbx),%rcx
ffffff00001018bb:	ba ff ff bf fe       	mov    $0xfebfffff,%edx
ffffff00001018c0:	48 39 d1             	cmp    %rdx,%rcx
ffffff00001018c3:	0f 87 6b 09 00 00    	ja     ffffff0000102234 <_ZN6x86_6419init_memory_mappingEv+0xe54>
ffffff00001018c9:	41 b8 20 00 00 00    	mov    $0x20,%r8d
ffffff00001018cf:	31 ff                	xor    %edi,%edi
ffffff00001018d1:	be ff ff bf fe       	mov    $0xfebfffff,%esi
ffffff00001018d6:	eb 1d                	jmp    ffffff00001018f5 <_ZN6x86_6419init_memory_mappingEv+0x515>
ffffff00001018d8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
ffffff00001018df:	00 
ffffff00001018e0:	49 8d 50 20          	lea    0x20(%r8),%rdx
ffffff00001018e4:	48 8b 4c 13 e0       	mov    -0x20(%rbx,%rdx,1),%rcx
ffffff00001018e9:	48 39 f1             	cmp    %rsi,%rcx
ffffff00001018ec:	0f 87 9a 05 00 00    	ja     ffffff0000101e8c <_ZN6x86_6419init_memory_mappingEv+0xaac>
ffffff00001018f2:	49 89 d0             	mov    %rdx,%r8
ffffff00001018f5:	83 c7 01             	add    $0x1,%edi
ffffff00001018f8:	39 c7                	cmp    %eax,%edi
ffffff00001018fa:	72 e4                	jb     ffffff00001018e0 <_ZN6x86_6419init_memory_mappingEv+0x500>
ffffff00001018fc:	8d 47 01             	lea    0x1(%rdi),%eax
ffffff00001018ff:	83 f8 7f             	cmp    $0x7f,%eax
ffffff0000101902:	0f 87 68 09 00 00    	ja     ffffff0000102270 <_ZN6x86_6419init_memory_mappingEv+0xe90>
ffffff0000101908:	a1 48 56 10 00 00 ff 	movabs 0xffffff0000105648,%eax
ffffff000010190f:	ff ff 
ffffff0000101911:	89 fe                	mov    %edi,%esi
ffffff0000101913:	48 c1 e6 05          	shl    $0x5,%rsi
ffffff0000101917:	39 c7                	cmp    %eax,%edi
ffffff0000101919:	73 5e                	jae    ffffff0000101979 <_ZN6x86_6419init_memory_mappingEv+0x599>
ffffff000010191b:	48 63 d0             	movslq %eax,%rdx
ffffff000010191e:	89 c1                	mov    %eax,%ecx
ffffff0000101920:	48 89 d8             	mov    %rbx,%rax
ffffff0000101923:	48 c1 e2 05          	shl    $0x5,%rdx
ffffff0000101927:	eb 11                	jmp    ffffff000010193a <_ZN6x86_6419init_memory_mappingEv+0x55a>
ffffff0000101929:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
ffffff0000101930:	48 a1 40 56 10 00 00 	movabs 0xffffff0000105640,%rax
ffffff0000101937:	ff ff ff 
ffffff000010193a:	4c 8b 44 10 e0       	mov    -0x20(%rax,%rdx,1),%r8
ffffff000010193f:	83 e9 01             	sub    $0x1,%ecx
ffffff0000101942:	4c 89 04 10          	mov    %r8,(%rax,%rdx,1)
ffffff0000101946:	4c 8b 44 10 e8       	mov    -0x18(%rax,%rdx,1),%r8
ffffff000010194b:	4c 89 44 10 08       	mov    %r8,0x8(%rax,%rdx,1)
ffffff0000101950:	4c 8b 44 10 f0       	mov    -0x10(%rax,%rdx,1),%r8
ffffff0000101955:	4c 89 44 10 10       	mov    %r8,0x10(%rax,%rdx,1)
ffffff000010195a:	4c 8b 44 10 f8       	mov    -0x8(%rax,%rdx,1),%r8
ffffff000010195f:	4c 89 44 10 18       	mov    %r8,0x18(%rax,%rdx,1)
ffffff0000101964:	48 83 ea 20          	sub    $0x20,%rdx
ffffff0000101968:	39 f9                	cmp    %edi,%ecx
ffffff000010196a:	77 c4                	ja     ffffff0000101930 <_ZN6x86_6419init_memory_mappingEv+0x550>
ffffff000010196c:	48 b8 40 56 10 00 00 	movabs $0xffffff0000105640,%rax
ffffff0000101973:	ff ff ff 
ffffff0000101976:	48 8b 18             	mov    (%rax),%rbx
ffffff0000101979:	48 01 f3             	add    %rsi,%rbx
ffffff000010197c:	b8 00 00 c0 fe       	mov    $0xfec00000,%eax
ffffff0000101981:	48 89 03             	mov    %rax,(%rbx)
ffffff0000101984:	48 b8 00 00 c0 fe 00 	movabs $0xffffff00fec00000,%rax
ffffff000010198b:	ff ff ff 
ffffff000010198e:	48 c7 43 10 01 00 20 	movq   $0x200001,0x10(%rbx)
ffffff0000101995:	00 
ffffff0000101996:	48 89 43 08          	mov    %rax,0x8(%rbx)
ffffff000010199a:	a1 48 56 10 00 00 ff 	movabs 0xffffff0000105648,%eax
ffffff00001019a1:	ff ff 
ffffff00001019a3:	48 c7 43 18 02 00 00 	movq   $0x2,0x18(%rbx)
ffffff00001019aa:	00 
ffffff00001019ab:	83 c0 01             	add    $0x1,%eax
ffffff00001019ae:	a3 48 56 10 00 00 ff 	movabs %eax,0xffffff0000105648
ffffff00001019b5:	ff ff 
ffffff00001019b7:	85 c0                	test   %eax,%eax
ffffff00001019b9:	0f 84 b3 07 00 00    	je     ffffff0000102172 <_ZN6x86_6419init_memory_mappingEv+0xd92>
ffffff00001019bf:	48 a1 40 56 10 00 00 	movabs 0xffffff0000105640,%rax
ffffff00001019c6:	ff ff ff 
ffffff00001019c9:	45 31 f6             	xor    %r14d,%r14d
ffffff00001019cc:	48 bd e0 34 10 00 00 	movabs $0xffffff00001034e0,%rbp
ffffff00001019d3:	ff ff ff 
ffffff00001019d6:	49 bd f8 53 10 00 00 	movabs $0xffffff00001053f8,%r13
ffffff00001019dd:	ff ff ff 
ffffff00001019e0:	49 bc fd 53 10 00 00 	movabs $0xffffff00001053fd,%r12
ffffff00001019e7:	ff ff ff 
ffffff00001019ea:	48 89 c1             	mov    %rax,%rcx
ffffff00001019ed:	eb 0e                	jmp    ffffff00001019fd <_ZN6x86_6419init_memory_mappingEv+0x61d>
ffffff00001019ef:	90                   	nop
ffffff00001019f0:	48 b8 40 56 10 00 00 	movabs $0xffffff0000105640,%rax
ffffff00001019f7:	ff ff ff 
ffffff00001019fa:	48 8b 08             	mov    (%rax),%rcx
ffffff00001019fd:	44 89 f0             	mov    %r14d,%eax
ffffff0000101a00:	48 c1 e0 05          	shl    $0x5,%rax
ffffff0000101a04:	48 8d 04 01          	lea    (%rcx,%rax,1),%rax
ffffff0000101a08:	48 b9 f3 53 10 00 00 	movabs $0xffffff00001053f3,%rcx
ffffff0000101a0f:	ff ff ff 
ffffff0000101a12:	48 8b 50 10          	mov    0x10(%rax),%rdx
ffffff0000101a16:	89 d6                	mov    %edx,%esi
ffffff0000101a18:	81 e6 00 f0 ff ff    	and    $0xfffff000,%esi
ffffff0000101a1e:	81 fe 00 00 00 40    	cmp    $0x40000000,%esi
ffffff0000101a24:	74 0d                	je     ffffff0000101a33 <_ZN6x86_6419init_memory_mappingEv+0x653>
ffffff0000101a26:	81 fe 00 00 20 00    	cmp    $0x200000,%esi
ffffff0000101a2c:	4c 89 e1             	mov    %r12,%rcx
ffffff0000101a2f:	49 0f 44 cd          	cmove  %r13,%rcx
ffffff0000101a33:	81 e2 00 f0 ff ff    	and    $0xfffff000,%edx
ffffff0000101a39:	48 8b 70 08          	mov    0x8(%rax),%rsi
ffffff0000101a3d:	48 bf 08 54 10 00 00 	movabs $0xffffff0000105408,%rdi
ffffff0000101a44:	ff ff ff 
ffffff0000101a47:	48 0f af 50 18       	imul   0x18(%rax),%rdx
ffffff0000101a4c:	31 c0                	xor    %eax,%eax
ffffff0000101a4e:	41 83 c6 01          	add    $0x1,%r14d
ffffff0000101a52:	48 01 f2             	add    %rsi,%rdx
ffffff0000101a55:	ff d5                	callq  *%rbp
ffffff0000101a57:	a1 48 56 10 00 00 ff 	movabs 0xffffff0000105648,%eax
ffffff0000101a5e:	ff ff 
ffffff0000101a60:	41 39 c6             	cmp    %eax,%r14d
ffffff0000101a63:	72 8b                	jb     ffffff00001019f0 <_ZN6x86_6419init_memory_mappingEv+0x610>
ffffff0000101a65:	89 c6                	mov    %eax,%esi
ffffff0000101a67:	bf 01 00 00 80       	mov    $0x80000001,%edi
ffffff0000101a6c:	89 f8                	mov    %edi,%eax
ffffff0000101a6e:	0f a2                	cpuid  
ffffff0000101a70:	89 d0                	mov    %edx,%eax
ffffff0000101a72:	25 00 00 00 04       	and    $0x4000000,%eax
ffffff0000101a77:	89 44 24 2c          	mov    %eax,0x2c(%rsp)
ffffff0000101a7b:	89 f8                	mov    %edi,%eax
ffffff0000101a7d:	0f a2                	cpuid  
ffffff0000101a7f:	89 d0                	mov    %edx,%eax
ffffff0000101a81:	25 00 20 00 00       	and    $0x2000,%eax
ffffff0000101a86:	83 f8 01             	cmp    $0x1,%eax
ffffff0000101a89:	4d 19 f6             	sbb    %r14,%r14
ffffff0000101a8c:	41 80 e6 00          	and    $0x0,%r14b
ffffff0000101a90:	49 81 c6 03 01 00 00 	add    $0x103,%r14
ffffff0000101a97:	85 f6                	test   %esi,%esi
ffffff0000101a99:	0f 84 a2 01 00 00    	je     ffffff0000101c41 <_ZN6x86_6419init_memory_mappingEv+0x861>
ffffff0000101a9f:	4c 89 f3             	mov    %r14,%rbx
ffffff0000101aa2:	49 c7 c5 ff ff ff ff 	mov    $0xffffffffffffffff,%r13
ffffff0000101aa9:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%rsp)
ffffff0000101ab0:	00 
ffffff0000101ab1:	80 cb 82             	or     $0x82,%bl
ffffff0000101ab4:	4c 89 e8             	mov    %r13,%rax
ffffff0000101ab7:	48 89 5c 24 20       	mov    %rbx,0x20(%rsp)
ffffff0000101abc:	0f 1f 40 00          	nopl   0x0(%rax)
ffffff0000101ac0:	8b 5c 24 08          	mov    0x8(%rsp),%ebx
ffffff0000101ac4:	48 bf 40 56 10 00 00 	movabs $0xffffff0000105640,%rdi
ffffff0000101acb:	ff ff ff 
ffffff0000101ace:	48 8b 17             	mov    (%rdi),%rdx
ffffff0000101ad1:	48 c1 e3 05          	shl    $0x5,%rbx
ffffff0000101ad5:	48 01 d3             	add    %rdx,%rbx
ffffff0000101ad8:	48 ba 00 00 00 c0 7f 	movabs $0x7fc0000000,%rdx
ffffff0000101adf:	00 00 00 
ffffff0000101ae2:	4c 8b 53 08          	mov    0x8(%rbx),%r10
ffffff0000101ae6:	48 8b 6b 10          	mov    0x10(%rbx),%rbp
ffffff0000101aea:	4c 21 d2             	and    %r10,%rdx
ffffff0000101aed:	49 89 ec             	mov    %rbp,%r12
ffffff0000101af0:	81 e5 ff 0f 00 00    	and    $0xfff,%ebp
ffffff0000101af6:	48 c1 ea 1e          	shr    $0x1e,%rdx
ffffff0000101afa:	41 81 e4 00 f0 ff ff 	and    $0xfffff000,%r12d
ffffff0000101b01:	48 39 c2             	cmp    %rax,%rdx
ffffff0000101b04:	48 89 54 24 10       	mov    %rdx,0x10(%rsp)
ffffff0000101b09:	0f 84 01 03 00 00    	je     ffffff0000101e10 <_ZN6x86_6419init_memory_mappingEv+0xa30>
ffffff0000101b0f:	49 81 fc 00 00 00 40 	cmp    $0x40000000,%r12
ffffff0000101b16:	0f 85 54 01 00 00    	jne    ffffff0000101c70 <_ZN6x86_6419init_memory_mappingEv+0x890>
ffffff0000101b1c:	8b 44 24 2c          	mov    0x2c(%rsp),%eax
ffffff0000101b20:	85 c0                	test   %eax,%eax
ffffff0000101b22:	0f 85 08 03 00 00    	jne    ffffff0000101e30 <_ZN6x86_6419init_memory_mappingEv+0xa50>
ffffff0000101b28:	48 8b 43 18          	mov    0x18(%rbx),%rax
ffffff0000101b2c:	48 c7 c1 00 fe ff ff 	mov    $0xfffffffffffffe00,%rcx
ffffff0000101b33:	be 00 02 00 00       	mov    $0x200,%esi
ffffff0000101b38:	41 bc 00 00 20 00    	mov    $0x200000,%r12d
ffffff0000101b3e:	48 c1 e0 09          	shl    $0x9,%rax
ffffff0000101b42:	48 89 43 18          	mov    %rax,0x18(%rbx)
ffffff0000101b46:	4c 8d 6c 06 ff       	lea    -0x1(%rsi,%rax,1),%r13
ffffff0000101b4b:	31 d2                	xor    %edx,%edx
ffffff0000101b4d:	4c 89 e8             	mov    %r13,%rax
ffffff0000101b50:	48 21 c8             	and    %rcx,%rax
ffffff0000101b53:	48 f7 f6             	div    %rsi
ffffff0000101b56:	49 89 c5             	mov    %rax,%r13
ffffff0000101b59:	89 c7                	mov    %eax,%edi
ffffff0000101b5b:	48 b8 70 42 10 00 00 	movabs $0xffffff0000104270,%rax
ffffff0000101b62:	ff ff ff 
ffffff0000101b65:	ff d0                	callq  *%rax
ffffff0000101b67:	48 ba 00 00 00 00 00 	movabs $0x10000000000,%rdx
ffffff0000101b6e:	01 00 00 
ffffff0000101b71:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
ffffff0000101b76:	48 01 c2             	add    %rax,%rdx
ffffff0000101b79:	45 85 ed             	test   %r13d,%r13d
ffffff0000101b7c:	74 3c                	je     ffffff0000101bba <_ZN6x86_6419init_memory_mappingEv+0x7da>
ffffff0000101b7e:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
ffffff0000101b83:	48 b8 00 40 00 00 00 	movabs $0xffffff0000004000,%rax
ffffff0000101b8a:	ff ff ff 
ffffff0000101b8d:	41 83 ed 01          	sub    $0x1,%r13d
ffffff0000101b91:	48 8d 0c f8          	lea    (%rax,%rdi,8),%rcx
ffffff0000101b95:	49 01 fd             	add    %rdi,%r13
ffffff0000101b98:	b0 08                	mov    $0x8,%al
ffffff0000101b9a:	4a 8d 34 e8          	lea    (%rax,%r13,8),%rsi
ffffff0000101b9e:	66 90                	xchg   %ax,%ax
ffffff0000101ba0:	48 89 d0             	mov    %rdx,%rax
ffffff0000101ba3:	48 83 c1 08          	add    $0x8,%rcx
ffffff0000101ba7:	48 81 c2 00 10 00 00 	add    $0x1000,%rdx
ffffff0000101bae:	4c 09 f0             	or     %r14,%rax
ffffff0000101bb1:	48 89 41 f8          	mov    %rax,-0x8(%rcx)
ffffff0000101bb5:	48 39 f1             	cmp    %rsi,%rcx
ffffff0000101bb8:	75 e6                	jne    ffffff0000101ba0 <_ZN6x86_6419init_memory_mappingEv+0x7c0>
ffffff0000101bba:	48 8b 43 08          	mov    0x8(%rbx),%rax
ffffff0000101bbe:	25 00 00 e0 3f       	and    $0x3fe00000,%eax
ffffff0000101bc3:	48 c1 e8 15          	shr    $0x15,%rax
ffffff0000101bc7:	49 89 c5             	mov    %rax,%r13
ffffff0000101bca:	49 81 fc 00 00 20 00 	cmp    $0x200000,%r12
ffffff0000101bd1:	0f 85 b9 00 00 00    	jne    ffffff0000101c90 <_ZN6x86_6419init_memory_mappingEv+0x8b0>
ffffff0000101bd7:	48 83 fd 01          	cmp    $0x1,%rbp
ffffff0000101bdb:	48 8b 13             	mov    (%rbx),%rdx
ffffff0000101bde:	48 19 ff             	sbb    %rdi,%rdi
ffffff0000101be1:	48 f7 d7             	not    %rdi
ffffff0000101be4:	83 e7 10             	and    $0x10,%edi
ffffff0000101be7:	48 0b 7c 24 20       	or     0x20(%rsp),%rdi
ffffff0000101bec:	48 83 7b 18 00       	cmpq   $0x0,0x18(%rbx)
ffffff0000101bf1:	74 2d                	je     ffffff0000101c20 <_ZN6x86_6419init_memory_mappingEv+0x840>
ffffff0000101bf3:	4c 8b 44 24 18       	mov    0x18(%rsp),%r8
ffffff0000101bf8:	31 c9                	xor    %ecx,%ecx
ffffff0000101bfa:	31 c0                	xor    %eax,%eax
ffffff0000101bfc:	0f 1f 40 00          	nopl   0x0(%rax)
ffffff0000101c00:	48 89 d6             	mov    %rdx,%rsi
ffffff0000101c03:	4c 01 e8             	add    %r13,%rax
ffffff0000101c06:	48 81 c2 00 00 20 00 	add    $0x200000,%rdx
ffffff0000101c0d:	48 09 fe             	or     %rdi,%rsi
ffffff0000101c10:	49 89 34 c0          	mov    %rsi,(%r8,%rax,8)
ffffff0000101c14:	8d 41 01             	lea    0x1(%rcx),%eax
ffffff0000101c17:	48 3b 43 18          	cmp    0x18(%rbx),%rax
ffffff0000101c1b:	48 89 c1             	mov    %rax,%rcx
ffffff0000101c1e:	72 e0                	jb     ffffff0000101c00 <_ZN6x86_6419init_memory_mappingEv+0x820>
ffffff0000101c20:	83 44 24 08 01       	addl   $0x1,0x8(%rsp)
ffffff0000101c25:	48 bf 40 56 10 00 00 	movabs $0xffffff0000105640,%rdi
ffffff0000101c2c:	ff ff ff 
ffffff0000101c2f:	48 8b 44 24 10       	mov    0x10(%rsp),%rax
ffffff0000101c34:	8b 5c 24 08          	mov    0x8(%rsp),%ebx
ffffff0000101c38:	3b 5f 08             	cmp    0x8(%rdi),%ebx
ffffff0000101c3b:	0f 82 7f fe ff ff    	jb     ffffff0000101ac0 <_ZN6x86_6419init_memory_mappingEv+0x6e0>
ffffff0000101c41:	48 b8 f0 2f 00 00 00 	movabs $0xffffff0000002ff0,%rax
ffffff0000101c48:	ff ff ff 
ffffff0000101c4b:	48 c7 00 03 40 00 00 	movq   $0x4003,(%rax)
ffffff0000101c52:	b0 f8                	mov    $0xf8,%al
ffffff0000101c54:	48 c7 00 03 50 00 00 	movq   $0x5003,(%rax)
ffffff0000101c5b:	0f 20 d8             	mov    %cr3,%rax
ffffff0000101c5e:	0f 22 d8             	mov    %rax,%cr3
ffffff0000101c61:	48 83 c4 38          	add    $0x38,%rsp
ffffff0000101c65:	5b                   	pop    %rbx
ffffff0000101c66:	5d                   	pop    %rbp
ffffff0000101c67:	41 5c                	pop    %r12
ffffff0000101c69:	41 5d                	pop    %r13
ffffff0000101c6b:	41 5e                	pop    %r14
ffffff0000101c6d:	41 5f                	pop    %r15
ffffff0000101c6f:	c3                   	retq   
ffffff0000101c70:	b8 00 00 00 40       	mov    $0x40000000,%eax
ffffff0000101c75:	31 d2                	xor    %edx,%edx
ffffff0000101c77:	49 f7 f4             	div    %r12
ffffff0000101c7a:	48 89 c6             	mov    %rax,%rsi
ffffff0000101c7d:	48 8b 43 18          	mov    0x18(%rbx),%rax
ffffff0000101c81:	48 89 f1             	mov    %rsi,%rcx
ffffff0000101c84:	48 f7 d9             	neg    %rcx
ffffff0000101c87:	e9 ba fe ff ff       	jmpq   ffffff0000101b46 <_ZN6x86_6419init_memory_mappingEv+0x766>
ffffff0000101c8c:	0f 1f 40 00          	nopl   0x0(%rax)
ffffff0000101c90:	31 d2                	xor    %edx,%edx
ffffff0000101c92:	b8 00 00 20 00       	mov    $0x200000,%eax
ffffff0000101c97:	49 f7 f4             	div    %r12
ffffff0000101c9a:	48 89 c6             	mov    %rax,%rsi
ffffff0000101c9d:	48 89 c2             	mov    %rax,%rdx
ffffff0000101ca0:	48 8b 43 18          	mov    0x18(%rbx),%rax
ffffff0000101ca4:	48 f7 da             	neg    %rdx
ffffff0000101ca7:	48 8d 4c 06 ff       	lea    -0x1(%rsi,%rax,1),%rcx
ffffff0000101cac:	48 89 d0             	mov    %rdx,%rax
ffffff0000101caf:	31 d2                	xor    %edx,%edx
ffffff0000101cb1:	48 21 c8             	and    %rcx,%rax
ffffff0000101cb4:	48 f7 f6             	div    %rsi
ffffff0000101cb7:	49 89 c4             	mov    %rax,%r12
ffffff0000101cba:	89 c7                	mov    %eax,%edi
ffffff0000101cbc:	48 b8 70 42 10 00 00 	movabs $0xffffff0000104270,%rax
ffffff0000101cc3:	ff ff ff 
ffffff0000101cc6:	ff d0                	callq  *%rax
ffffff0000101cc8:	48 b9 00 00 00 00 00 	movabs $0x10000000000,%rcx
ffffff0000101ccf:	01 00 00 
ffffff0000101cd2:	49 89 c7             	mov    %rax,%r15
ffffff0000101cd5:	48 01 c1             	add    %rax,%rcx
ffffff0000101cd8:	45 85 e4             	test   %r12d,%r12d
ffffff0000101cdb:	74 35                	je     ffffff0000101d12 <_ZN6x86_6419init_memory_mappingEv+0x932>
ffffff0000101cdd:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
ffffff0000101ce2:	41 8d 54 24 ff       	lea    -0x1(%r12),%edx
ffffff0000101ce7:	48 8d 3c d5 08 00 00 	lea    0x8(,%rdx,8),%rdi
ffffff0000101cee:	00 
ffffff0000101cef:	4a 8d 34 e8          	lea    (%rax,%r13,8),%rsi
ffffff0000101cf3:	31 c0                	xor    %eax,%eax
ffffff0000101cf5:	0f 1f 00             	nopl   (%rax)
ffffff0000101cf8:	48 89 ca             	mov    %rcx,%rdx
ffffff0000101cfb:	48 81 c1 00 10 00 00 	add    $0x1000,%rcx
ffffff0000101d02:	4c 09 f2             	or     %r14,%rdx
ffffff0000101d05:	48 89 14 06          	mov    %rdx,(%rsi,%rax,1)
ffffff0000101d09:	48 83 c0 08          	add    $0x8,%rax
ffffff0000101d0d:	48 39 f8             	cmp    %rdi,%rax
ffffff0000101d10:	75 e6                	jne    ffffff0000101cf8 <_ZN6x86_6419init_memory_mappingEv+0x918>
ffffff0000101d12:	4c 8b 53 08          	mov    0x8(%rbx),%r10
ffffff0000101d16:	41 81 e2 00 f0 1f 00 	and    $0x1ff000,%r10d
ffffff0000101d1d:	48 8b 13             	mov    (%rbx),%rdx
ffffff0000101d20:	49 c1 ea 0c          	shr    $0xc,%r10
ffffff0000101d24:	48 83 fd 01          	cmp    $0x1,%rbp
ffffff0000101d28:	4d 19 c0             	sbb    %r8,%r8
ffffff0000101d2b:	49 f7 d0             	not    %r8
ffffff0000101d2e:	41 83 e0 10          	and    $0x10,%r8d
ffffff0000101d32:	4d 09 f0             	or     %r14,%r8
ffffff0000101d35:	48 83 7b 18 00       	cmpq   $0x0,0x18(%rbx)
ffffff0000101d3a:	0f 84 e0 fe ff ff    	je     ffffff0000101c20 <_ZN6x86_6419init_memory_mappingEv+0x840>
ffffff0000101d40:	31 ff                	xor    %edi,%edi
ffffff0000101d42:	31 c9                	xor    %ecx,%ecx
ffffff0000101d44:	49 bb 00 00 00 00 00 	movabs $0xffffff0000000000,%r11
ffffff0000101d4b:	ff ff ff 
ffffff0000101d4e:	48 bd 00 50 10 00 00 	movabs $0xffffff0000105000,%rbp
ffffff0000101d55:	ff ff ff 
ffffff0000101d58:	49 bc 28 49 10 00 00 	movabs $0xffffff0000104928,%r12
ffffff0000101d5f:	ff ff ff 
ffffff0000101d62:	eb 32                	jmp    ffffff0000101d96 <_ZN6x86_6419init_memory_mappingEv+0x9b6>
ffffff0000101d64:	0f 1f 40 00          	nopl   0x0(%rax)
ffffff0000101d68:	49 3b 34 24          	cmp    (%r12),%rsi
ffffff0000101d6c:	77 49                	ja     ffffff0000101db7 <_ZN6x86_6419init_memory_mappingEv+0x9d7>
ffffff0000101d6e:	49 83 e0 fd          	and    $0xfffffffffffffffd,%r8
ffffff0000101d72:	4c 89 c0             	mov    %r8,%rax
ffffff0000101d75:	4c 01 d1             	add    %r10,%rcx
ffffff0000101d78:	48 09 d0             	or     %rdx,%rax
ffffff0000101d7b:	48 81 c2 00 10 00 00 	add    $0x1000,%rdx
ffffff0000101d82:	49 89 04 cf          	mov    %rax,(%r15,%rcx,8)
ffffff0000101d86:	8d 4f 01             	lea    0x1(%rdi),%ecx
ffffff0000101d89:	48 3b 4b 18          	cmp    0x18(%rbx),%rcx
ffffff0000101d8d:	48 89 cf             	mov    %rcx,%rdi
ffffff0000101d90:	0f 83 8a fe ff ff    	jae    ffffff0000101c20 <_ZN6x86_6419init_memory_mappingEv+0x840>
ffffff0000101d96:	48 b8 00 10 00 00 00 	movabs $0xffffff0000001000,%rax
ffffff0000101d9d:	ff ff ff 
ffffff0000101da0:	49 b9 00 30 10 00 00 	movabs $0xffffff0000103000,%r9
ffffff0000101da7:	ff ff ff 
ffffff0000101daa:	48 8d 34 02          	lea    (%rdx,%rax,1),%rsi
ffffff0000101dae:	4a 8d 04 1a          	lea    (%rdx,%r11,1),%rax
ffffff0000101db2:	49 3b 01             	cmp    (%r9),%rax
ffffff0000101db5:	73 b1                	jae    ffffff0000101d68 <_ZN6x86_6419init_memory_mappingEv+0x988>
ffffff0000101db7:	48 3b 45 00          	cmp    0x0(%rbp),%rax
ffffff0000101dbb:	49 b9 68 54 10 00 00 	movabs $0xffffff0000105468,%r9
ffffff0000101dc2:	ff ff ff 
ffffff0000101dc5:	4d 8b 09             	mov    (%r9),%r9
ffffff0000101dc8:	72 1e                	jb     ffffff0000101de8 <_ZN6x86_6419init_memory_mappingEv+0xa08>
ffffff0000101dca:	4c 39 ce             	cmp    %r9,%rsi
ffffff0000101dcd:	77 19                	ja     ffffff0000101de8 <_ZN6x86_6419init_memory_mappingEv+0xa08>
ffffff0000101dcf:	49 83 e0 fd          	and    $0xfffffffffffffffd,%r8
ffffff0000101dd3:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
ffffff0000101dda:	00 00 80 
ffffff0000101ddd:	49 09 c0             	or     %rax,%r8
ffffff0000101de0:	eb 90                	jmp    ffffff0000101d72 <_ZN6x86_6419init_memory_mappingEv+0x992>
ffffff0000101de2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
ffffff0000101de8:	4c 39 c8             	cmp    %r9,%rax
ffffff0000101deb:	76 85                	jbe    ffffff0000101d72 <_ZN6x86_6419init_memory_mappingEv+0x992>
ffffff0000101ded:	48 b8 00 00 00 00 00 	movabs $0x8000000000000000,%rax
ffffff0000101df4:	00 00 80 
ffffff0000101df7:	49 b9 00 60 10 00 00 	movabs $0xffffff0000106000,%r9
ffffff0000101dfe:	ff ff ff 
ffffff0000101e01:	4c 09 c0             	or     %r8,%rax
ffffff0000101e04:	49 3b 31             	cmp    (%r9),%rsi
ffffff0000101e07:	4c 0f 46 c0          	cmovbe %rax,%r8
ffffff0000101e0b:	e9 62 ff ff ff       	jmpq   ffffff0000101d72 <_ZN6x86_6419init_memory_mappingEv+0x992>
ffffff0000101e10:	4c 89 d0             	mov    %r10,%rax
ffffff0000101e13:	25 00 00 e0 3f       	and    $0x3fe00000,%eax
ffffff0000101e18:	48 c1 e8 15          	shr    $0x15,%rax
ffffff0000101e1c:	49 39 c5             	cmp    %rax,%r13
ffffff0000101e1f:	0f 84 f1 fe ff ff    	je     ffffff0000101d16 <_ZN6x86_6419init_memory_mappingEv+0x936>
ffffff0000101e25:	49 89 c5             	mov    %rax,%r13
ffffff0000101e28:	e9 9d fd ff ff       	jmpq   ffffff0000101bca <_ZN6x86_6419init_memory_mappingEv+0x7ea>
ffffff0000101e2d:	0f 1f 00             	nopl   (%rax)
ffffff0000101e30:	48 83 7b 18 00       	cmpq   $0x0,0x18(%rbx)
ffffff0000101e35:	48 8b 13             	mov    (%rbx),%rdx
ffffff0000101e38:	49 c7 c5 ff ff ff ff 	mov    $0xffffffffffffffff,%r13
ffffff0000101e3f:	0f 84 db fd ff ff    	je     ffffff0000101c20 <_ZN6x86_6419init_memory_mappingEv+0x840>
ffffff0000101e45:	4c 8b 44 24 10       	mov    0x10(%rsp),%r8
ffffff0000101e4a:	4c 8b 4c 24 20       	mov    0x20(%rsp),%r9
ffffff0000101e4f:	31 c9                	xor    %ecx,%ecx
ffffff0000101e51:	31 c0                	xor    %eax,%eax
ffffff0000101e53:	48 bf 00 40 00 00 00 	movabs $0xffffff0000004000,%rdi
ffffff0000101e5a:	ff ff ff 
ffffff0000101e5d:	0f 1f 00             	nopl   (%rax)
ffffff0000101e60:	48 89 d6             	mov    %rdx,%rsi
ffffff0000101e63:	4c 01 c0             	add    %r8,%rax
ffffff0000101e66:	48 81 c2 00 00 00 40 	add    $0x40000000,%rdx
ffffff0000101e6d:	4c 09 ce             	or     %r9,%rsi
ffffff0000101e70:	48 89 34 c7          	mov    %rsi,(%rdi,%rax,8)
ffffff0000101e74:	8d 41 01             	lea    0x1(%rcx),%eax
ffffff0000101e77:	48 3b 43 18          	cmp    0x18(%rbx),%rax
ffffff0000101e7b:	48 89 c1             	mov    %rax,%rcx
ffffff0000101e7e:	72 e0                	jb     ffffff0000101e60 <_ZN6x86_6419init_memory_mappingEv+0xa80>
ffffff0000101e80:	49 c7 c5 ff ff ff ff 	mov    $0xffffffffffffffff,%r13
ffffff0000101e87:	e9 94 fd ff ff       	jmpq   ffffff0000101c20 <_ZN6x86_6419init_memory_mappingEv+0x840>
ffffff0000101e8c:	ba 00 00 00 ff       	mov    $0xff000000,%edx
ffffff0000101e91:	48 39 d1             	cmp    %rdx,%rcx
ffffff0000101e94:	0f 87 2e 02 00 00    	ja     ffffff00001020c8 <_ZN6x86_6419init_memory_mappingEv+0xce8>
ffffff0000101e9a:	44 8d 5f 01          	lea    0x1(%rdi),%r11d
ffffff0000101e9e:	a1 48 56 10 00 00 ff 	movabs 0xffffff0000105648,%eax
ffffff0000101ea5:	ff ff 
ffffff0000101ea7:	4c 63 d7             	movslq %edi,%r10
ffffff0000101eaa:	4a 8d 34 03          	lea    (%rbx,%r8,1),%rsi
ffffff0000101eae:	49 c1 e2 05          	shl    $0x5,%r10
ffffff0000101eb2:	41 b9 ff ff bf fe    	mov    $0xfebfffff,%r9d
ffffff0000101eb8:	bd 00 00 00 ff       	mov    $0xff000000,%ebp
ffffff0000101ebd:	49 89 de             	mov    %rbx,%r14
ffffff0000101ec0:	89 c2                	mov    %eax,%edx
ffffff0000101ec2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
ffffff0000101ec8:	4c 39 c9             	cmp    %r9,%rcx
ffffff0000101ecb:	76 17                	jbe    ffffff0000101ee4 <_ZN6x86_6419init_memory_mappingEv+0xb04>
ffffff0000101ecd:	48 8b 5e 10          	mov    0x10(%rsi),%rbx
ffffff0000101ed1:	81 e3 00 f0 ff ff    	and    $0xfffff000,%ebx
ffffff0000101ed7:	48 0f af 5e 18       	imul   0x18(%rsi),%rbx
ffffff0000101edc:	48 01 cb             	add    %rcx,%rbx
ffffff0000101edf:	48 39 eb             	cmp    %rbp,%rbx
ffffff0000101ee2:	76 1c                	jbe    ffffff0000101f00 <_ZN6x86_6419init_memory_mappingEv+0xb20>
ffffff0000101ee4:	41 83 fb 7f          	cmp    $0x7f,%r11d
ffffff0000101ee8:	4c 89 f3             	mov    %r14,%rbx
ffffff0000101eeb:	89 d0                	mov    %edx,%eax
ffffff0000101eed:	0f 87 c4 fa ff ff    	ja     ffffff00001019b7 <_ZN6x86_6419init_memory_mappingEv+0x5d7>
ffffff0000101ef3:	89 fe                	mov    %edi,%esi
ffffff0000101ef5:	48 c1 e6 05          	shl    $0x5,%rsi
ffffff0000101ef9:	e9 19 fa ff ff       	jmpq   ffffff0000101917 <_ZN6x86_6419init_memory_mappingEv+0x537>
ffffff0000101efe:	66 90                	xchg   %ax,%ax
ffffff0000101f00:	83 ff 7f             	cmp    $0x7f,%edi
ffffff0000101f03:	77 c3                	ja     ffffff0000101ec8 <_ZN6x86_6419init_memory_mappingEv+0xae8>
ffffff0000101f05:	83 ea 01             	sub    $0x1,%edx
ffffff0000101f08:	39 d7                	cmp    %edx,%edi
ffffff0000101f0a:	73 5e                	jae    ffffff0000101f6a <_ZN6x86_6419init_memory_mappingEv+0xb8a>
ffffff0000101f0c:	4c 89 d2             	mov    %r10,%rdx
ffffff0000101f0f:	89 fe                	mov    %edi,%esi
ffffff0000101f11:	eb 08                	jmp    ffffff0000101f1b <_ZN6x86_6419init_memory_mappingEv+0xb3b>
ffffff0000101f13:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
ffffff0000101f18:	48 89 ca             	mov    %rcx,%rdx
ffffff0000101f1b:	49 8b 5c 16 20       	mov    0x20(%r14,%rdx,1),%rbx
ffffff0000101f20:	48 8d 4a 20          	lea    0x20(%rdx),%rcx
ffffff0000101f24:	83 c6 01             	add    $0x1,%esi
ffffff0000101f27:	49 89 1c 16          	mov    %rbx,(%r14,%rdx,1)
ffffff0000101f2b:	49 8b 5c 16 28       	mov    0x28(%r14,%rdx,1),%rbx
ffffff0000101f30:	49 89 5c 16 08       	mov    %rbx,0x8(%r14,%rdx,1)
ffffff0000101f35:	49 8b 5c 16 30       	mov    0x30(%r14,%rdx,1),%rbx
ffffff0000101f3a:	a1 48 56 10 00 00 ff 	movabs 0xffffff0000105648,%eax
ffffff0000101f41:	ff ff 
ffffff0000101f43:	49 89 5c 16 10       	mov    %rbx,0x10(%r14,%rdx,1)
ffffff0000101f48:	49 8b 5c 16 38       	mov    0x38(%r14,%rdx,1),%rbx
ffffff0000101f4d:	49 89 5c 16 18       	mov    %rbx,0x18(%r14,%rdx,1)
ffffff0000101f52:	8d 50 ff             	lea    -0x1(%rax),%edx
ffffff0000101f55:	48 b8 40 56 10 00 00 	movabs $0xffffff0000105640,%rax
ffffff0000101f5c:	ff ff ff 
ffffff0000101f5f:	4c 8b 30             	mov    (%rax),%r14
ffffff0000101f62:	39 d6                	cmp    %edx,%esi
ffffff0000101f64:	72 b2                	jb     ffffff0000101f18 <_ZN6x86_6419init_memory_mappingEv+0xb38>
ffffff0000101f66:	4b 8d 34 06          	lea    (%r14,%r8,1),%rsi
ffffff0000101f6a:	89 d0                	mov    %edx,%eax
ffffff0000101f6c:	a3 48 56 10 00 00 ff 	movabs %eax,0xffffff0000105648
ffffff0000101f73:	ff ff 
ffffff0000101f75:	48 8b 0e             	mov    (%rsi),%rcx
ffffff0000101f78:	e9 4b ff ff ff       	jmpq   ffffff0000101ec8 <_ZN6x86_6419init_memory_mappingEv+0xae8>
ffffff0000101f7d:	48 81 fa 00 00 10 00 	cmp    $0x100000,%rdx
ffffff0000101f84:	0f 87 ef 01 00 00    	ja     ffffff0000102179 <_ZN6x86_6419init_memory_mappingEv+0xd99>
ffffff0000101f8a:	44 8d 57 01          	lea    0x1(%rdi),%r10d
ffffff0000101f8e:	4c 63 cf             	movslq %edi,%r9
ffffff0000101f91:	4a 8d 34 03          	lea    (%rbx,%r8,1),%rsi
ffffff0000101f95:	41 89 c3             	mov    %eax,%r11d
ffffff0000101f98:	49 c1 e1 05          	shl    $0x5,%r9
ffffff0000101f9c:	0f 1f 40 00          	nopl   0x0(%rax)
ffffff0000101fa0:	48 81 fa ff ff 0d 00 	cmp    $0xdffff,%rdx
ffffff0000101fa7:	76 1b                	jbe    ffffff0000101fc4 <_ZN6x86_6419init_memory_mappingEv+0xbe4>
ffffff0000101fa9:	48 8b 4e 10          	mov    0x10(%rsi),%rcx
ffffff0000101fad:	81 e1 00 f0 ff ff    	and    $0xfffff000,%ecx
ffffff0000101fb3:	48 0f af 4e 18       	imul   0x18(%rsi),%rcx
ffffff0000101fb8:	48 01 d1             	add    %rdx,%rcx
ffffff0000101fbb:	48 81 f9 00 00 10 00 	cmp    $0x100000,%rcx
ffffff0000101fc2:	76 7c                	jbe    ffffff0000102040 <_ZN6x86_6419init_memory_mappingEv+0xc60>
ffffff0000101fc4:	41 83 fa 7f          	cmp    $0x7f,%r10d
ffffff0000101fc8:	44 89 d8             	mov    %r11d,%eax
ffffff0000101fcb:	0f 87 df f8 ff ff    	ja     ffffff00001018b0 <_ZN6x86_6419init_memory_mappingEv+0x4d0>
ffffff0000101fd1:	89 fe                	mov    %edi,%esi
ffffff0000101fd3:	48 c1 e6 05          	shl    $0x5,%rsi
ffffff0000101fd7:	41 39 fb             	cmp    %edi,%r11d
ffffff0000101fda:	0f 86 86 f8 ff ff    	jbe    ffffff0000101866 <_ZN6x86_6419init_memory_mappingEv+0x486>
ffffff0000101fe0:	49 63 d3             	movslq %r11d,%rdx
ffffff0000101fe3:	44 89 d9             	mov    %r11d,%ecx
ffffff0000101fe6:	48 89 d8             	mov    %rbx,%rax
ffffff0000101fe9:	48 c1 e2 05          	shl    $0x5,%rdx
ffffff0000101fed:	eb 0b                	jmp    ffffff0000101ffa <_ZN6x86_6419init_memory_mappingEv+0xc1a>
ffffff0000101fef:	90                   	nop
ffffff0000101ff0:	48 a1 40 56 10 00 00 	movabs 0xffffff0000105640,%rax
ffffff0000101ff7:	ff ff ff 
ffffff0000101ffa:	4c 8b 44 10 e0       	mov    -0x20(%rax,%rdx,1),%r8
ffffff0000101fff:	83 e9 01             	sub    $0x1,%ecx
ffffff0000102002:	4c 89 04 10          	mov    %r8,(%rax,%rdx,1)
ffffff0000102006:	4c 8b 44 10 e8       	mov    -0x18(%rax,%rdx,1),%r8
ffffff000010200b:	4c 89 44 10 08       	mov    %r8,0x8(%rax,%rdx,1)
ffffff0000102010:	4c 8b 44 10 f0       	mov    -0x10(%rax,%rdx,1),%r8
ffffff0000102015:	4c 89 44 10 10       	mov    %r8,0x10(%rax,%rdx,1)
ffffff000010201a:	4c 8b 44 10 f8       	mov    -0x8(%rax,%rdx,1),%r8
ffffff000010201f:	4c 89 44 10 18       	mov    %r8,0x18(%rax,%rdx,1)
ffffff0000102024:	48 83 ea 20          	sub    $0x20,%rdx
ffffff0000102028:	39 f9                	cmp    %edi,%ecx
ffffff000010202a:	77 c4                	ja     ffffff0000101ff0 <_ZN6x86_6419init_memory_mappingEv+0xc10>
ffffff000010202c:	48 b8 40 56 10 00 00 	movabs $0xffffff0000105640,%rax
ffffff0000102033:	ff ff ff 
ffffff0000102036:	48 8b 18             	mov    (%rax),%rbx
ffffff0000102039:	e9 28 f8 ff ff       	jmpq   ffffff0000101866 <_ZN6x86_6419init_memory_mappingEv+0x486>
ffffff000010203e:	66 90                	xchg   %ax,%ax
ffffff0000102040:	83 ff 7f             	cmp    $0x7f,%edi
ffffff0000102043:	0f 87 57 ff ff ff    	ja     ffffff0000101fa0 <_ZN6x86_6419init_memory_mappingEv+0xbc0>
ffffff0000102049:	41 83 eb 01          	sub    $0x1,%r11d
ffffff000010204d:	44 39 df             	cmp    %r11d,%edi
ffffff0000102050:	73 62                	jae    ffffff00001020b4 <_ZN6x86_6419init_memory_mappingEv+0xcd4>
ffffff0000102052:	4c 89 ca             	mov    %r9,%rdx
ffffff0000102055:	89 fe                	mov    %edi,%esi
ffffff0000102057:	eb 0a                	jmp    ffffff0000102063 <_ZN6x86_6419init_memory_mappingEv+0xc83>
ffffff0000102059:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
ffffff0000102060:	48 89 ca             	mov    %rcx,%rdx
ffffff0000102063:	4c 8b 5c 13 20       	mov    0x20(%rbx,%rdx,1),%r11
ffffff0000102068:	83 c6 01             	add    $0x1,%esi
ffffff000010206b:	48 8d 4a 20          	lea    0x20(%rdx),%rcx
ffffff000010206f:	4c 89 1c 13          	mov    %r11,(%rbx,%rdx,1)
ffffff0000102073:	4c 8b 5c 13 28       	mov    0x28(%rbx,%rdx,1),%r11
ffffff0000102078:	4c 89 5c 13 08       	mov    %r11,0x8(%rbx,%rdx,1)
ffffff000010207d:	4c 8b 5c 13 30       	mov    0x30(%rbx,%rdx,1),%r11
ffffff0000102082:	a1 48 56 10 00 00 ff 	movabs 0xffffff0000105648,%eax
ffffff0000102089:	ff ff 
ffffff000010208b:	4c 89 5c 13 10       	mov    %r11,0x10(%rbx,%rdx,1)
ffffff0000102090:	4c 8b 5c 13 38       	mov    0x38(%rbx,%rdx,1),%r11
ffffff0000102095:	4c 89 5c 13 18       	mov    %r11,0x18(%rbx,%rdx,1)
ffffff000010209a:	44 8d 58 ff          	lea    -0x1(%rax),%r11d
ffffff000010209e:	48 b8 40 56 10 00 00 	movabs $0xffffff0000105640,%rax
ffffff00001020a5:	ff ff ff 
ffffff00001020a8:	48 8b 18             	mov    (%rax),%rbx
ffffff00001020ab:	44 39 de             	cmp    %r11d,%esi
ffffff00001020ae:	72 b0                	jb     ffffff0000102060 <_ZN6x86_6419init_memory_mappingEv+0xc80>
ffffff00001020b0:	4a 8d 34 03          	lea    (%rbx,%r8,1),%rsi
ffffff00001020b4:	44 89 d8             	mov    %r11d,%eax
ffffff00001020b7:	a3 48 56 10 00 00 ff 	movabs %eax,0xffffff0000105648
ffffff00001020be:	ff ff 
ffffff00001020c0:	48 8b 16             	mov    (%rsi),%rdx
ffffff00001020c3:	e9 d8 fe ff ff       	jmpq   ffffff0000101fa0 <_ZN6x86_6419init_memory_mappingEv+0xbc0>
ffffff00001020c8:	8d 57 01             	lea    0x1(%rdi),%edx
ffffff00001020cb:	83 fa 7f             	cmp    $0x7f,%edx
ffffff00001020ce:	0f 87 9c 01 00 00    	ja     ffffff0000102270 <_ZN6x86_6419init_memory_mappingEv+0xe90>
ffffff00001020d4:	89 c2                	mov    %eax,%edx
ffffff00001020d6:	48 98                	cltq   
ffffff00001020d8:	48 c1 e0 05          	shl    $0x5,%rax
ffffff00001020dc:	eb 0f                	jmp    ffffff00001020ed <_ZN6x86_6419init_memory_mappingEv+0xd0d>
ffffff00001020de:	66 90                	xchg   %ax,%ax
ffffff00001020e0:	48 bb 40 56 10 00 00 	movabs $0xffffff0000105640,%rbx
ffffff00001020e7:	ff ff ff 
ffffff00001020ea:	48 8b 1b             	mov    (%rbx),%rbx
ffffff00001020ed:	48 8b 4c 03 e0       	mov    -0x20(%rbx,%rax,1),%rcx
ffffff00001020f2:	83 ea 01             	sub    $0x1,%edx
ffffff00001020f5:	48 89 0c 03          	mov    %rcx,(%rbx,%rax,1)
ffffff00001020f9:	48 8b 4c 03 e8       	mov    -0x18(%rbx,%rax,1),%rcx
ffffff00001020fe:	48 89 4c 03 08       	mov    %rcx,0x8(%rbx,%rax,1)
ffffff0000102103:	48 8b 4c 03 f0       	mov    -0x10(%rbx,%rax,1),%rcx
ffffff0000102108:	48 89 4c 03 10       	mov    %rcx,0x10(%rbx,%rax,1)
ffffff000010210d:	48 8b 4c 03 f8       	mov    -0x8(%rbx,%rax,1),%rcx
ffffff0000102112:	48 89 4c 03 18       	mov    %rcx,0x18(%rbx,%rax,1)
ffffff0000102117:	48 83 e8 20          	sub    $0x20,%rax
ffffff000010211b:	39 fa                	cmp    %edi,%edx
ffffff000010211d:	77 c1                	ja     ffffff00001020e0 <_ZN6x86_6419init_memory_mappingEv+0xd00>
ffffff000010211f:	48 b8 40 56 10 00 00 	movabs $0xffffff0000105640,%rax
ffffff0000102126:	ff ff ff 
ffffff0000102129:	48 8b 18             	mov    (%rax),%rbx
ffffff000010212c:	b8 00 00 c0 fe       	mov    $0xfec00000,%eax
ffffff0000102131:	49 01 d8             	add    %rbx,%r8
ffffff0000102134:	49 89 00             	mov    %rax,(%r8)
ffffff0000102137:	48 b8 00 00 c0 fe 00 	movabs $0xffffff00fec00000,%rax
ffffff000010213e:	ff ff ff 
ffffff0000102141:	49 c7 40 10 01 00 20 	movq   $0x200001,0x10(%r8)
ffffff0000102148:	00 
ffffff0000102149:	49 89 40 08          	mov    %rax,0x8(%r8)
ffffff000010214d:	a1 48 56 10 00 00 ff 	movabs 0xffffff0000105648,%eax
ffffff0000102154:	ff ff 
ffffff0000102156:	49 c7 40 18 02 00 00 	movq   $0x2,0x18(%r8)
ffffff000010215d:	00 
ffffff000010215e:	83 c0 01             	add    $0x1,%eax
ffffff0000102161:	85 c0                	test   %eax,%eax
ffffff0000102163:	a3 48 56 10 00 00 ff 	movabs %eax,0xffffff0000105648
ffffff000010216a:	ff ff 
ffffff000010216c:	0f 85 4d f8 ff ff    	jne    ffffff00001019bf <_ZN6x86_6419init_memory_mappingEv+0x5df>
ffffff0000102172:	31 f6                	xor    %esi,%esi
ffffff0000102174:	e9 ee f8 ff ff       	jmpq   ffffff0000101a67 <_ZN6x86_6419init_memory_mappingEv+0x687>
ffffff0000102179:	8d 57 01             	lea    0x1(%rdi),%edx
ffffff000010217c:	83 fa 7f             	cmp    $0x7f,%edx
ffffff000010217f:	0f 87 44 f7 ff ff    	ja     ffffff00001018c9 <_ZN6x86_6419init_memory_mappingEv+0x4e9>
ffffff0000102185:	39 c7                	cmp    %eax,%edi
ffffff0000102187:	73 60                	jae    ffffff00001021e9 <_ZN6x86_6419init_memory_mappingEv+0xe09>
ffffff0000102189:	48 63 d0             	movslq %eax,%rdx
ffffff000010218c:	89 c1                	mov    %eax,%ecx
ffffff000010218e:	48 89 d8             	mov    %rbx,%rax
ffffff0000102191:	48 c1 e2 05          	shl    $0x5,%rdx
ffffff0000102195:	eb 13                	jmp    ffffff00001021aa <_ZN6x86_6419init_memory_mappingEv+0xdca>
ffffff0000102197:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
ffffff000010219e:	00 00 
ffffff00001021a0:	48 a1 40 56 10 00 00 	movabs 0xffffff0000105640,%rax
ffffff00001021a7:	ff ff ff 
ffffff00001021aa:	48 8b 74 10 e0       	mov    -0x20(%rax,%rdx,1),%rsi
ffffff00001021af:	83 e9 01             	sub    $0x1,%ecx
ffffff00001021b2:	48 89 34 10          	mov    %rsi,(%rax,%rdx,1)
ffffff00001021b6:	48 8b 74 10 e8       	mov    -0x18(%rax,%rdx,1),%rsi
ffffff00001021bb:	48 89 74 10 08       	mov    %rsi,0x8(%rax,%rdx,1)
ffffff00001021c0:	48 8b 74 10 f0       	mov    -0x10(%rax,%rdx,1),%rsi
ffffff00001021c5:	48 89 74 10 10       	mov    %rsi,0x10(%rax,%rdx,1)
ffffff00001021ca:	48 8b 74 10 f8       	mov    -0x8(%rax,%rdx,1),%rsi
ffffff00001021cf:	48 89 74 10 18       	mov    %rsi,0x18(%rax,%rdx,1)
ffffff00001021d4:	48 83 ea 20          	sub    $0x20,%rdx
ffffff00001021d8:	39 f9                	cmp    %edi,%ecx
ffffff00001021da:	77 c4                	ja     ffffff00001021a0 <_ZN6x86_6419init_memory_mappingEv+0xdc0>
ffffff00001021dc:	48 b8 40 56 10 00 00 	movabs $0xffffff0000105640,%rax
ffffff00001021e3:	ff ff ff 
ffffff00001021e6:	48 8b 18             	mov    (%rax),%rbx
ffffff00001021e9:	49 01 d8             	add    %rbx,%r8
ffffff00001021ec:	48 b8 00 00 0e 00 00 	movabs $0xffffff00000e0000,%rax
ffffff00001021f3:	ff ff ff 
ffffff00001021f6:	49 c7 00 00 00 0e 00 	movq   $0xe0000,(%r8)
ffffff00001021fd:	49 89 40 08          	mov    %rax,0x8(%r8)
ffffff0000102201:	49 c7 40 10 01 10 00 	movq   $0x1001,0x10(%r8)
ffffff0000102208:	00 
ffffff0000102209:	49 c7 40 18 20 00 00 	movq   $0x20,0x18(%r8)
ffffff0000102210:	00 
ffffff0000102211:	e9 78 f6 ff ff       	jmpq   ffffff000010188e <_ZN6x86_6419init_memory_mappingEv+0x4ae>
ffffff0000102216:	31 f6                	xor    %esi,%esi
ffffff0000102218:	e9 49 f6 ff ff       	jmpq   ffffff0000101866 <_ZN6x86_6419init_memory_mappingEv+0x486>
ffffff000010221d:	48 81 fa 00 00 10 00 	cmp    $0x100000,%rdx
ffffff0000102224:	77 2f                	ja     ffffff0000102255 <_ZN6x86_6419init_memory_mappingEv+0xe75>
ffffff0000102226:	41 ba 01 00 00 00    	mov    $0x1,%r10d
ffffff000010222c:	45 31 c0             	xor    %r8d,%r8d
ffffff000010222f:	e9 5a fd ff ff       	jmpq   ffffff0000101f8e <_ZN6x86_6419init_memory_mappingEv+0xbae>
ffffff0000102234:	ba 00 00 00 ff       	mov    $0xff000000,%edx
ffffff0000102239:	48 39 d1             	cmp    %rdx,%rcx
ffffff000010223c:	77 1f                	ja     ffffff000010225d <_ZN6x86_6419init_memory_mappingEv+0xe7d>
ffffff000010223e:	41 bb 01 00 00 00    	mov    $0x1,%r11d
ffffff0000102244:	45 31 c0             	xor    %r8d,%r8d
ffffff0000102247:	31 ff                	xor    %edi,%edi
ffffff0000102249:	e9 50 fc ff ff       	jmpq   ffffff0000101e9e <_ZN6x86_6419init_memory_mappingEv+0xabe>
ffffff000010224e:	31 f6                	xor    %esi,%esi
ffffff0000102250:	e9 24 f7 ff ff       	jmpq   ffffff0000101979 <_ZN6x86_6419init_memory_mappingEv+0x599>
ffffff0000102255:	45 31 c0             	xor    %r8d,%r8d
ffffff0000102258:	e9 28 ff ff ff       	jmpq   ffffff0000102185 <_ZN6x86_6419init_memory_mappingEv+0xda5>
ffffff000010225d:	89 c2                	mov    %eax,%edx
ffffff000010225f:	45 31 c0             	xor    %r8d,%r8d
ffffff0000102262:	31 ff                	xor    %edi,%edi
ffffff0000102264:	e9 6d fe ff ff       	jmpq   ffffff00001020d6 <_ZN6x86_6419init_memory_mappingEv+0xcf6>
ffffff0000102269:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
ffffff0000102270:	48 89 d8             	mov    %rbx,%rax
ffffff0000102273:	e9 51 f7 ff ff       	jmpq   ffffff00001019c9 <_ZN6x86_6419init_memory_mappingEv+0x5e9>
ffffff0000102278:	48 b8 40 56 10 00 00 	movabs $0xffffff0000105640,%rax
ffffff000010227f:	ff ff ff 
ffffff0000102282:	31 f6                	xor    %esi,%esi
ffffff0000102284:	48 8b 18             	mov    (%rax),%rbx
ffffff0000102287:	e9 da f5 ff ff       	jmpq   ffffff0000101866 <_ZN6x86_6419init_memory_mappingEv+0x486>
ffffff000010228c:	0f 1f 40 00          	nopl   0x0(%rax)

Disassembly of section .text:

ffffff0000103000 <_text>:
ffffff0000103000:	0f 01 14 25 7a 00 10 	lgdt   0x10007a
ffffff0000103007:	00 
ffffff0000103008:	66 b8 10 00          	mov    $0x10,%ax
ffffff000010300c:	8e d8                	mov    %eax,%ds
ffffff000010300e:	8e c0                	mov    %eax,%es
ffffff0000103010:	8e d0                	mov    %eax,%ss
ffffff0000103012:	48 ba 00 00 00 00 00 	movabs $0xffffff0000000000,%rdx
ffffff0000103019:	ff ff ff 
ffffff000010301c:	48 01 d4             	add    %rdx,%rsp
ffffff000010301f:	48 b8 00 10 10 00 00 	movabs $0xffffff0000101000,%rax
ffffff0000103026:	ff ff ff 
ffffff0000103029:	48 bb 08 10 10 00 00 	movabs $0xffffff0000101008,%rbx
ffffff0000103030:	ff ff ff 
ffffff0000103033:	48 39 c3             	cmp    %rax,%rbx
ffffff0000103036:	74 0c                	je     ffffff0000103044 <_text+0x44>
ffffff0000103038:	50                   	push   %rax
ffffff0000103039:	53                   	push   %rbx
ffffff000010303a:	ff 10                	callq  *(%rax)
ffffff000010303c:	5b                   	pop    %rbx
ffffff000010303d:	58                   	pop    %rax
ffffff000010303e:	48 83 c0 08          	add    $0x8,%rax
ffffff0000103042:	eb ef                	jmp    ffffff0000103033 <_text+0x33>
ffffff0000103044:	48 bf 00 00 00 00 00 	movabs $0xffffff0000000000,%rdi
ffffff000010304b:	ff ff ff 
ffffff000010304e:	5e                   	pop    %rsi
ffffff000010304f:	48 01 fe             	add    %rdi,%rsi
ffffff0000103052:	48 81 c7 00 05 00 00 	add    $0x500,%rdi
ffffff0000103059:	e9 02 00 00 00       	jmpq   ffffff0000103060 <__kernel_start>
ffffff000010305e:	f4                   	hlt    
ffffff000010305f:	90                   	nop

ffffff0000103060 <__kernel_start>:
ffffff0000103060:	55                   	push   %rbp
ffffff0000103061:	53                   	push   %rbx
ffffff0000103062:	48 89 f5             	mov    %rsi,%rbp
ffffff0000103065:	48 89 fb             	mov    %rdi,%rbx
ffffff0000103068:	48 b8 d0 32 10 00 00 	movabs $0xffffff00001032d0,%rax
ffffff000010306f:	ff ff ff 
ffffff0000103072:	48 bf 14 50 10 00 00 	movabs $0xffffff0000105014,%rdi
ffffff0000103079:	ff ff ff 
ffffff000010307c:	48 83 ec 08          	sub    $0x8,%rsp
ffffff0000103080:	ff d0                	callq  *%rax
ffffff0000103082:	8b 13                	mov    (%rbx),%edx
ffffff0000103084:	48 89 de             	mov    %rbx,%rsi
ffffff0000103087:	48 b9 e0 34 10 00 00 	movabs $0xffffff00001034e0,%rcx
ffffff000010308e:	ff ff ff 
ffffff0000103091:	48 bf 30 50 10 00 00 	movabs $0xffffff0000105030,%rdi
ffffff0000103098:	ff ff ff 
ffffff000010309b:	31 c0                	xor    %eax,%eax
ffffff000010309d:	ff d1                	callq  *%rcx
ffffff000010309f:	48 89 ef             	mov    %rbp,%rdi
ffffff00001030a2:	48 b8 10 10 10 00 00 	movabs $0xffffff0000101010,%rax
ffffff00001030a9:	ff ff ff 
ffffff00001030ac:	ff d0                	callq  *%rax
ffffff00001030ae:	48 89 df             	mov    %rbx,%rdi
ffffff00001030b1:	48 b8 30 32 10 00 00 	movabs $0xffffff0000103230,%rax
ffffff00001030b8:	ff ff ff 
ffffff00001030bb:	ff d0                	callq  *%rax
ffffff00001030bd:	48 83 c4 08          	add    $0x8,%rsp
ffffff00001030c1:	48 b8 e0 30 10 00 00 	movabs $0xffffff00001030e0,%rax
ffffff00001030c8:	ff ff ff 
ffffff00001030cb:	5b                   	pop    %rbx
ffffff00001030cc:	5d                   	pop    %rbp
ffffff00001030cd:	ff e0                	jmpq   *%rax
ffffff00001030cf:	90                   	nop

ffffff00001030d0 <_ZN6kernel4exitEi>:
ffffff00001030d0:	31 ff                	xor    %edi,%edi
ffffff00001030d2:	48 b8 70 31 10 00 00 	movabs $0xffffff0000103170,%rax
ffffff00001030d9:	ff ff ff 
ffffff00001030dc:	ff e0                	jmpq   *%rax
ffffff00001030de:	66 90                	xchg   %ax,%ax

ffffff00001030e0 <_ZN6kernel4mainEv>:
ffffff00001030e0:	48 83 ec 08          	sub    $0x8,%rsp
ffffff00001030e4:	48 b8 20 10 10 00 00 	movabs $0xffffff0000101020,%rax
ffffff00001030eb:	ff ff ff 
ffffff00001030ee:	ff d0                	callq  *%rax
ffffff00001030f0:	48 ba 00 50 10 00 00 	movabs $0xffffff0000105000,%rdx
ffffff00001030f7:	ff ff ff 
ffffff00001030fa:	be 20 00 00 00       	mov    $0x20,%esi
ffffff00001030ff:	48 bf 0a 50 10 00 00 	movabs $0xffffff000010500a,%rdi
ffffff0000103106:	ff ff ff 
ffffff0000103109:	31 c0                	xor    %eax,%eax
ffffff000010310b:	48 b9 50 36 10 00 00 	movabs $0xffffff0000103650,%rcx
ffffff0000103112:	ff ff ff 
ffffff0000103115:	48 83 c4 08          	add    $0x8,%rsp
ffffff0000103119:	ff e1                	jmpq   *%rcx
ffffff000010311b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

ffffff0000103120 <__cxa_atexit>:
ffffff0000103120:	48 b8 80 54 10 00 00 	movabs $0xffffff0000105480,%rax
ffffff0000103127:	ff ff ff 
ffffff000010312a:	8b 08                	mov    (%rax),%ecx
ffffff000010312c:	83 f9 0f             	cmp    $0xf,%ecx
ffffff000010312f:	77 2f                	ja     ffffff0000103160 <__cxa_atexit+0x40>
ffffff0000103131:	8d 51 01             	lea    0x1(%rcx),%edx
ffffff0000103134:	89 d0                	mov    %edx,%eax
ffffff0000103136:	48 ba c0 54 10 00 00 	movabs $0xffffff00001054c0,%rdx
ffffff000010313d:	ff ff ff 
ffffff0000103140:	a3 80 54 10 00 00 ff 	movabs %eax,0xffffff0000105480
ffffff0000103147:	ff ff 
ffffff0000103149:	89 c8                	mov    %ecx,%eax
ffffff000010314b:	48 c1 e0 04          	shl    $0x4,%rax
ffffff000010314f:	48 01 d0             	add    %rdx,%rax
ffffff0000103152:	48 89 38             	mov    %rdi,(%rax)
ffffff0000103155:	48 89 70 08          	mov    %rsi,0x8(%rax)
ffffff0000103159:	31 c0                	xor    %eax,%eax
ffffff000010315b:	c3                   	retq   
ffffff000010315c:	0f 1f 40 00          	nopl   0x0(%rax)
ffffff0000103160:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
ffffff0000103165:	c3                   	retq   
ffffff0000103166:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
ffffff000010316d:	00 00 00 

ffffff0000103170 <__cxa_finalize>:
ffffff0000103170:	41 55                	push   %r13
ffffff0000103172:	41 54                	push   %r12
ffffff0000103174:	55                   	push   %rbp
ffffff0000103175:	53                   	push   %rbx
ffffff0000103176:	48 83 ec 08          	sub    $0x8,%rsp
ffffff000010317a:	48 85 ff             	test   %rdi,%rdi
ffffff000010317d:	a1 80 54 10 00 00 ff 	movabs 0xffffff0000105480,%eax
ffffff0000103184:	ff ff 
ffffff0000103186:	74 53                	je     ffffff00001031db <__cxa_finalize+0x6b>
ffffff0000103188:	49 89 fc             	mov    %rdi,%r12
ffffff000010318b:	8d 68 ff             	lea    -0x1(%rax),%ebp
ffffff000010318e:	49 bd c0 54 10 00 00 	movabs $0xffffff00001054c0,%r13
ffffff0000103195:	ff ff ff 
ffffff0000103198:	eb 09                	jmp    ffffff00001031a3 <__cxa_finalize+0x33>
ffffff000010319a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
ffffff00001031a0:	83 ed 01             	sub    $0x1,%ebp
ffffff00001031a3:	83 fd ff             	cmp    $0xffffffff,%ebp
ffffff00001031a6:	74 28                	je     ffffff00001031d0 <__cxa_finalize+0x60>
ffffff00001031a8:	89 eb                	mov    %ebp,%ebx
ffffff00001031aa:	48 c1 e3 04          	shl    $0x4,%rbx
ffffff00001031ae:	4c 01 eb             	add    %r13,%rbx
ffffff00001031b1:	4c 39 23             	cmp    %r12,(%rbx)
ffffff00001031b4:	75 ea                	jne    ffffff00001031a0 <__cxa_finalize+0x30>
ffffff00001031b6:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
ffffff00001031ba:	41 ff d4             	callq  *%r12
ffffff00001031bd:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
ffffff00001031c4:	eb da                	jmp    ffffff00001031a0 <__cxa_finalize+0x30>
ffffff00001031c6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
ffffff00001031cd:	00 00 00 
ffffff00001031d0:	48 83 c4 08          	add    $0x8,%rsp
ffffff00001031d4:	5b                   	pop    %rbx
ffffff00001031d5:	5d                   	pop    %rbp
ffffff00001031d6:	41 5c                	pop    %r12
ffffff00001031d8:	41 5d                	pop    %r13
ffffff00001031da:	c3                   	retq   
ffffff00001031db:	85 c0                	test   %eax,%eax
ffffff00001031dd:	75 07                	jne    ffffff00001031e6 <__cxa_finalize+0x76>
ffffff00001031df:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
ffffff00001031e4:	eb a2                	jmp    ffffff0000103188 <__cxa_finalize+0x18>
ffffff00001031e6:	83 e8 01             	sub    $0x1,%eax
ffffff00001031e9:	48 ba c0 54 10 00 00 	movabs $0xffffff00001054c0,%rdx
ffffff00001031f0:	ff ff ff 
ffffff00001031f3:	48 c1 e0 04          	shl    $0x4,%rax
ffffff00001031f7:	48 01 d0             	add    %rdx,%rax
ffffff00001031fa:	48 8b 10             	mov    (%rax),%rdx
ffffff00001031fd:	48 85 d2             	test   %rdx,%rdx
ffffff0000103200:	74 ce                	je     ffffff00001031d0 <__cxa_finalize+0x60>
ffffff0000103202:	48 8b 78 08          	mov    0x8(%rax),%rdi
ffffff0000103206:	48 83 c4 08          	add    $0x8,%rsp
ffffff000010320a:	5b                   	pop    %rbx
ffffff000010320b:	5d                   	pop    %rbp
ffffff000010320c:	41 5c                	pop    %r12
ffffff000010320e:	41 5d                	pop    %r13
ffffff0000103210:	ff e2                	jmpq   *%rdx
ffffff0000103212:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
ffffff0000103219:	1f 84 00 00 00 00 00 

ffffff0000103220 <__cxa_pure_virtual>:
ffffff0000103220:	f3 c3                	repz retq 
ffffff0000103222:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
ffffff0000103229:	00 00 00 
ffffff000010322c:	0f 1f 40 00          	nopl   0x0(%rax)

ffffff0000103230 <_ZN10multiboot25parseEm>:
ffffff0000103230:	55                   	push   %rbp
ffffff0000103231:	53                   	push   %rbx
ffffff0000103232:	48 bd e0 34 10 00 00 	movabs $0xffffff00001034e0,%rbp
ffffff0000103239:	ff ff ff 
ffffff000010323c:	48 8d 5f 08          	lea    0x8(%rdi),%rbx
ffffff0000103240:	48 83 ec 08          	sub    $0x8,%rsp
ffffff0000103244:	8b 47 08             	mov    0x8(%rdi),%eax
ffffff0000103247:	85 c0                	test   %eax,%eax
ffffff0000103249:	75 33                	jne    ffffff000010327e <_ZN10multiboot25parseEm+0x4e>
ffffff000010324b:	eb 7b                	jmp    ffffff00001032c8 <_ZN10multiboot25parseEm+0x98>
ffffff000010324d:	0f 1f 00             	nopl   (%rax)
ffffff0000103250:	83 f8 08             	cmp    $0x8,%eax
ffffff0000103253:	74 5b                	je     ffffff00001032b0 <_ZN10multiboot25parseEm+0x80>
ffffff0000103255:	83 f8 02             	cmp    $0x2,%eax
ffffff0000103258:	75 12                	jne    ffffff000010326c <_ZN10multiboot25parseEm+0x3c>
ffffff000010325a:	48 8d 73 08          	lea    0x8(%rbx),%rsi
ffffff000010325e:	48 bf 62 50 10 00 00 	movabs $0xffffff0000105062,%rdi
ffffff0000103265:	ff ff ff 
ffffff0000103268:	31 c0                	xor    %eax,%eax
ffffff000010326a:	ff d5                	callq  *%rbp
ffffff000010326c:	8b 43 04             	mov    0x4(%rbx),%eax
ffffff000010326f:	83 c0 07             	add    $0x7,%eax
ffffff0000103272:	83 e0 f8             	and    $0xfffffff8,%eax
ffffff0000103275:	48 01 c3             	add    %rax,%rbx
ffffff0000103278:	8b 03                	mov    (%rbx),%eax
ffffff000010327a:	85 c0                	test   %eax,%eax
ffffff000010327c:	74 4a                	je     ffffff00001032c8 <_ZN10multiboot25parseEm+0x98>
ffffff000010327e:	83 f8 06             	cmp    $0x6,%eax
ffffff0000103281:	75 cd                	jne    ffffff0000103250 <_ZN10multiboot25parseEm+0x20>
ffffff0000103283:	8b 43 04             	mov    0x4(%rbx),%eax
ffffff0000103286:	31 d2                	xor    %edx,%edx
ffffff0000103288:	83 e8 10             	sub    $0x10,%eax
ffffff000010328b:	f7 73 08             	divl   0x8(%rbx)
ffffff000010328e:	a3 f0 55 10 00 00 ff 	movabs %eax,0xffffff00001055f0
ffffff0000103295:	ff ff 
ffffff0000103297:	48 8d 43 10          	lea    0x10(%rbx),%rax
ffffff000010329b:	48 a3 f8 55 10 00 00 	movabs %rax,0xffffff00001055f8
ffffff00001032a2:	ff ff ff 
ffffff00001032a5:	eb c5                	jmp    ffffff000010326c <_ZN10multiboot25parseEm+0x3c>
ffffff00001032a7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
ffffff00001032ae:	00 00 
ffffff00001032b0:	48 8b 73 08          	mov    0x8(%rbx),%rsi
ffffff00001032b4:	48 bf 78 50 10 00 00 	movabs $0xffffff0000105078,%rdi
ffffff00001032bb:	ff ff ff 
ffffff00001032be:	31 c0                	xor    %eax,%eax
ffffff00001032c0:	ff d5                	callq  *%rbp
ffffff00001032c2:	eb a8                	jmp    ffffff000010326c <_ZN10multiboot25parseEm+0x3c>
ffffff00001032c4:	0f 1f 40 00          	nopl   0x0(%rax)
ffffff00001032c8:	48 83 c4 08          	add    $0x8,%rsp
ffffff00001032cc:	5b                   	pop    %rbx
ffffff00001032cd:	5d                   	pop    %rbp
ffffff00001032ce:	c3                   	retq   
ffffff00001032cf:	90                   	nop

ffffff00001032d0 <_ZN6kernel5debug3logEPKc>:
ffffff00001032d0:	44 0f b6 07          	movzbl (%rdi),%r8d
ffffff00001032d4:	be 01 00 00 00       	mov    $0x1,%esi
ffffff00001032d9:	b9 fd 03 00 00       	mov    $0x3fd,%ecx
ffffff00001032de:	41 b9 f8 03 00 00    	mov    $0x3f8,%r9d
ffffff00001032e4:	45 84 c0             	test   %r8b,%r8b
ffffff00001032e7:	75 09                	jne    ffffff00001032f2 <_ZN6kernel5debug3logEPKc+0x22>
ffffff00001032e9:	eb 28                	jmp    ffffff0000103313 <_ZN6kernel5debug3logEPKc+0x43>
ffffff00001032eb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
ffffff00001032f0:	f3 90                	pause  
ffffff00001032f2:	89 ca                	mov    %ecx,%edx
ffffff00001032f4:	ec                   	in     (%dx),%al
ffffff00001032f5:	a8 20                	test   $0x20,%al
ffffff00001032f7:	74 f7                	je     ffffff00001032f0 <_ZN6kernel5debug3logEPKc+0x20>
ffffff00001032f9:	44 89 c0             	mov    %r8d,%eax
ffffff00001032fc:	44 89 ca             	mov    %r9d,%edx
ffffff00001032ff:	ee                   	out    %al,(%dx)
ffffff0000103300:	44 0f b6 04 37       	movzbl (%rdi,%rsi,1),%r8d
ffffff0000103305:	8d 46 01             	lea    0x1(%rsi),%eax
ffffff0000103308:	45 84 c0             	test   %r8b,%r8b
ffffff000010330b:	74 04                	je     ffffff0000103311 <_ZN6kernel5debug3logEPKc+0x41>
ffffff000010330d:	89 c6                	mov    %eax,%esi
ffffff000010330f:	eb e1                	jmp    ffffff00001032f2 <_ZN6kernel5debug3logEPKc+0x22>
ffffff0000103311:	f3 c3                	repz retq 
ffffff0000103313:	f3 c3                	repz retq 
ffffff0000103315:	66 66 2e 0f 1f 84 00 	data16 nopw %cs:0x0(%rax,%rax,1)
ffffff000010331c:	00 00 00 00 

ffffff0000103320 <_ZN6kernel5debug4loglEPKc>:
ffffff0000103320:	44 0f b6 07          	movzbl (%rdi),%r8d
ffffff0000103324:	be 01 00 00 00       	mov    $0x1,%esi
ffffff0000103329:	b9 fd 03 00 00       	mov    $0x3fd,%ecx
ffffff000010332e:	41 b9 f8 03 00 00    	mov    $0x3f8,%r9d
ffffff0000103334:	45 84 c0             	test   %r8b,%r8b
ffffff0000103337:	75 09                	jne    ffffff0000103342 <_ZN6kernel5debug4loglEPKc+0x22>
ffffff0000103339:	eb 26                	jmp    ffffff0000103361 <_ZN6kernel5debug4loglEPKc+0x41>
ffffff000010333b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
ffffff0000103340:	f3 90                	pause  
ffffff0000103342:	89 ca                	mov    %ecx,%edx
ffffff0000103344:	ec                   	in     (%dx),%al
ffffff0000103345:	a8 20                	test   $0x20,%al
ffffff0000103347:	74 f7                	je     ffffff0000103340 <_ZN6kernel5debug4loglEPKc+0x20>
ffffff0000103349:	44 89 c0             	mov    %r8d,%eax
ffffff000010334c:	44 89 ca             	mov    %r9d,%edx
ffffff000010334f:	ee                   	out    %al,(%dx)
ffffff0000103350:	44 0f b6 04 37       	movzbl (%rdi,%rsi,1),%r8d
ffffff0000103355:	8d 46 01             	lea    0x1(%rsi),%eax
ffffff0000103358:	45 84 c0             	test   %r8b,%r8b
ffffff000010335b:	74 04                	je     ffffff0000103361 <_ZN6kernel5debug4loglEPKc+0x41>
ffffff000010335d:	89 c6                	mov    %eax,%esi
ffffff000010335f:	eb e1                	jmp    ffffff0000103342 <_ZN6kernel5debug4loglEPKc+0x22>
ffffff0000103361:	ba fd 03 00 00       	mov    $0x3fd,%edx
ffffff0000103366:	ec                   	in     (%dx),%al
ffffff0000103367:	a8 20                	test   $0x20,%al
ffffff0000103369:	75 0c                	jne    ffffff0000103377 <_ZN6kernel5debug4loglEPKc+0x57>
ffffff000010336b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
ffffff0000103370:	f3 90                	pause  
ffffff0000103372:	ec                   	in     (%dx),%al
ffffff0000103373:	a8 20                	test   $0x20,%al
ffffff0000103375:	74 f9                	je     ffffff0000103370 <_ZN6kernel5debug4loglEPKc+0x50>
ffffff0000103377:	ba f8 03 00 00       	mov    $0x3f8,%edx
ffffff000010337c:	b8 0a 00 00 00       	mov    $0xa,%eax
ffffff0000103381:	ee                   	out    %al,(%dx)
ffffff0000103382:	c3                   	retq   
ffffff0000103383:	66 66 66 66 2e 0f 1f 	data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
ffffff000010338a:	84 00 00 00 00 00 

ffffff0000103390 <_ZN6kernel5debug4logfEPKcz>:
ffffff0000103390:	48 81 ec d8 01 00 00 	sub    $0x1d8,%rsp
ffffff0000103397:	84 c0                	test   %al,%al
ffffff0000103399:	48 89 b4 24 28 01 00 	mov    %rsi,0x128(%rsp)
ffffff00001033a0:	00 
ffffff00001033a1:	48 89 94 24 30 01 00 	mov    %rdx,0x130(%rsp)
ffffff00001033a8:	00 
ffffff00001033a9:	48 89 8c 24 38 01 00 	mov    %rcx,0x138(%rsp)
ffffff00001033b0:	00 
ffffff00001033b1:	4c 89 84 24 40 01 00 	mov    %r8,0x140(%rsp)
ffffff00001033b8:	00 
ffffff00001033b9:	4c 89 8c 24 48 01 00 	mov    %r9,0x148(%rsp)
ffffff00001033c0:	00 
ffffff00001033c1:	74 40                	je     ffffff0000103403 <_ZN6kernel5debug4logfEPKcz+0x73>
ffffff00001033c3:	0f 29 84 24 50 01 00 	movaps %xmm0,0x150(%rsp)
ffffff00001033ca:	00 
ffffff00001033cb:	0f 29 8c 24 60 01 00 	movaps %xmm1,0x160(%rsp)
ffffff00001033d2:	00 
ffffff00001033d3:	0f 29 94 24 70 01 00 	movaps %xmm2,0x170(%rsp)
ffffff00001033da:	00 
ffffff00001033db:	0f 29 9c 24 80 01 00 	movaps %xmm3,0x180(%rsp)
ffffff00001033e2:	00 
ffffff00001033e3:	0f 29 a4 24 90 01 00 	movaps %xmm4,0x190(%rsp)
ffffff00001033ea:	00 
ffffff00001033eb:	0f 29 ac 24 a0 01 00 	movaps %xmm5,0x1a0(%rsp)
ffffff00001033f2:	00 
ffffff00001033f3:	0f 29 b4 24 b0 01 00 	movaps %xmm6,0x1b0(%rsp)
ffffff00001033fa:	00 
ffffff00001033fb:	0f 29 bc 24 c0 01 00 	movaps %xmm7,0x1c0(%rsp)
ffffff0000103402:	00 
ffffff0000103403:	48 8d 84 24 e0 01 00 	lea    0x1e0(%rsp),%rax
ffffff000010340a:	00 
ffffff000010340b:	48 89 fe             	mov    %rdi,%rsi
ffffff000010340e:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
ffffff0000103413:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
ffffff0000103418:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
ffffff000010341d:	48 8d 84 24 20 01 00 	lea    0x120(%rsp),%rax
ffffff0000103424:	00 
ffffff0000103425:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%rsp)
ffffff000010342c:	00 
ffffff000010342d:	c7 44 24 0c 30 00 00 	movl   $0x30,0xc(%rsp)
ffffff0000103434:	00 
ffffff0000103435:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
ffffff000010343a:	48 b8 b7 37 10 00 00 	movabs $0xffffff00001037b7,%rax
ffffff0000103441:	ff ff ff 
ffffff0000103444:	ff d0                	callq  *%rax
ffffff0000103446:	be 01 00 00 00       	mov    $0x1,%esi
ffffff000010344b:	bf 5b 00 00 00       	mov    $0x5b,%edi
ffffff0000103450:	49 b9 9b 50 10 00 00 	movabs $0xffffff000010509b,%r9
ffffff0000103457:	ff ff ff 
ffffff000010345a:	b9 fd 03 00 00       	mov    $0x3fd,%ecx
ffffff000010345f:	41 b8 f8 03 00 00    	mov    $0x3f8,%r8d
ffffff0000103465:	eb 0b                	jmp    ffffff0000103472 <_ZN6kernel5debug4logfEPKcz+0xe2>
ffffff0000103467:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
ffffff000010346e:	00 00 
ffffff0000103470:	f3 90                	pause  
ffffff0000103472:	89 ca                	mov    %ecx,%edx
ffffff0000103474:	ec                   	in     (%dx),%al
ffffff0000103475:	a8 20                	test   $0x20,%al
ffffff0000103477:	74 f7                	je     ffffff0000103470 <_ZN6kernel5debug4logfEPKcz+0xe0>
ffffff0000103479:	89 f8                	mov    %edi,%eax
ffffff000010347b:	44 89 c2             	mov    %r8d,%edx
ffffff000010347e:	ee                   	out    %al,(%dx)
ffffff000010347f:	41 0f b6 3c 31       	movzbl (%r9,%rsi,1),%edi
ffffff0000103484:	8d 46 01             	lea    0x1(%rsi),%eax
ffffff0000103487:	40 84 ff             	test   %dil,%dil
ffffff000010348a:	74 04                	je     ffffff0000103490 <_ZN6kernel5debug4logfEPKcz+0x100>
ffffff000010348c:	89 c6                	mov    %eax,%esi
ffffff000010348e:	eb e2                	jmp    ffffff0000103472 <_ZN6kernel5debug4logfEPKcz+0xe2>
ffffff0000103490:	0f b6 7c 24 20       	movzbl 0x20(%rsp),%edi
ffffff0000103495:	be 01 00 00 00       	mov    $0x1,%esi
ffffff000010349a:	b9 fd 03 00 00       	mov    $0x3fd,%ecx
ffffff000010349f:	41 b8 f8 03 00 00    	mov    $0x3f8,%r8d
ffffff00001034a5:	40 84 ff             	test   %dil,%dil
ffffff00001034a8:	75 08                	jne    ffffff00001034b2 <_ZN6kernel5debug4logfEPKcz+0x122>
ffffff00001034aa:	eb 24                	jmp    ffffff00001034d0 <_ZN6kernel5debug4logfEPKcz+0x140>
ffffff00001034ac:	0f 1f 40 00          	nopl   0x0(%rax)
ffffff00001034b0:	f3 90                	pause  
ffffff00001034b2:	89 ca                	mov    %ecx,%edx
ffffff00001034b4:	ec                   	in     (%dx),%al
ffffff00001034b5:	a8 20                	test   $0x20,%al
ffffff00001034b7:	74 f7                	je     ffffff00001034b0 <_ZN6kernel5debug4logfEPKcz+0x120>
ffffff00001034b9:	89 f8                	mov    %edi,%eax
ffffff00001034bb:	44 89 c2             	mov    %r8d,%edx
ffffff00001034be:	ee                   	out    %al,(%dx)
ffffff00001034bf:	0f b6 7c 34 20       	movzbl 0x20(%rsp,%rsi,1),%edi
ffffff00001034c4:	8d 46 01             	lea    0x1(%rsi),%eax
ffffff00001034c7:	40 84 ff             	test   %dil,%dil
ffffff00001034ca:	74 04                	je     ffffff00001034d0 <_ZN6kernel5debug4logfEPKcz+0x140>
ffffff00001034cc:	89 c6                	mov    %eax,%esi
ffffff00001034ce:	eb e2                	jmp    ffffff00001034b2 <_ZN6kernel5debug4logfEPKcz+0x122>
ffffff00001034d0:	48 81 c4 d8 01 00 00 	add    $0x1d8,%rsp
ffffff00001034d7:	c3                   	retq   
ffffff00001034d8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
ffffff00001034df:	00 

ffffff00001034e0 <_ZN6kernel5debug5logflEPKcz>:
ffffff00001034e0:	48 81 ec d8 01 00 00 	sub    $0x1d8,%rsp
ffffff00001034e7:	84 c0                	test   %al,%al
ffffff00001034e9:	48 89 b4 24 28 01 00 	mov    %rsi,0x128(%rsp)
ffffff00001034f0:	00 
ffffff00001034f1:	48 89 94 24 30 01 00 	mov    %rdx,0x130(%rsp)
ffffff00001034f8:	00 
ffffff00001034f9:	48 89 8c 24 38 01 00 	mov    %rcx,0x138(%rsp)
ffffff0000103500:	00 
ffffff0000103501:	4c 89 84 24 40 01 00 	mov    %r8,0x140(%rsp)
ffffff0000103508:	00 
ffffff0000103509:	4c 89 8c 24 48 01 00 	mov    %r9,0x148(%rsp)
ffffff0000103510:	00 
ffffff0000103511:	74 40                	je     ffffff0000103553 <_ZN6kernel5debug5logflEPKcz+0x73>
ffffff0000103513:	0f 29 84 24 50 01 00 	movaps %xmm0,0x150(%rsp)
ffffff000010351a:	00 
ffffff000010351b:	0f 29 8c 24 60 01 00 	movaps %xmm1,0x160(%rsp)
ffffff0000103522:	00 
ffffff0000103523:	0f 29 94 24 70 01 00 	movaps %xmm2,0x170(%rsp)
ffffff000010352a:	00 
ffffff000010352b:	0f 29 9c 24 80 01 00 	movaps %xmm3,0x180(%rsp)
ffffff0000103532:	00 
ffffff0000103533:	0f 29 a4 24 90 01 00 	movaps %xmm4,0x190(%rsp)
ffffff000010353a:	00 
ffffff000010353b:	0f 29 ac 24 a0 01 00 	movaps %xmm5,0x1a0(%rsp)
ffffff0000103542:	00 
ffffff0000103543:	0f 29 b4 24 b0 01 00 	movaps %xmm6,0x1b0(%rsp)
ffffff000010354a:	00 
ffffff000010354b:	0f 29 bc 24 c0 01 00 	movaps %xmm7,0x1c0(%rsp)
ffffff0000103552:	00 
ffffff0000103553:	48 8d 84 24 e0 01 00 	lea    0x1e0(%rsp),%rax
ffffff000010355a:	00 
ffffff000010355b:	48 89 fe             	mov    %rdi,%rsi
ffffff000010355e:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
ffffff0000103563:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
ffffff0000103568:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
ffffff000010356d:	48 8d 84 24 20 01 00 	lea    0x120(%rsp),%rax
ffffff0000103574:	00 
ffffff0000103575:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%rsp)
ffffff000010357c:	00 
ffffff000010357d:	c7 44 24 0c 30 00 00 	movl   $0x30,0xc(%rsp)
ffffff0000103584:	00 
ffffff0000103585:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
ffffff000010358a:	48 b8 b7 37 10 00 00 	movabs $0xffffff00001037b7,%rax
ffffff0000103591:	ff ff ff 
ffffff0000103594:	ff d0                	callq  *%rax
ffffff0000103596:	be 01 00 00 00       	mov    $0x1,%esi
ffffff000010359b:	bf 5b 00 00 00       	mov    $0x5b,%edi
ffffff00001035a0:	49 b9 9b 50 10 00 00 	movabs $0xffffff000010509b,%r9
ffffff00001035a7:	ff ff ff 
ffffff00001035aa:	b9 fd 03 00 00       	mov    $0x3fd,%ecx
ffffff00001035af:	41 b8 f8 03 00 00    	mov    $0x3f8,%r8d
ffffff00001035b5:	eb 0b                	jmp    ffffff00001035c2 <_ZN6kernel5debug5logflEPKcz+0xe2>
ffffff00001035b7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
ffffff00001035be:	00 00 
ffffff00001035c0:	f3 90                	pause  
ffffff00001035c2:	89 ca                	mov    %ecx,%edx
ffffff00001035c4:	ec                   	in     (%dx),%al
ffffff00001035c5:	a8 20                	test   $0x20,%al
ffffff00001035c7:	74 f7                	je     ffffff00001035c0 <_ZN6kernel5debug5logflEPKcz+0xe0>
ffffff00001035c9:	89 f8                	mov    %edi,%eax
ffffff00001035cb:	44 89 c2             	mov    %r8d,%edx
ffffff00001035ce:	ee                   	out    %al,(%dx)
ffffff00001035cf:	41 0f b6 3c 31       	movzbl (%r9,%rsi,1),%edi
ffffff00001035d4:	8d 46 01             	lea    0x1(%rsi),%eax
ffffff00001035d7:	40 84 ff             	test   %dil,%dil
ffffff00001035da:	74 04                	je     ffffff00001035e0 <_ZN6kernel5debug5logflEPKcz+0x100>
ffffff00001035dc:	89 c6                	mov    %eax,%esi
ffffff00001035de:	eb e2                	jmp    ffffff00001035c2 <_ZN6kernel5debug5logflEPKcz+0xe2>
ffffff00001035e0:	0f b6 7c 24 20       	movzbl 0x20(%rsp),%edi
ffffff00001035e5:	be 01 00 00 00       	mov    $0x1,%esi
ffffff00001035ea:	b9 fd 03 00 00       	mov    $0x3fd,%ecx
ffffff00001035ef:	41 b8 f8 03 00 00    	mov    $0x3f8,%r8d
ffffff00001035f5:	40 84 ff             	test   %dil,%dil
ffffff00001035f8:	75 08                	jne    ffffff0000103602 <_ZN6kernel5debug5logflEPKcz+0x122>
ffffff00001035fa:	eb 24                	jmp    ffffff0000103620 <_ZN6kernel5debug5logflEPKcz+0x140>
ffffff00001035fc:	0f 1f 40 00          	nopl   0x0(%rax)
ffffff0000103600:	f3 90                	pause  
ffffff0000103602:	89 ca                	mov    %ecx,%edx
ffffff0000103604:	ec                   	in     (%dx),%al
ffffff0000103605:	a8 20                	test   $0x20,%al
ffffff0000103607:	74 f7                	je     ffffff0000103600 <_ZN6kernel5debug5logflEPKcz+0x120>
ffffff0000103609:	89 f8                	mov    %edi,%eax
ffffff000010360b:	44 89 c2             	mov    %r8d,%edx
ffffff000010360e:	ee                   	out    %al,(%dx)
ffffff000010360f:	0f b6 7c 34 20       	movzbl 0x20(%rsp,%rsi,1),%edi
ffffff0000103614:	8d 46 01             	lea    0x1(%rsi),%eax
ffffff0000103617:	40 84 ff             	test   %dil,%dil
ffffff000010361a:	74 04                	je     ffffff0000103620 <_ZN6kernel5debug5logflEPKcz+0x140>
ffffff000010361c:	89 c6                	mov    %eax,%esi
ffffff000010361e:	eb e2                	jmp    ffffff0000103602 <_ZN6kernel5debug5logflEPKcz+0x122>
ffffff0000103620:	ba fd 03 00 00       	mov    $0x3fd,%edx
ffffff0000103625:	ec                   	in     (%dx),%al
ffffff0000103626:	a8 20                	test   $0x20,%al
ffffff0000103628:	75 0d                	jne    ffffff0000103637 <_ZN6kernel5debug5logflEPKcz+0x157>
ffffff000010362a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
ffffff0000103630:	f3 90                	pause  
ffffff0000103632:	ec                   	in     (%dx),%al
ffffff0000103633:	a8 20                	test   $0x20,%al
ffffff0000103635:	74 f9                	je     ffffff0000103630 <_ZN6kernel5debug5logflEPKcz+0x150>
ffffff0000103637:	ba f8 03 00 00       	mov    $0x3f8,%edx
ffffff000010363c:	b8 0a 00 00 00       	mov    $0xa,%eax
ffffff0000103641:	ee                   	out    %al,(%dx)
ffffff0000103642:	48 81 c4 d8 01 00 00 	add    $0x1d8,%rsp
ffffff0000103649:	c3                   	retq   
ffffff000010364a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

ffffff0000103650 <_ZN6kernel5debug5panicEPKcjS2_z>:
ffffff0000103650:	53                   	push   %rbx
ffffff0000103651:	48 81 ec d0 01 00 00 	sub    $0x1d0,%rsp
ffffff0000103658:	84 c0                	test   %al,%al
ffffff000010365a:	48 89 8c 24 38 01 00 	mov    %rcx,0x138(%rsp)
ffffff0000103661:	00 
ffffff0000103662:	4c 89 84 24 40 01 00 	mov    %r8,0x140(%rsp)
ffffff0000103669:	00 
ffffff000010366a:	4c 89 8c 24 48 01 00 	mov    %r9,0x148(%rsp)
ffffff0000103671:	00 
ffffff0000103672:	74 40                	je     ffffff00001036b4 <_ZN6kernel5debug5panicEPKcjS2_z+0x64>
ffffff0000103674:	0f 29 84 24 50 01 00 	movaps %xmm0,0x150(%rsp)
ffffff000010367b:	00 
ffffff000010367c:	0f 29 8c 24 60 01 00 	movaps %xmm1,0x160(%rsp)
ffffff0000103683:	00 
ffffff0000103684:	0f 29 94 24 70 01 00 	movaps %xmm2,0x170(%rsp)
ffffff000010368b:	00 
ffffff000010368c:	0f 29 9c 24 80 01 00 	movaps %xmm3,0x180(%rsp)
ffffff0000103693:	00 
ffffff0000103694:	0f 29 a4 24 90 01 00 	movaps %xmm4,0x190(%rsp)
ffffff000010369b:	00 
ffffff000010369c:	0f 29 ac 24 a0 01 00 	movaps %xmm5,0x1a0(%rsp)
ffffff00001036a3:	00 
ffffff00001036a4:	0f 29 b4 24 b0 01 00 	movaps %xmm6,0x1b0(%rsp)
ffffff00001036ab:	00 
ffffff00001036ac:	0f 29 bc 24 c0 01 00 	movaps %xmm7,0x1c0(%rsp)
ffffff00001036b3:	00 
ffffff00001036b4:	48 8d 84 24 e0 01 00 	lea    0x1e0(%rsp),%rax
ffffff00001036bb:	00 
ffffff00001036bc:	89 f1                	mov    %esi,%ecx
ffffff00001036be:	49 b8 d9 3a 10 00 00 	movabs $0xffffff0000103ad9,%r8
ffffff00001036c5:	ff ff ff 
ffffff00001036c8:	48 be a2 50 10 00 00 	movabs $0xffffff00001050a2,%rsi
ffffff00001036cf:	ff ff ff 
ffffff00001036d2:	48 89 d3             	mov    %rdx,%rbx
ffffff00001036d5:	48 89 fa             	mov    %rdi,%rdx
ffffff00001036d8:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
ffffff00001036dd:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
ffffff00001036e2:	48 8d 84 24 20 01 00 	lea    0x120(%rsp),%rax
ffffff00001036e9:	00 
ffffff00001036ea:	c7 44 24 08 18 00 00 	movl   $0x18,0x8(%rsp)
ffffff00001036f1:	00 
ffffff00001036f2:	c7 44 24 0c 30 00 00 	movl   $0x30,0xc(%rsp)
ffffff00001036f9:	00 
ffffff00001036fa:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
ffffff00001036ff:	31 c0                	xor    %eax,%eax
ffffff0000103701:	41 ff d0             	callq  *%r8
ffffff0000103704:	44 0f b6 44 24 20    	movzbl 0x20(%rsp),%r8d
ffffff000010370a:	bf 01 00 00 00       	mov    $0x1,%edi
ffffff000010370f:	b9 fd 03 00 00       	mov    $0x3fd,%ecx
ffffff0000103714:	be f8 03 00 00       	mov    $0x3f8,%esi
ffffff0000103719:	45 84 c0             	test   %r8b,%r8b
ffffff000010371c:	75 04                	jne    ffffff0000103722 <_ZN6kernel5debug5panicEPKcjS2_z+0xd2>
ffffff000010371e:	eb 21                	jmp    ffffff0000103741 <_ZN6kernel5debug5panicEPKcjS2_z+0xf1>
ffffff0000103720:	f3 90                	pause  
ffffff0000103722:	89 ca                	mov    %ecx,%edx
ffffff0000103724:	ec                   	in     (%dx),%al
ffffff0000103725:	a8 20                	test   $0x20,%al
ffffff0000103727:	74 f7                	je     ffffff0000103720 <_ZN6kernel5debug5panicEPKcjS2_z+0xd0>
ffffff0000103729:	44 89 c0             	mov    %r8d,%eax
ffffff000010372c:	89 f2                	mov    %esi,%edx
ffffff000010372e:	ee                   	out    %al,(%dx)
ffffff000010372f:	44 0f b6 44 3c 20    	movzbl 0x20(%rsp,%rdi,1),%r8d
ffffff0000103735:	8d 47 01             	lea    0x1(%rdi),%eax
ffffff0000103738:	45 84 c0             	test   %r8b,%r8b
ffffff000010373b:	74 04                	je     ffffff0000103741 <_ZN6kernel5debug5panicEPKcjS2_z+0xf1>
ffffff000010373d:	89 c7                	mov    %eax,%edi
ffffff000010373f:	eb e1                	jmp    ffffff0000103722 <_ZN6kernel5debug5panicEPKcjS2_z+0xd2>
ffffff0000103741:	48 89 de             	mov    %rbx,%rsi
ffffff0000103744:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
ffffff0000103749:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
ffffff000010374e:	48 b8 b7 37 10 00 00 	movabs $0xffffff00001037b7,%rax
ffffff0000103755:	ff ff ff 
ffffff0000103758:	ff d0                	callq  *%rax
ffffff000010375a:	0f b6 7c 24 20       	movzbl 0x20(%rsp),%edi
ffffff000010375f:	be 01 00 00 00       	mov    $0x1,%esi
ffffff0000103764:	b9 fd 03 00 00       	mov    $0x3fd,%ecx
ffffff0000103769:	41 b8 f8 03 00 00    	mov    $0x3f8,%r8d
ffffff000010376f:	40 84 ff             	test   %dil,%dil
ffffff0000103772:	75 0e                	jne    ffffff0000103782 <_ZN6kernel5debug5panicEPKcjS2_z+0x132>
ffffff0000103774:	eb 2a                	jmp    ffffff00001037a0 <_ZN6kernel5debug5panicEPKcjS2_z+0x150>
ffffff0000103776:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
ffffff000010377d:	00 00 00 
ffffff0000103780:	f3 90                	pause  
ffffff0000103782:	89 ca                	mov    %ecx,%edx
ffffff0000103784:	ec                   	in     (%dx),%al
ffffff0000103785:	a8 20                	test   $0x20,%al
ffffff0000103787:	74 f7                	je     ffffff0000103780 <_ZN6kernel5debug5panicEPKcjS2_z+0x130>
ffffff0000103789:	89 f8                	mov    %edi,%eax
ffffff000010378b:	44 89 c2             	mov    %r8d,%edx
ffffff000010378e:	ee                   	out    %al,(%dx)
ffffff000010378f:	0f b6 7c 34 20       	movzbl 0x20(%rsp,%rsi,1),%edi
ffffff0000103794:	8d 46 01             	lea    0x1(%rsi),%eax
ffffff0000103797:	40 84 ff             	test   %dil,%dil
ffffff000010379a:	74 04                	je     ffffff00001037a0 <_ZN6kernel5debug5panicEPKcjS2_z+0x150>
ffffff000010379c:	89 c6                	mov    %eax,%esi
ffffff000010379e:	eb e2                	jmp    ffffff0000103782 <_ZN6kernel5debug5panicEPKcjS2_z+0x132>
ffffff00001037a0:	48 b8 a0 3c 10 00 00 	movabs $0xffffff0000103ca0,%rax
ffffff00001037a7:	ff ff ff 
ffffff00001037aa:	ff d0                	callq  *%rax
ffffff00001037ac:	48 81 c4 d0 01 00 00 	add    $0x1d0,%rsp
ffffff00001037b3:	31 c0                	xor    %eax,%eax
ffffff00001037b5:	5b                   	pop    %rbx
ffffff00001037b6:	c3                   	retq   

ffffff00001037b7 <kvsprintf>:
ffffff00001037b7:	41 57                	push   %r15
ffffff00001037b9:	41 56                	push   %r14
ffffff00001037bb:	49 89 ff             	mov    %rdi,%r15
ffffff00001037be:	41 55                	push   %r13
ffffff00001037c0:	41 54                	push   %r12
ffffff00001037c2:	55                   	push   %rbp
ffffff00001037c3:	53                   	push   %rbx
ffffff00001037c4:	48 89 f5             	mov    %rsi,%rbp
ffffff00001037c7:	48 89 d3             	mov    %rdx,%rbx
ffffff00001037ca:	48 83 ec 38          	sub    $0x38,%rsp
ffffff00001037ce:	48 89 7c 24 08       	mov    %rdi,0x8(%rsp)
ffffff00001037d3:	8a 45 00             	mov    0x0(%rbp),%al
ffffff00001037d6:	84 c0                	test   %al,%al
ffffff00001037d8:	0f 84 e0 02 00 00    	je     ffffff0000103abe <kvsprintf+0x307>
ffffff00001037de:	3c 25                	cmp    $0x25,%al
ffffff00001037e0:	74 0b                	je     ffffff00001037ed <kvsprintf+0x36>
ffffff00001037e2:	41 88 07             	mov    %al,(%r15)
ffffff00001037e5:	48 ff c5             	inc    %rbp
ffffff00001037e8:	49 ff c7             	inc    %r15
ffffff00001037eb:	eb e6                	jmp    ffffff00001037d3 <kvsprintf+0x1c>
ffffff00001037ed:	8a 45 01             	mov    0x1(%rbp),%al
ffffff00001037f0:	3c 30                	cmp    $0x30,%al
ffffff00001037f2:	74 09                	je     ffffff00001037fd <kvsprintf+0x46>
ffffff00001037f4:	48 83 c5 02          	add    $0x2,%rbp
ffffff00001037f8:	45 31 f6             	xor    %r14d,%r14d
ffffff00001037fb:	eb 0d                	jmp    ffffff000010380a <kvsprintf+0x53>
ffffff00001037fd:	8a 45 02             	mov    0x2(%rbp),%al
ffffff0000103800:	41 be 01 00 00 00    	mov    $0x1,%r14d
ffffff0000103806:	48 83 c5 03          	add    $0x3,%rbp
ffffff000010380a:	8d 50 cf             	lea    -0x31(%rax),%edx
ffffff000010380d:	45 31 e4             	xor    %r12d,%r12d
ffffff0000103810:	80 fa 08             	cmp    $0x8,%dl
ffffff0000103813:	77 29                	ja     ffffff000010383e <kvsprintf+0x87>
ffffff0000103815:	44 0f be e0          	movsbl %al,%r12d
ffffff0000103819:	0f be 45 00          	movsbl 0x0(%rbp),%eax
ffffff000010381d:	41 83 ec 30          	sub    $0x30,%r12d
ffffff0000103821:	8d 50 d0             	lea    -0x30(%rax),%edx
ffffff0000103824:	80 fa 09             	cmp    $0x9,%dl
ffffff0000103827:	76 05                	jbe    ffffff000010382e <kvsprintf+0x77>
ffffff0000103829:	48 ff c5             	inc    %rbp
ffffff000010382c:	eb 10                	jmp    ffffff000010383e <kvsprintf+0x87>
ffffff000010382e:	45 6b e4 0a          	imul   $0xa,%r12d,%r12d
ffffff0000103832:	48 83 c5 02          	add    $0x2,%rbp
ffffff0000103836:	45 8d 64 04 d0       	lea    -0x30(%r12,%rax,1),%r12d
ffffff000010383b:	8a 45 ff             	mov    -0x1(%rbp),%al
ffffff000010383e:	83 e8 63             	sub    $0x63,%eax
ffffff0000103841:	3c 15                	cmp    $0x15,%al
ffffff0000103843:	77 8e                	ja     ffffff00001037d3 <kvsprintf+0x1c>
ffffff0000103845:	0f b6 c0             	movzbl %al,%eax
ffffff0000103848:	48 ba c8 50 10 00 00 	movabs $0xffffff00001050c8,%rdx
ffffff000010384f:	ff ff ff 
ffffff0000103852:	ff 24 c2             	jmpq   *(%rdx,%rax,8)
ffffff0000103855:	8b 13                	mov    (%rbx),%edx
ffffff0000103857:	83 fa 30             	cmp    $0x30,%edx
ffffff000010385a:	73 0d                	jae    ffffff0000103869 <kvsprintf+0xb2>
ffffff000010385c:	89 d0                	mov    %edx,%eax
ffffff000010385e:	83 c2 08             	add    $0x8,%edx
ffffff0000103861:	48 03 43 10          	add    0x10(%rbx),%rax
ffffff0000103865:	89 13                	mov    %edx,(%rbx)
ffffff0000103867:	eb 0c                	jmp    ffffff0000103875 <kvsprintf+0xbe>
ffffff0000103869:	48 8b 43 08          	mov    0x8(%rbx),%rax
ffffff000010386d:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffffff0000103871:	48 89 53 08          	mov    %rdx,0x8(%rbx)
ffffff0000103875:	48 8b 38             	mov    (%rax),%rdi
ffffff0000103878:	ba 0a 00 00 00       	mov    $0xa,%edx
ffffff000010387d:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
ffffff0000103882:	48 b8 d9 3b 10 00 00 	movabs $0xffffff0000103bd9,%rax
ffffff0000103889:	ff ff ff 
ffffff000010388c:	eb 61                	jmp    ffffff00001038ef <kvsprintf+0x138>
ffffff000010388e:	8b 13                	mov    (%rbx),%edx
ffffff0000103890:	83 fa 30             	cmp    $0x30,%edx
ffffff0000103893:	73 0d                	jae    ffffff00001038a2 <kvsprintf+0xeb>
ffffff0000103895:	89 d0                	mov    %edx,%eax
ffffff0000103897:	83 c2 08             	add    $0x8,%edx
ffffff000010389a:	48 03 43 10          	add    0x10(%rbx),%rax
ffffff000010389e:	89 13                	mov    %edx,(%rbx)
ffffff00001038a0:	eb 0c                	jmp    ffffff00001038ae <kvsprintf+0xf7>
ffffff00001038a2:	48 8b 43 08          	mov    0x8(%rbx),%rax
ffffff00001038a6:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffffff00001038aa:	48 89 53 08          	mov    %rdx,0x8(%rbx)
ffffff00001038ae:	48 8b 38             	mov    (%rax),%rdi
ffffff00001038b1:	ba 0a 00 00 00       	mov    $0xa,%edx
ffffff00001038b6:	eb 28                	jmp    ffffff00001038e0 <kvsprintf+0x129>
ffffff00001038b8:	8b 13                	mov    (%rbx),%edx
ffffff00001038ba:	83 fa 30             	cmp    $0x30,%edx
ffffff00001038bd:	73 0d                	jae    ffffff00001038cc <kvsprintf+0x115>
ffffff00001038bf:	89 d0                	mov    %edx,%eax
ffffff00001038c1:	83 c2 08             	add    $0x8,%edx
ffffff00001038c4:	48 03 43 10          	add    0x10(%rbx),%rax
ffffff00001038c8:	89 13                	mov    %edx,(%rbx)
ffffff00001038ca:	eb 0c                	jmp    ffffff00001038d8 <kvsprintf+0x121>
ffffff00001038cc:	48 8b 43 08          	mov    0x8(%rbx),%rax
ffffff00001038d0:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffffff00001038d4:	48 89 53 08          	mov    %rdx,0x8(%rbx)
ffffff00001038d8:	48 8b 38             	mov    (%rax),%rdi
ffffff00001038db:	ba 10 00 00 00       	mov    $0x10,%edx
ffffff00001038e0:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
ffffff00001038e5:	48 b8 a4 3b 10 00 00 	movabs $0xffffff0000103ba4,%rax
ffffff00001038ec:	ff ff ff 
ffffff00001038ef:	ff d0                	callq  *%rax
ffffff00001038f1:	e9 eb 00 00 00       	jmpq   ffffff00001039e1 <kvsprintf+0x22a>
ffffff00001038f6:	8b 13                	mov    (%rbx),%edx
ffffff00001038f8:	83 fa 30             	cmp    $0x30,%edx
ffffff00001038fb:	73 0d                	jae    ffffff000010390a <kvsprintf+0x153>
ffffff00001038fd:	89 d0                	mov    %edx,%eax
ffffff00001038ff:	83 c2 08             	add    $0x8,%edx
ffffff0000103902:	48 03 43 10          	add    0x10(%rbx),%rax
ffffff0000103906:	89 13                	mov    %edx,(%rbx)
ffffff0000103908:	eb 0c                	jmp    ffffff0000103916 <kvsprintf+0x15f>
ffffff000010390a:	48 8b 43 08          	mov    0x8(%rbx),%rax
ffffff000010390e:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffffff0000103912:	48 89 53 08          	mov    %rdx,0x8(%rbx)
ffffff0000103916:	48 8b 38             	mov    (%rax),%rdi
ffffff0000103919:	ba 10 00 00 00       	mov    $0x10,%edx
ffffff000010391e:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
ffffff0000103923:	48 b8 39 3c 10 00 00 	movabs $0xffffff0000103c39,%rax
ffffff000010392a:	ff ff ff 
ffffff000010392d:	49 83 c7 02          	add    $0x2,%r15
ffffff0000103931:	41 bc 08 00 00 00    	mov    $0x8,%r12d
ffffff0000103937:	ff d0                	callq  *%rax
ffffff0000103939:	41 be 01 00 00 00    	mov    $0x1,%r14d
ffffff000010393f:	41 c6 47 fe 30       	movb   $0x30,-0x2(%r15)
ffffff0000103944:	41 c6 47 ff 78       	movb   $0x78,-0x1(%r15)
ffffff0000103949:	e9 93 00 00 00       	jmpq   ffffff00001039e1 <kvsprintf+0x22a>
ffffff000010394e:	8a 45 00             	mov    0x0(%rbp),%al
ffffff0000103951:	4c 8d 6d 01          	lea    0x1(%rbp),%r13
ffffff0000103955:	3c 75                	cmp    $0x75,%al
ffffff0000103957:	74 4c                	je     ffffff00001039a5 <kvsprintf+0x1ee>
ffffff0000103959:	3c 78                	cmp    $0x78,%al
ffffff000010395b:	0f 84 8a 00 00 00    	je     ffffff00001039eb <kvsprintf+0x234>
ffffff0000103961:	3c 64                	cmp    $0x64,%al
ffffff0000103963:	4c 89 ed             	mov    %r13,%rbp
ffffff0000103966:	0f 85 67 fe ff ff    	jne    ffffff00001037d3 <kvsprintf+0x1c>
ffffff000010396c:	8b 13                	mov    (%rbx),%edx
ffffff000010396e:	83 fa 30             	cmp    $0x30,%edx
ffffff0000103971:	73 0d                	jae    ffffff0000103980 <kvsprintf+0x1c9>
ffffff0000103973:	89 d0                	mov    %edx,%eax
ffffff0000103975:	83 c2 08             	add    $0x8,%edx
ffffff0000103978:	48 03 43 10          	add    0x10(%rbx),%rax
ffffff000010397c:	89 13                	mov    %edx,(%rbx)
ffffff000010397e:	eb 0c                	jmp    ffffff000010398c <kvsprintf+0x1d5>
ffffff0000103980:	48 8b 43 08          	mov    0x8(%rbx),%rax
ffffff0000103984:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffffff0000103988:	48 89 53 08          	mov    %rdx,0x8(%rbx)
ffffff000010398c:	48 8b 38             	mov    (%rax),%rdi
ffffff000010398f:	ba 0a 00 00 00       	mov    $0xa,%edx
ffffff0000103994:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
ffffff0000103999:	48 b8 6e 3c 10 00 00 	movabs $0xffffff0000103c6e,%rax
ffffff00001039a0:	ff ff ff 
ffffff00001039a3:	eb 37                	jmp    ffffff00001039dc <kvsprintf+0x225>
ffffff00001039a5:	8b 13                	mov    (%rbx),%edx
ffffff00001039a7:	83 fa 30             	cmp    $0x30,%edx
ffffff00001039aa:	73 0d                	jae    ffffff00001039b9 <kvsprintf+0x202>
ffffff00001039ac:	89 d0                	mov    %edx,%eax
ffffff00001039ae:	83 c2 08             	add    $0x8,%edx
ffffff00001039b1:	48 03 43 10          	add    0x10(%rbx),%rax
ffffff00001039b5:	89 13                	mov    %edx,(%rbx)
ffffff00001039b7:	eb 0c                	jmp    ffffff00001039c5 <kvsprintf+0x20e>
ffffff00001039b9:	48 8b 43 08          	mov    0x8(%rbx),%rax
ffffff00001039bd:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffffff00001039c1:	48 89 53 08          	mov    %rdx,0x8(%rbx)
ffffff00001039c5:	ba 0a 00 00 00       	mov    $0xa,%edx
ffffff00001039ca:	48 8d 74 24 10       	lea    0x10(%rsp),%rsi
ffffff00001039cf:	48 8b 38             	mov    (%rax),%rdi
ffffff00001039d2:	48 b8 39 3c 10 00 00 	movabs $0xffffff0000103c39,%rax
ffffff00001039d9:	ff ff ff 
ffffff00001039dc:	4c 89 ed             	mov    %r13,%rbp
ffffff00001039df:	ff d0                	callq  *%rax
ffffff00001039e1:	48 8d 44 24 10       	lea    0x10(%rsp),%rax
ffffff00001039e6:	e9 8d 00 00 00       	jmpq   ffffff0000103a78 <kvsprintf+0x2c1>
ffffff00001039eb:	8b 13                	mov    (%rbx),%edx
ffffff00001039ed:	83 fa 30             	cmp    $0x30,%edx
ffffff00001039f0:	73 0d                	jae    ffffff00001039ff <kvsprintf+0x248>
ffffff00001039f2:	89 d0                	mov    %edx,%eax
ffffff00001039f4:	83 c2 08             	add    $0x8,%edx
ffffff00001039f7:	48 03 43 10          	add    0x10(%rbx),%rax
ffffff00001039fb:	89 13                	mov    %edx,(%rbx)
ffffff00001039fd:	eb 0c                	jmp    ffffff0000103a0b <kvsprintf+0x254>
ffffff00001039ff:	48 8b 43 08          	mov    0x8(%rbx),%rax
ffffff0000103a03:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffffff0000103a07:	48 89 53 08          	mov    %rdx,0x8(%rbx)
ffffff0000103a0b:	ba 10 00 00 00       	mov    $0x10,%edx
ffffff0000103a10:	eb b8                	jmp    ffffff00001039ca <kvsprintf+0x213>
ffffff0000103a12:	8b 13                	mov    (%rbx),%edx
ffffff0000103a14:	49 8d 77 01          	lea    0x1(%r15),%rsi
ffffff0000103a18:	83 fa 30             	cmp    $0x30,%edx
ffffff0000103a1b:	73 0d                	jae    ffffff0000103a2a <kvsprintf+0x273>
ffffff0000103a1d:	89 d0                	mov    %edx,%eax
ffffff0000103a1f:	83 c2 08             	add    $0x8,%edx
ffffff0000103a22:	48 03 43 10          	add    0x10(%rbx),%rax
ffffff0000103a26:	89 13                	mov    %edx,(%rbx)
ffffff0000103a28:	eb 0c                	jmp    ffffff0000103a36 <kvsprintf+0x27f>
ffffff0000103a2a:	48 8b 43 08          	mov    0x8(%rbx),%rax
ffffff0000103a2e:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffffff0000103a32:	48 89 53 08          	mov    %rdx,0x8(%rbx)
ffffff0000103a36:	48 8b 00             	mov    (%rax),%rax
ffffff0000103a39:	41 88 07             	mov    %al,(%r15)
ffffff0000103a3c:	49 89 f7             	mov    %rsi,%r15
ffffff0000103a3f:	e9 8f fd ff ff       	jmpq   ffffff00001037d3 <kvsprintf+0x1c>
ffffff0000103a44:	8b 13                	mov    (%rbx),%edx
ffffff0000103a46:	83 fa 30             	cmp    $0x30,%edx
ffffff0000103a49:	73 0d                	jae    ffffff0000103a58 <kvsprintf+0x2a1>
ffffff0000103a4b:	89 d0                	mov    %edx,%eax
ffffff0000103a4d:	83 c2 08             	add    $0x8,%edx
ffffff0000103a50:	48 03 43 10          	add    0x10(%rbx),%rax
ffffff0000103a54:	89 13                	mov    %edx,(%rbx)
ffffff0000103a56:	eb 0c                	jmp    ffffff0000103a64 <kvsprintf+0x2ad>
ffffff0000103a58:	48 8b 43 08          	mov    0x8(%rbx),%rax
ffffff0000103a5c:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffffff0000103a60:	48 89 53 08          	mov    %rdx,0x8(%rbx)
ffffff0000103a64:	48 8b 00             	mov    (%rax),%rax
ffffff0000103a67:	48 ba bf 50 10 00 00 	movabs $0xffffff00001050bf,%rdx
ffffff0000103a6e:	ff ff ff 
ffffff0000103a71:	48 85 c0             	test   %rax,%rax
ffffff0000103a74:	48 0f 44 c2          	cmove  %rdx,%rax
ffffff0000103a78:	48 89 c2             	mov    %rax,%rdx
ffffff0000103a7b:	80 3a 00             	cmpb   $0x0,(%rdx)
ffffff0000103a7e:	74 05                	je     ffffff0000103a85 <kvsprintf+0x2ce>
ffffff0000103a80:	48 ff c2             	inc    %rdx
ffffff0000103a83:	eb f6                	jmp    ffffff0000103a7b <kvsprintf+0x2c4>
ffffff0000103a85:	4d 63 e4             	movslq %r12d,%r12
ffffff0000103a88:	49 01 c4             	add    %rax,%r12
ffffff0000103a8b:	4c 39 e2             	cmp    %r12,%rdx
ffffff0000103a8e:	73 18                	jae    ffffff0000103aa8 <kvsprintf+0x2f1>
ffffff0000103a90:	49 ff c7             	inc    %r15
ffffff0000103a93:	41 83 fe 01          	cmp    $0x1,%r14d
ffffff0000103a97:	19 f6                	sbb    %esi,%esi
ffffff0000103a99:	48 ff c2             	inc    %rdx
ffffff0000103a9c:	83 e6 f0             	and    $0xfffffff0,%esi
ffffff0000103a9f:	83 c6 30             	add    $0x30,%esi
ffffff0000103aa2:	41 88 77 ff          	mov    %sil,-0x1(%r15)
ffffff0000103aa6:	eb e3                	jmp    ffffff0000103a8b <kvsprintf+0x2d4>
ffffff0000103aa8:	8a 10                	mov    (%rax),%dl
ffffff0000103aaa:	84 d2                	test   %dl,%dl
ffffff0000103aac:	0f 84 21 fd ff ff    	je     ffffff00001037d3 <kvsprintf+0x1c>
ffffff0000103ab2:	49 ff c7             	inc    %r15
ffffff0000103ab5:	48 ff c0             	inc    %rax
ffffff0000103ab8:	41 88 57 ff          	mov    %dl,-0x1(%r15)
ffffff0000103abc:	eb ea                	jmp    ffffff0000103aa8 <kvsprintf+0x2f1>
ffffff0000103abe:	41 c6 07 00          	movb   $0x0,(%r15)
ffffff0000103ac2:	4c 89 f8             	mov    %r15,%rax
ffffff0000103ac5:	48 2b 44 24 08       	sub    0x8(%rsp),%rax
ffffff0000103aca:	48 83 c4 38          	add    $0x38,%rsp
ffffff0000103ace:	5b                   	pop    %rbx
ffffff0000103acf:	5d                   	pop    %rbp
ffffff0000103ad0:	41 5c                	pop    %r12
ffffff0000103ad2:	41 5d                	pop    %r13
ffffff0000103ad4:	41 5e                	pop    %r14
ffffff0000103ad6:	41 5f                	pop    %r15
ffffff0000103ad8:	c3                   	retq   

ffffff0000103ad9 <ksprintf>:
ffffff0000103ad9:	48 81 ec d8 00 00 00 	sub    $0xd8,%rsp
ffffff0000103ae0:	84 c0                	test   %al,%al
ffffff0000103ae2:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
ffffff0000103ae7:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
ffffff0000103aec:	4c 89 44 24 40       	mov    %r8,0x40(%rsp)
ffffff0000103af1:	4c 89 4c 24 48       	mov    %r9,0x48(%rsp)
ffffff0000103af6:	74 37                	je     ffffff0000103b2f <ksprintf+0x56>
ffffff0000103af8:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
ffffff0000103afd:	0f 29 4c 24 60       	movaps %xmm1,0x60(%rsp)
ffffff0000103b02:	0f 29 54 24 70       	movaps %xmm2,0x70(%rsp)
ffffff0000103b07:	0f 29 9c 24 80 00 00 	movaps %xmm3,0x80(%rsp)
ffffff0000103b0e:	00 
ffffff0000103b0f:	0f 29 a4 24 90 00 00 	movaps %xmm4,0x90(%rsp)
ffffff0000103b16:	00 
ffffff0000103b17:	0f 29 ac 24 a0 00 00 	movaps %xmm5,0xa0(%rsp)
ffffff0000103b1e:	00 
ffffff0000103b1f:	0f 29 b4 24 b0 00 00 	movaps %xmm6,0xb0(%rsp)
ffffff0000103b26:	00 
ffffff0000103b27:	0f 29 bc 24 c0 00 00 	movaps %xmm7,0xc0(%rsp)
ffffff0000103b2e:	00 
ffffff0000103b2f:	48 8d 84 24 e0 00 00 	lea    0xe0(%rsp),%rax
ffffff0000103b36:	00 
ffffff0000103b37:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
ffffff0000103b3c:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
ffffff0000103b41:	48 8d 44 24 20       	lea    0x20(%rsp),%rax
ffffff0000103b46:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%rsp)
ffffff0000103b4d:	00 
ffffff0000103b4e:	c7 44 24 0c 30 00 00 	movl   $0x30,0xc(%rsp)
ffffff0000103b55:	00 
ffffff0000103b56:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
ffffff0000103b5b:	48 b8 b7 37 10 00 00 	movabs $0xffffff00001037b7,%rax
ffffff0000103b62:	ff ff ff 
ffffff0000103b65:	ff d0                	callq  *%rax
ffffff0000103b67:	48 81 c4 d8 00 00 00 	add    $0xd8,%rsp
ffffff0000103b6e:	c3                   	retq   

ffffff0000103b6f <kuitoa_reverse>:
ffffff0000103b6f:	41 89 d1             	mov    %edx,%r9d
ffffff0000103b72:	49 ba 78 51 10 00 00 	movabs $0xffffff0000105178,%r10
ffffff0000103b79:	ff ff ff 
ffffff0000103b7c:	89 f8                	mov    %edi,%eax
ffffff0000103b7e:	31 d2                	xor    %edx,%edx
ffffff0000103b80:	48 8d 4e 01          	lea    0x1(%rsi),%rcx
ffffff0000103b84:	41 f7 f1             	div    %r9d
ffffff0000103b87:	41 89 d0             	mov    %edx,%r8d
ffffff0000103b8a:	85 c0                	test   %eax,%eax
ffffff0000103b8c:	89 c7                	mov    %eax,%edi
ffffff0000103b8e:	43 8a 14 02          	mov    (%r10,%r8,1),%dl
ffffff0000103b92:	88 51 ff             	mov    %dl,-0x1(%rcx)
ffffff0000103b95:	74 05                	je     ffffff0000103b9c <kuitoa_reverse+0x2d>
ffffff0000103b97:	48 89 ce             	mov    %rcx,%rsi
ffffff0000103b9a:	eb e0                	jmp    ffffff0000103b7c <kuitoa_reverse+0xd>
ffffff0000103b9c:	c6 46 01 00          	movb   $0x0,0x1(%rsi)
ffffff0000103ba0:	48 89 c8             	mov    %rcx,%rax
ffffff0000103ba3:	c3                   	retq   

ffffff0000103ba4 <kuitoa>:
ffffff0000103ba4:	53                   	push   %rbx
ffffff0000103ba5:	48 b8 6f 3b 10 00 00 	movabs $0xffffff0000103b6f,%rax
ffffff0000103bac:	ff ff ff 
ffffff0000103baf:	48 89 f3             	mov    %rsi,%rbx
ffffff0000103bb2:	ff d0                	callq  *%rax
ffffff0000103bb4:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffffff0000103bb8:	48 89 d9             	mov    %rbx,%rcx
ffffff0000103bbb:	48 39 ca             	cmp    %rcx,%rdx
ffffff0000103bbe:	76 14                	jbe    ffffff0000103bd4 <kuitoa+0x30>
ffffff0000103bc0:	8a 01                	mov    (%rcx),%al
ffffff0000103bc2:	40 8a 32             	mov    (%rdx),%sil
ffffff0000103bc5:	48 ff c1             	inc    %rcx
ffffff0000103bc8:	48 ff ca             	dec    %rdx
ffffff0000103bcb:	40 88 71 ff          	mov    %sil,-0x1(%rcx)
ffffff0000103bcf:	88 42 01             	mov    %al,0x1(%rdx)
ffffff0000103bd2:	eb e7                	jmp    ffffff0000103bbb <kuitoa+0x17>
ffffff0000103bd4:	48 89 d8             	mov    %rbx,%rax
ffffff0000103bd7:	5b                   	pop    %rbx
ffffff0000103bd8:	c3                   	retq   

ffffff0000103bd9 <kitoa>:
ffffff0000103bd9:	83 fa 0a             	cmp    $0xa,%edx
ffffff0000103bdc:	48 b8 a4 3b 10 00 00 	movabs $0xffffff0000103ba4,%rax
ffffff0000103be3:	ff ff ff 
ffffff0000103be6:	75 07                	jne    ffffff0000103bef <kitoa+0x16>
ffffff0000103be8:	89 f9                	mov    %edi,%ecx
ffffff0000103bea:	c1 e9 1f             	shr    $0x1f,%ecx
ffffff0000103bed:	75 02                	jne    ffffff0000103bf1 <kitoa+0x18>
ffffff0000103bef:	ff e0                	jmpq   *%rax
ffffff0000103bf1:	c6 06 2d             	movb   $0x2d,(%rsi)
ffffff0000103bf4:	f7 df                	neg    %edi
ffffff0000103bf6:	48 ff c6             	inc    %rsi
ffffff0000103bf9:	ba 0a 00 00 00       	mov    $0xa,%edx
ffffff0000103bfe:	ff d0                	callq  *%rax
ffffff0000103c00:	48 ff c8             	dec    %rax
ffffff0000103c03:	c3                   	retq   

ffffff0000103c04 <kulltoa_reverse>:
ffffff0000103c04:	89 d1                	mov    %edx,%ecx
ffffff0000103c06:	49 b9 78 51 10 00 00 	movabs $0xffffff0000105178,%r9
ffffff0000103c0d:	ff ff ff 
ffffff0000103c10:	48 89 f8             	mov    %rdi,%rax
ffffff0000103c13:	31 d2                	xor    %edx,%edx
ffffff0000103c15:	4c 8d 46 01          	lea    0x1(%rsi),%r8
ffffff0000103c19:	48 f7 f1             	div    %rcx
ffffff0000103c1c:	41 8a 14 11          	mov    (%r9,%rdx,1),%dl
ffffff0000103c20:	48 85 c0             	test   %rax,%rax
ffffff0000103c23:	48 89 c7             	mov    %rax,%rdi
ffffff0000103c26:	41 88 50 ff          	mov    %dl,-0x1(%r8)
ffffff0000103c2a:	74 05                	je     ffffff0000103c31 <kulltoa_reverse+0x2d>
ffffff0000103c2c:	4c 89 c6             	mov    %r8,%rsi
ffffff0000103c2f:	eb df                	jmp    ffffff0000103c10 <kulltoa_reverse+0xc>
ffffff0000103c31:	c6 46 01 00          	movb   $0x0,0x1(%rsi)
ffffff0000103c35:	4c 89 c0             	mov    %r8,%rax
ffffff0000103c38:	c3                   	retq   

ffffff0000103c39 <kulltoa>:
ffffff0000103c39:	53                   	push   %rbx
ffffff0000103c3a:	48 b8 04 3c 10 00 00 	movabs $0xffffff0000103c04,%rax
ffffff0000103c41:	ff ff ff 
ffffff0000103c44:	48 89 f3             	mov    %rsi,%rbx
ffffff0000103c47:	ff d0                	callq  *%rax
ffffff0000103c49:	48 8d 50 ff          	lea    -0x1(%rax),%rdx
ffffff0000103c4d:	48 89 d9             	mov    %rbx,%rcx
ffffff0000103c50:	48 39 ca             	cmp    %rcx,%rdx
ffffff0000103c53:	76 14                	jbe    ffffff0000103c69 <kulltoa+0x30>
ffffff0000103c55:	8a 01                	mov    (%rcx),%al
ffffff0000103c57:	40 8a 32             	mov    (%rdx),%sil
ffffff0000103c5a:	48 ff c1             	inc    %rcx
ffffff0000103c5d:	48 ff ca             	dec    %rdx
ffffff0000103c60:	40 88 71 ff          	mov    %sil,-0x1(%rcx)
ffffff0000103c64:	88 42 01             	mov    %al,0x1(%rdx)
ffffff0000103c67:	eb e7                	jmp    ffffff0000103c50 <kulltoa+0x17>
ffffff0000103c69:	48 89 d8             	mov    %rbx,%rax
ffffff0000103c6c:	5b                   	pop    %rbx
ffffff0000103c6d:	c3                   	retq   

ffffff0000103c6e <klltoa>:
ffffff0000103c6e:	83 fa 0a             	cmp    $0xa,%edx
ffffff0000103c71:	48 b8 39 3c 10 00 00 	movabs $0xffffff0000103c39,%rax
ffffff0000103c78:	ff ff ff 
ffffff0000103c7b:	75 09                	jne    ffffff0000103c86 <klltoa+0x18>
ffffff0000103c7d:	48 89 f9             	mov    %rdi,%rcx
ffffff0000103c80:	48 c1 e9 3f          	shr    $0x3f,%rcx
ffffff0000103c84:	75 02                	jne    ffffff0000103c88 <klltoa+0x1a>
ffffff0000103c86:	ff e0                	jmpq   *%rax
ffffff0000103c88:	c6 06 2d             	movb   $0x2d,(%rsi)
ffffff0000103c8b:	48 f7 df             	neg    %rdi
ffffff0000103c8e:	48 ff c6             	inc    %rsi
ffffff0000103c91:	ba 0a 00 00 00       	mov    $0xa,%edx
ffffff0000103c96:	ff d0                	callq  *%rax
ffffff0000103c98:	48 ff c8             	dec    %rax
ffffff0000103c9b:	c3                   	retq   
ffffff0000103c9c:	0f 1f 40 00          	nopl   0x0(%rax)

ffffff0000103ca0 <_ZN6x86_6414direct_restartEv>:
ffffff0000103ca0:	ba f9 0c 00 00       	mov    $0xcf9,%edx
ffffff0000103ca5:	ec                   	in     (%dx),%al
ffffff0000103ca6:	83 e0 f9             	and    $0xfffffff9,%eax
ffffff0000103ca9:	89 c1                	mov    %eax,%ecx
ffffff0000103cab:	83 c8 02             	or     $0x2,%eax
ffffff0000103cae:	ee                   	out    %al,(%dx)
ffffff0000103caf:	f3 90                	pause  
ffffff0000103cb1:	89 c8                	mov    %ecx,%eax
ffffff0000103cb3:	83 c8 06             	or     $0x6,%eax
ffffff0000103cb6:	ee                   	out    %al,(%dx)
ffffff0000103cb7:	f4                   	hlt    
ffffff0000103cb8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
ffffff0000103cbf:	00 

ffffff0000103cc0 <_ZN6x86_643pci11config_readEhhhh>:
ffffff0000103cc0:	89 c8                	mov    %ecx,%eax
ffffff0000103cc2:	0f b6 d2             	movzbl %dl,%edx
ffffff0000103cc5:	40 0f b6 f6          	movzbl %sil,%esi
ffffff0000103cc9:	25 fc 00 00 00       	and    $0xfc,%eax
ffffff0000103cce:	c1 e2 08             	shl    $0x8,%edx
ffffff0000103cd1:	c1 e6 0b             	shl    $0xb,%esi
ffffff0000103cd4:	0d 00 00 00 80       	or     $0x80000000,%eax
ffffff0000103cd9:	40 0f b6 ff          	movzbl %dil,%edi
ffffff0000103cdd:	09 d0                	or     %edx,%eax
ffffff0000103cdf:	c1 e7 10             	shl    $0x10,%edi
ffffff0000103ce2:	ba f8 0c 00 00       	mov    $0xcf8,%edx
ffffff0000103ce7:	09 f0                	or     %esi,%eax
ffffff0000103ce9:	09 f8                	or     %edi,%eax
ffffff0000103ceb:	ef                   	out    %eax,(%dx)
ffffff0000103cec:	b2 fc                	mov    $0xfc,%dl
ffffff0000103cee:	ed                   	in     (%dx),%eax
ffffff0000103cef:	c3                   	retq   

ffffff0000103cf0 <_ZNK6x86_644e8205printEPKc>:
ffffff0000103cf0:	41 57                	push   %r15
ffffff0000103cf2:	41 56                	push   %r14
ffffff0000103cf4:	31 c0                	xor    %eax,%eax
ffffff0000103cf6:	41 55                	push   %r13
ffffff0000103cf8:	41 54                	push   %r12
ffffff0000103cfa:	49 89 fd             	mov    %rdi,%r13
ffffff0000103cfd:	55                   	push   %rbp
ffffff0000103cfe:	53                   	push   %rbx
ffffff0000103cff:	48 bd e0 34 10 00 00 	movabs $0xffffff00001034e0,%rbp
ffffff0000103d06:	ff ff ff 
ffffff0000103d09:	48 83 ec 08          	sub    $0x8,%rsp
ffffff0000103d0d:	8b 17                	mov    (%rdi),%edx
ffffff0000103d0f:	48 bf f8 52 10 00 00 	movabs $0xffffff00001052f8,%rdi
ffffff0000103d16:	ff ff ff 
ffffff0000103d19:	ff d5                	callq  *%rbp
ffffff0000103d1b:	41 8b 45 00          	mov    0x0(%r13),%eax
ffffff0000103d1f:	85 c0                	test   %eax,%eax
ffffff0000103d21:	0f 84 b6 00 00 00    	je     ffffff0000103ddd <_ZNK6x86_644e8205printEPKc+0xed>
ffffff0000103d27:	49 8b 45 08          	mov    0x8(%r13),%rax
ffffff0000103d2b:	45 31 ff             	xor    %r15d,%r15d
ffffff0000103d2e:	31 db                	xor    %ebx,%ebx
ffffff0000103d30:	45 31 e4             	xor    %r12d,%r12d
ffffff0000103d33:	eb 15                	jmp    ffffff0000103d4a <_ZNK6x86_644e8205printEPKc+0x5a>
ffffff0000103d35:	0f 1f 00             	nopl   (%rax)
ffffff0000103d38:	41 8d 57 01          	lea    0x1(%r15),%edx
ffffff0000103d3c:	49 03 5e 08          	add    0x8(%r14),%rbx
ffffff0000103d40:	49 83 c7 01          	add    $0x1,%r15
ffffff0000103d44:	41 39 55 00          	cmp    %edx,0x0(%r13)
ffffff0000103d48:	76 66                	jbe    ffffff0000103db0 <_ZNK6x86_644e8205printEPKc+0xc0>
ffffff0000103d4a:	4f 8d 34 7f          	lea    (%r15,%r15,2),%r14
ffffff0000103d4e:	48 b9 98 52 10 00 00 	movabs $0xffffff0000105298,%rcx
ffffff0000103d55:	ff ff ff 
ffffff0000103d58:	49 c1 e6 03          	shl    $0x3,%r14
ffffff0000103d5c:	4c 01 f0             	add    %r14,%rax
ffffff0000103d5f:	8b 78 10             	mov    0x10(%rax),%edi
ffffff0000103d62:	8d 57 ff             	lea    -0x1(%rdi),%edx
ffffff0000103d65:	83 fa 03             	cmp    $0x3,%edx
ffffff0000103d68:	77 0e                	ja     ffffff0000103d78 <_ZNK6x86_644e8205printEPKc+0x88>
ffffff0000103d6a:	48 bf 60 53 10 00 00 	movabs $0xffffff0000105360,%rdi
ffffff0000103d71:	ff ff ff 
ffffff0000103d74:	48 8b 0c d7          	mov    (%rdi,%rdx,8),%rcx
ffffff0000103d78:	48 8b 30             	mov    (%rax),%rsi
ffffff0000103d7b:	48 bf a1 52 10 00 00 	movabs $0xffffff00001052a1,%rdi
ffffff0000103d82:	ff ff ff 
ffffff0000103d85:	48 89 f2             	mov    %rsi,%rdx
ffffff0000103d88:	48 03 50 08          	add    0x8(%rax),%rdx
ffffff0000103d8c:	31 c0                	xor    %eax,%eax
ffffff0000103d8e:	ff d5                	callq  *%rbp
ffffff0000103d90:	49 8b 45 08          	mov    0x8(%r13),%rax
ffffff0000103d94:	49 01 c6             	add    %rax,%r14
ffffff0000103d97:	41 83 7e 10 01       	cmpl   $0x1,0x10(%r14)
ffffff0000103d9c:	75 9a                	jne    ffffff0000103d38 <_ZNK6x86_644e8205printEPKc+0x48>
ffffff0000103d9e:	41 8d 57 01          	lea    0x1(%r15),%edx
ffffff0000103da2:	4d 03 66 08          	add    0x8(%r14),%r12
ffffff0000103da6:	49 83 c7 01          	add    $0x1,%r15
ffffff0000103daa:	41 39 55 00          	cmp    %edx,0x0(%r13)
ffffff0000103dae:	77 9a                	ja     ffffff0000103d4a <_ZNK6x86_644e8205printEPKc+0x5a>
ffffff0000103db0:	48 c1 eb 0a          	shr    $0xa,%rbx
ffffff0000103db4:	4c 89 e6             	mov    %r12,%rsi
ffffff0000103db7:	48 89 da             	mov    %rbx,%rdx
ffffff0000103dba:	48 c1 ee 14          	shr    $0x14,%rsi
ffffff0000103dbe:	48 83 c4 08          	add    $0x8,%rsp
ffffff0000103dc2:	48 89 e9             	mov    %rbp,%rcx
ffffff0000103dc5:	48 bf 28 53 10 00 00 	movabs $0xffffff0000105328,%rdi
ffffff0000103dcc:	ff ff ff 
ffffff0000103dcf:	5b                   	pop    %rbx
ffffff0000103dd0:	5d                   	pop    %rbp
ffffff0000103dd1:	41 5c                	pop    %r12
ffffff0000103dd3:	41 5d                	pop    %r13
ffffff0000103dd5:	41 5e                	pop    %r14
ffffff0000103dd7:	41 5f                	pop    %r15
ffffff0000103dd9:	31 c0                	xor    %eax,%eax
ffffff0000103ddb:	ff e1                	jmpq   *%rcx
ffffff0000103ddd:	31 f6                	xor    %esi,%esi
ffffff0000103ddf:	31 d2                	xor    %edx,%edx
ffffff0000103de1:	eb db                	jmp    ffffff0000103dbe <_ZNK6x86_644e8205printEPKc+0xce>
ffffff0000103de3:	90                   	nop
ffffff0000103de4:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
ffffff0000103deb:	00 00 00 
ffffff0000103dee:	66 90                	xchg   %ax,%ax

ffffff0000103df0 <_memcpy>:
ffffff0000103df0:	48 89 f0             	mov    %rsi,%rax
ffffff0000103df3:	48 8d 0c 12          	lea    (%rdx,%rdx,1),%rcx
ffffff0000103df7:	48 29 f8             	sub    %rdi,%rax
ffffff0000103dfa:	48 29 d0             	sub    %rdx,%rax
ffffff0000103dfd:	48 39 c8             	cmp    %rcx,%rax
ffffff0000103e00:	0f 82 07 01 00 00    	jb     ffffff0000103f0d <_memcpy+0x11d>
ffffff0000103e06:	48 83 fa 10          	cmp    $0x10,%rdx
ffffff0000103e0a:	0f 86 8b 01 00 00    	jbe    ffffff0000103f9b <_memcpy+0x1ab>
ffffff0000103e10:	f3 44 0f 6f 06       	movdqu (%rsi),%xmm8
ffffff0000103e15:	48 83 fa 20          	cmp    $0x20,%rdx
ffffff0000103e19:	f3 44 0f 7f 07       	movdqu %xmm8,(%rdi)
ffffff0000103e1e:	f3 44 0f 6f 44 16 f0 	movdqu -0x10(%rsi,%rdx,1),%xmm8
ffffff0000103e25:	f3 44 0f 7f 44 17 f0 	movdqu %xmm8,-0x10(%rdi,%rdx,1)
ffffff0000103e2c:	77 12                	ja     ffffff0000103e40 <_memcpy+0x50>
ffffff0000103e2e:	48 89 f8             	mov    %rdi,%rax
ffffff0000103e31:	c3                   	retq   
ffffff0000103e32:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
ffffff0000103e39:	1f 84 00 00 00 00 00 
ffffff0000103e40:	f3 44 0f 6f 46 10    	movdqu 0x10(%rsi),%xmm8
ffffff0000103e46:	48 83 fa 40          	cmp    $0x40,%rdx
ffffff0000103e4a:	f3 44 0f 7f 47 10    	movdqu %xmm8,0x10(%rdi)
ffffff0000103e50:	f3 44 0f 6f 44 16 e0 	movdqu -0x20(%rsi,%rdx,1),%xmm8
ffffff0000103e57:	f3 44 0f 7f 44 17 e0 	movdqu %xmm8,-0x20(%rdi,%rdx,1)
ffffff0000103e5e:	76 ce                	jbe    ffffff0000103e2e <_memcpy+0x3e>
ffffff0000103e60:	f3 44 0f 6f 46 20    	movdqu 0x20(%rsi),%xmm8
ffffff0000103e66:	48 81 fa 80 00 00 00 	cmp    $0x80,%rdx
ffffff0000103e6d:	f3 44 0f 7f 47 20    	movdqu %xmm8,0x20(%rdi)
ffffff0000103e73:	f3 44 0f 6f 44 16 d0 	movdqu -0x30(%rsi,%rdx,1),%xmm8
ffffff0000103e7a:	f3 44 0f 7f 44 17 d0 	movdqu %xmm8,-0x30(%rdi,%rdx,1)
ffffff0000103e81:	f3 44 0f 6f 46 30    	movdqu 0x30(%rsi),%xmm8
ffffff0000103e87:	f3 44 0f 7f 47 30    	movdqu %xmm8,0x30(%rdi)
ffffff0000103e8d:	f3 44 0f 6f 44 16 c0 	movdqu -0x40(%rsi,%rdx,1),%xmm8
ffffff0000103e94:	f3 44 0f 7f 44 17 c0 	movdqu %xmm8,-0x40(%rdi,%rdx,1)
ffffff0000103e9b:	76 91                	jbe    ffffff0000103e2e <_memcpy+0x3e>
ffffff0000103e9d:	48 8d 4f 40          	lea    0x40(%rdi),%rcx
ffffff0000103ea1:	48 01 fa             	add    %rdi,%rdx
ffffff0000103ea4:	48 83 e2 c0          	and    $0xffffffffffffffc0,%rdx
ffffff0000103ea8:	48 83 e1 c0          	and    $0xffffffffffffffc0,%rcx
ffffff0000103eac:	48 89 c8             	mov    %rcx,%rax
ffffff0000103eaf:	48 29 f8             	sub    %rdi,%rax
ffffff0000103eb2:	48 01 c6             	add    %rax,%rsi
ffffff0000103eb5:	48 39 d1             	cmp    %rdx,%rcx
ffffff0000103eb8:	0f 84 70 ff ff ff    	je     ffffff0000103e2e <_memcpy+0x3e>
ffffff0000103ebe:	49 89 f2             	mov    %rsi,%r10
ffffff0000103ec1:	49 29 ca             	sub    %rcx,%r10
ffffff0000103ec4:	4d 8d 4a 10          	lea    0x10(%r10),%r9
ffffff0000103ec8:	4d 8d 42 20          	lea    0x20(%r10),%r8
ffffff0000103ecc:	49 8d 42 30          	lea    0x30(%r10),%rax
ffffff0000103ed0:	f3 46 0f 6f 04 11    	movdqu (%rcx,%r10,1),%xmm8
ffffff0000103ed6:	66 44 0f 7f 01       	movdqa %xmm8,(%rcx)
ffffff0000103edb:	f3 46 0f 6f 04 09    	movdqu (%rcx,%r9,1),%xmm8
ffffff0000103ee1:	66 44 0f 7f 41 10    	movdqa %xmm8,0x10(%rcx)
ffffff0000103ee7:	f3 46 0f 6f 04 01    	movdqu (%rcx,%r8,1),%xmm8
ffffff0000103eed:	66 44 0f 7f 41 20    	movdqa %xmm8,0x20(%rcx)
ffffff0000103ef3:	f3 44 0f 6f 04 01    	movdqu (%rcx,%rax,1),%xmm8
ffffff0000103ef9:	66 44 0f 7f 41 30    	movdqa %xmm8,0x30(%rcx)
ffffff0000103eff:	48 83 c1 40          	add    $0x40,%rcx
ffffff0000103f03:	48 39 ca             	cmp    %rcx,%rdx
ffffff0000103f06:	75 c8                	jne    ffffff0000103ed0 <_memcpy+0xe0>
ffffff0000103f08:	e9 21 ff ff ff       	jmpq   ffffff0000103e2e <_memcpy+0x3e>
ffffff0000103f0d:	48 39 f7             	cmp    %rsi,%rdi
ffffff0000103f10:	0f 83 b5 00 00 00    	jae    ffffff0000103fcb <_memcpy+0x1db>
ffffff0000103f16:	48 85 d2             	test   %rdx,%rdx
ffffff0000103f19:	0f 84 0f ff ff ff    	je     ffffff0000103e2e <_memcpy+0x3e>
ffffff0000103f1f:	49 89 d1             	mov    %rdx,%r9
ffffff0000103f22:	48 8d 4e 10          	lea    0x10(%rsi),%rcx
ffffff0000103f26:	4c 8d 47 10          	lea    0x10(%rdi),%r8
ffffff0000103f2a:	49 c1 e9 04          	shr    $0x4,%r9
ffffff0000103f2e:	4c 89 c8             	mov    %r9,%rax
ffffff0000103f31:	48 c1 e0 04          	shl    $0x4,%rax
ffffff0000103f35:	48 39 cf             	cmp    %rcx,%rdi
ffffff0000103f38:	0f 93 c1             	setae  %cl
ffffff0000103f3b:	4c 39 c6             	cmp    %r8,%rsi
ffffff0000103f3e:	41 0f 93 c0          	setae  %r8b
ffffff0000103f42:	44 09 c1             	or     %r8d,%ecx
ffffff0000103f45:	48 83 fa 0f          	cmp    $0xf,%rdx
ffffff0000103f49:	41 0f 97 c0          	seta   %r8b
ffffff0000103f4d:	44 84 c1             	test   %r8b,%cl
ffffff0000103f50:	0f 84 9c 00 00 00    	je     ffffff0000103ff2 <_memcpy+0x202>
ffffff0000103f56:	48 85 c0             	test   %rax,%rax
ffffff0000103f59:	0f 84 93 00 00 00    	je     ffffff0000103ff2 <_memcpy+0x202>
ffffff0000103f5f:	31 c9                	xor    %ecx,%ecx
ffffff0000103f61:	45 31 c0             	xor    %r8d,%r8d
ffffff0000103f64:	f3 44 0f 6f 04 0e    	movdqu (%rsi,%rcx,1),%xmm8
ffffff0000103f6a:	49 83 c0 01          	add    $0x1,%r8
ffffff0000103f6e:	f3 44 0f 7f 04 0f    	movdqu %xmm8,(%rdi,%rcx,1)
ffffff0000103f74:	48 83 c1 10          	add    $0x10,%rcx
ffffff0000103f78:	4d 39 c1             	cmp    %r8,%r9
ffffff0000103f7b:	77 e7                	ja     ffffff0000103f64 <_memcpy+0x174>
ffffff0000103f7d:	48 39 c2             	cmp    %rax,%rdx
ffffff0000103f80:	0f 84 a8 fe ff ff    	je     ffffff0000103e2e <_memcpy+0x3e>
ffffff0000103f86:	0f b6 0c 06          	movzbl (%rsi,%rax,1),%ecx
ffffff0000103f8a:	88 0c 07             	mov    %cl,(%rdi,%rax,1)
ffffff0000103f8d:	48 83 c0 01          	add    $0x1,%rax
ffffff0000103f91:	48 39 c2             	cmp    %rax,%rdx
ffffff0000103f94:	77 f0                	ja     ffffff0000103f86 <_memcpy+0x196>
ffffff0000103f96:	e9 93 fe ff ff       	jmpq   ffffff0000103e2e <_memcpy+0x3e>
ffffff0000103f9b:	f6 c2 18             	test   $0x18,%dl
ffffff0000103f9e:	75 3d                	jne    ffffff0000103fdd <_memcpy+0x1ed>
ffffff0000103fa0:	f6 c2 04             	test   $0x4,%dl
ffffff0000103fa3:	75 51                	jne    ffffff0000103ff6 <_memcpy+0x206>
ffffff0000103fa5:	48 85 d2             	test   %rdx,%rdx
ffffff0000103fa8:	0f 84 80 fe ff ff    	je     ffffff0000103e2e <_memcpy+0x3e>
ffffff0000103fae:	0f b6 06             	movzbl (%rsi),%eax
ffffff0000103fb1:	f6 c2 02             	test   $0x2,%dl
ffffff0000103fb4:	88 07                	mov    %al,(%rdi)
ffffff0000103fb6:	0f 84 72 fe ff ff    	je     ffffff0000103e2e <_memcpy+0x3e>
ffffff0000103fbc:	0f b7 44 16 fe       	movzwl -0x2(%rsi,%rdx,1),%eax
ffffff0000103fc1:	66 89 44 17 fe       	mov    %ax,-0x2(%rdi,%rdx,1)
ffffff0000103fc6:	e9 63 fe ff ff       	jmpq   ffffff0000103e2e <_memcpy+0x3e>
ffffff0000103fcb:	48 8d 42 ff          	lea    -0x1(%rdx),%rax
ffffff0000103fcf:	90                   	nop
ffffff0000103fd0:	0f b6 14 06          	movzbl (%rsi,%rax,1),%edx
ffffff0000103fd4:	88 14 07             	mov    %dl,(%rdi,%rax,1)
ffffff0000103fd7:	48 83 e8 01          	sub    $0x1,%rax
ffffff0000103fdb:	eb f3                	jmp    ffffff0000103fd0 <_memcpy+0x1e0>
ffffff0000103fdd:	48 8b 06             	mov    (%rsi),%rax
ffffff0000103fe0:	48 89 07             	mov    %rax,(%rdi)
ffffff0000103fe3:	48 8b 44 16 f8       	mov    -0x8(%rsi,%rdx,1),%rax
ffffff0000103fe8:	48 89 44 17 f8       	mov    %rax,-0x8(%rdi,%rdx,1)
ffffff0000103fed:	e9 3c fe ff ff       	jmpq   ffffff0000103e2e <_memcpy+0x3e>
ffffff0000103ff2:	31 c0                	xor    %eax,%eax
ffffff0000103ff4:	eb 90                	jmp    ffffff0000103f86 <_memcpy+0x196>
ffffff0000103ff6:	8b 06                	mov    (%rsi),%eax
ffffff0000103ff8:	89 07                	mov    %eax,(%rdi)
ffffff0000103ffa:	8b 44 16 fc          	mov    -0x4(%rsi,%rdx,1),%eax
ffffff0000103ffe:	89 44 17 fc          	mov    %eax,-0x4(%rdi,%rdx,1)
ffffff0000104002:	e9 27 fe ff ff       	jmpq   ffffff0000103e2e <_memcpy+0x3e>
ffffff0000104007:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
ffffff000010400e:	00 00 

ffffff0000104010 <_ZN6x86_646lowmem4initEv>:
ffffff0000104010:	48 a1 e8 55 10 00 00 	movabs 0xffffff00001055e8,%rax
ffffff0000104017:	ff ff ff 
ffffff000010401a:	31 c9                	xor    %ecx,%ecx
ffffff000010401c:	48 be 00 00 00 00 00 	movabs $0xffffff0000000000,%rsi
ffffff0000104023:	ff ff ff 
ffffff0000104026:	48 8d 50 10          	lea    0x10(%rax),%rdx
ffffff000010402a:	eb 12                	jmp    ffffff000010403e <_ZN6x86_646lowmem4initEv+0x2e>
ffffff000010402c:	0f 1f 40 00          	nopl   0x0(%rax)
ffffff0000104030:	48 83 c2 18          	add    $0x18,%rdx
ffffff0000104034:	48 81 7a f0 ff ff 0f 	cmpq   $0xfffff,-0x10(%rdx)
ffffff000010403b:	00 
ffffff000010403c:	77 2b                	ja     ffffff0000104069 <_ZN6x86_646lowmem4initEv+0x59>
ffffff000010403e:	83 3a 01             	cmpl   $0x1,(%rdx)
ffffff0000104041:	75 ed                	jne    ffffff0000104030 <_ZN6x86_646lowmem4initEv+0x20>
ffffff0000104043:	48 8b 4a f0          	mov    -0x10(%rdx),%rcx
ffffff0000104047:	48 83 c2 18          	add    $0x18,%rdx
ffffff000010404b:	48 89 c8             	mov    %rcx,%rax
ffffff000010404e:	48 03 42 e0          	add    -0x20(%rdx),%rax
ffffff0000104052:	48 01 f0             	add    %rsi,%rax
ffffff0000104055:	48 a3 20 56 10 00 00 	movabs %rax,0xffffff0000105620
ffffff000010405c:	ff ff ff 
ffffff000010405f:	48 81 7a f0 ff ff 0f 	cmpq   $0xfffff,-0x10(%rdx)
ffffff0000104066:	00 
ffffff0000104067:	76 d5                	jbe    ffffff000010403e <_ZN6x86_646lowmem4initEv+0x2e>
ffffff0000104069:	48 83 ec 08          	sub    $0x8,%rsp
ffffff000010406d:	48 b8 30 56 10 00 00 	movabs $0xffffff0000105630,%rax
ffffff0000104074:	ff ff ff 
ffffff0000104077:	48 8b 10             	mov    (%rax),%rdx
ffffff000010407a:	48 39 ca             	cmp    %rcx,%rdx
ffffff000010407d:	73 10                	jae    ffffff000010408f <_ZN6x86_646lowmem4initEv+0x7f>
ffffff000010407f:	48 89 c8             	mov    %rcx,%rax
ffffff0000104082:	48 89 ca             	mov    %rcx,%rdx
ffffff0000104085:	48 a3 30 56 10 00 00 	movabs %rax,0xffffff0000105630
ffffff000010408c:	ff ff ff 
ffffff000010408f:	48 89 d0             	mov    %rdx,%rax
ffffff0000104092:	31 f6                	xor    %esi,%esi
ffffff0000104094:	48 bf 00 56 10 00 00 	movabs $0xffffff0000105600,%rdi
ffffff000010409b:	ff ff ff 
ffffff000010409e:	48 a3 18 56 10 00 00 	movabs %rax,0xffffff0000105618
ffffff00001040a5:	ff ff ff 
ffffff00001040a8:	48 a1 20 56 10 00 00 	movabs 0xffffff0000105620,%rax
ffffff00001040af:	ff ff ff 
ffffff00001040b2:	48 05 ff ff 01 00    	add    $0x1ffff,%rax
ffffff00001040b8:	48 29 d0             	sub    %rdx,%rax
ffffff00001040bb:	48 25 00 00 fe ff    	and    $0xfffffffffffe0000,%rax
ffffff00001040c1:	48 c1 e8 05          	shr    $0x5,%rax
ffffff00001040c5:	48 01 d0             	add    %rdx,%rax
ffffff00001040c8:	ba 18 00 00 00       	mov    $0x18,%edx
ffffff00001040cd:	48 a3 28 56 10 00 00 	movabs %rax,0xffffff0000105628
ffffff00001040d4:	ff ff ff 
ffffff00001040d7:	48 b8 20 48 10 00 00 	movabs $0xffffff0000104820,%rax
ffffff00001040de:	ff ff ff 
ffffff00001040e1:	ff d0                	callq  *%rax
ffffff00001040e3:	48 b8 28 56 10 00 00 	movabs $0xffffff0000105628,%rax
ffffff00001040ea:	ff ff ff 
ffffff00001040ed:	48 bf 80 53 10 00 00 	movabs $0xffffff0000105380,%rdi
ffffff00001040f4:	ff ff ff 
ffffff00001040f7:	48 8b 08             	mov    (%rax),%rcx
ffffff00001040fa:	49 b8 e0 34 10 00 00 	movabs $0xffffff00001034e0,%r8
ffffff0000104101:	ff ff ff 
ffffff0000104104:	48 b8 20 56 10 00 00 	movabs $0xffffff0000105620,%rax
ffffff000010410b:	ff ff ff 
ffffff000010410e:	48 8b 10             	mov    (%rax),%rdx
ffffff0000104111:	48 b8 30 56 10 00 00 	movabs $0xffffff0000105630,%rax
ffffff0000104118:	ff ff ff 
ffffff000010411b:	48 8b 30             	mov    (%rax),%rsi
ffffff000010411e:	31 c0                	xor    %eax,%eax
ffffff0000104120:	48 83 c4 08          	add    $0x8,%rsp
ffffff0000104124:	41 ff e0             	jmpq   *%r8
ffffff0000104127:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
ffffff000010412e:	00 00 

ffffff0000104130 <_ZN6x86_646lowmem5allocEj>:
ffffff0000104130:	48 b8 18 56 10 00 00 	movabs $0xffffff0000105618,%rax
ffffff0000104137:	ff ff ff 
ffffff000010413a:	48 8b 10             	mov    (%rax),%rdx
ffffff000010413d:	89 ff                	mov    %edi,%edi
ffffff000010413f:	48 b9 28 56 10 00 00 	movabs $0xffffff0000105628,%rcx
ffffff0000104146:	ff ff ff 
ffffff0000104149:	48 8d 04 17          	lea    (%rdi,%rdx,1),%rax
ffffff000010414d:	48 3b 01             	cmp    (%rcx),%rax
ffffff0000104150:	77 0e                	ja     ffffff0000104160 <_ZN6x86_646lowmem5allocEj+0x30>
ffffff0000104152:	48 a3 18 56 10 00 00 	movabs %rax,0xffffff0000105618
ffffff0000104159:	ff ff ff 
ffffff000010415c:	48 89 d0             	mov    %rdx,%rax
ffffff000010415f:	c3                   	retq   
ffffff0000104160:	48 83 ec 08          	sub    $0x8,%rsp
ffffff0000104164:	31 c0                	xor    %eax,%eax
ffffff0000104166:	48 bf b8 53 10 00 00 	movabs $0xffffff00001053b8,%rdi
ffffff000010416d:	ff ff ff 
ffffff0000104170:	48 ba e0 34 10 00 00 	movabs $0xffffff00001034e0,%rdx
ffffff0000104177:	ff ff ff 
ffffff000010417a:	ff d2                	callq  *%rdx
ffffff000010417c:	31 c0                	xor    %eax,%eax
ffffff000010417e:	48 83 c4 08          	add    $0x8,%rsp
ffffff0000104182:	c3                   	retq   
ffffff0000104183:	66 66 66 66 2e 0f 1f 	data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
ffffff000010418a:	84 00 00 00 00 00 

ffffff0000104190 <_ZN6x86_646lowmem4freeEj>:
ffffff0000104190:	48 a1 18 56 10 00 00 	movabs 0xffffff0000105618,%rax
ffffff0000104197:	ff ff ff 
ffffff000010419a:	89 ff                	mov    %edi,%edi
ffffff000010419c:	48 ba 30 56 10 00 00 	movabs $0xffffff0000105630,%rdx
ffffff00001041a3:	ff ff ff 
ffffff00001041a6:	48 29 f8             	sub    %rdi,%rax
ffffff00001041a9:	48 3b 02             	cmp    (%rdx),%rax
ffffff00001041ac:	72 12                	jb     ffffff00001041c0 <_ZN6x86_646lowmem4freeEj+0x30>
ffffff00001041ae:	48 a3 18 56 10 00 00 	movabs %rax,0xffffff0000105618
ffffff00001041b5:	ff ff ff 
ffffff00001041b8:	c3                   	retq   
ffffff00001041b9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
ffffff00001041c0:	48 bf d6 53 10 00 00 	movabs $0xffffff00001053d6,%rdi
ffffff00001041c7:	ff ff ff 
ffffff00001041ca:	31 c0                	xor    %eax,%eax
ffffff00001041cc:	48 ba e0 34 10 00 00 	movabs $0xffffff00001034e0,%rdx
ffffff00001041d3:	ff ff ff 
ffffff00001041d6:	ff e2                	jmpq   *%rdx
ffffff00001041d8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
ffffff00001041df:	00 

ffffff00001041e0 <_ZN6x86_646lowmem12__alloc_pageEv>:
ffffff00001041e0:	31 d2                	xor    %edx,%edx
ffffff00001041e2:	49 b8 00 56 10 00 00 	movabs $0xffffff0000105600,%r8
ffffff00001041e9:	ff ff ff 
ffffff00001041ec:	48 c7 c7 ff ff ff ff 	mov    $0xffffffffffffffff,%rdi
ffffff00001041f3:	eb 07                	jmp    ffffff00001041fc <_ZN6x86_646lowmem12__alloc_pageEv+0x1c>
ffffff00001041f5:	0f 1f 00             	nopl   (%rax)
ffffff00001041f8:	48 83 c2 01          	add    $0x1,%rdx
ffffff00001041fc:	49 8b 04 d0          	mov    (%r8,%rdx,8),%rax
ffffff0000104200:	48 be 00 56 10 00 00 	movabs $0xffffff0000105600,%rsi
ffffff0000104207:	ff ff ff 
ffffff000010420a:	48 f7 d0             	not    %rax
ffffff000010420d:	48 0f bc c0          	bsf    %rax,%rax
ffffff0000104211:	48 0f 44 c7          	cmove  %rdi,%rax
ffffff0000104215:	48 83 c0 01          	add    $0x1,%rax
ffffff0000104219:	85 c0                	test   %eax,%eax
ffffff000010421b:	48 63 c8             	movslq %eax,%rcx
ffffff000010421e:	74 d8                	je     ffffff00001041f8 <_ZN6x86_646lowmem12__alloc_pageEv+0x18>
ffffff0000104220:	48 c1 e2 06          	shl    $0x6,%rdx
ffffff0000104224:	48 8d 44 11 ff       	lea    -0x1(%rcx,%rdx,1),%rax
ffffff0000104229:	48 3d bf 00 00 00    	cmp    $0xbf,%rax
ffffff000010422f:	77 30                	ja     ffffff0000104261 <_ZN6x86_646lowmem12__alloc_pageEv+0x81>
ffffff0000104231:	48 89 c1             	mov    %rax,%rcx
ffffff0000104234:	48 89 c7             	mov    %rax,%rdi
ffffff0000104237:	ba 01 00 00 00       	mov    $0x1,%edx
ffffff000010423c:	83 e1 3f             	and    $0x3f,%ecx
ffffff000010423f:	48 c1 ef 06          	shr    $0x6,%rdi
ffffff0000104243:	48 c1 e0 0c          	shl    $0xc,%rax
ffffff0000104247:	d3 e2                	shl    %cl,%edx
ffffff0000104249:	48 63 d2             	movslq %edx,%rdx
ffffff000010424c:	48 09 14 fe          	or     %rdx,(%rsi,%rdi,8)
ffffff0000104250:	48 be 28 56 10 00 00 	movabs $0xffffff0000105628,%rsi
ffffff0000104257:	ff ff ff 
ffffff000010425a:	48 8b 16             	mov    (%rsi),%rdx
ffffff000010425d:	48 01 d0             	add    %rdx,%rax
ffffff0000104260:	c3                   	retq   
ffffff0000104261:	31 c0                	xor    %eax,%eax
ffffff0000104263:	c3                   	retq   
ffffff0000104264:	66 66 66 2e 0f 1f 84 	data16 data16 nopw %cs:0x0(%rax,%rax,1)
ffffff000010426b:	00 00 00 00 00 

ffffff0000104270 <_ZN6x86_646lowmem13__alloc_pagesEj>:
ffffff0000104270:	41 57                	push   %r15
ffffff0000104272:	41 56                	push   %r14
ffffff0000104274:	49 be 00 56 10 00 00 	movabs $0xffffff0000105600,%r14
ffffff000010427b:	ff ff ff 
ffffff000010427e:	41 55                	push   %r13
ffffff0000104280:	41 54                	push   %r12
ffffff0000104282:	55                   	push   %rbp
ffffff0000104283:	31 ed                	xor    %ebp,%ebp
ffffff0000104285:	83 ff 01             	cmp    $0x1,%edi
ffffff0000104288:	53                   	push   %rbx
ffffff0000104289:	0f 84 ec 01 00 00    	je     ffffff000010447b <_ZN6x86_646lowmem13__alloc_pagesEj+0x20b>
ffffff000010428f:	49 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%r10
ffffff0000104296:	41 bf 01 00 00 00    	mov    $0x1,%r15d
ffffff000010429c:	89 ff                	mov    %edi,%edi
ffffff000010429e:	4d 8d 04 ee          	lea    (%r14,%rbp,8),%r8
ffffff00001042a2:	31 d2                	xor    %edx,%edx
ffffff00001042a4:	eb 0e                	jmp    ffffff00001042b4 <_ZN6x86_646lowmem13__alloc_pagesEj+0x44>
ffffff00001042a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
ffffff00001042ad:	00 00 00 
ffffff00001042b0:	48 83 c2 01          	add    $0x1,%rdx
ffffff00001042b4:	49 8b 0c d0          	mov    (%r8,%rdx,8),%rcx
ffffff00001042b8:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
ffffff00001042bf:	48 f7 d1             	not    %rcx
ffffff00001042c2:	48 0f bc c9          	bsf    %rcx,%rcx
ffffff00001042c6:	49 0f 44 ca          	cmove  %r10,%rcx
ffffff00001042ca:	48 83 c1 01          	add    $0x1,%rcx
ffffff00001042ce:	85 c9                	test   %ecx,%ecx
ffffff00001042d0:	48 63 f1             	movslq %ecx,%rsi
ffffff00001042d3:	74 db                	je     ffffff00001042b0 <_ZN6x86_646lowmem13__alloc_pagesEj+0x40>
ffffff00001042d5:	48 c1 e2 06          	shl    $0x6,%rdx
ffffff00001042d9:	48 01 f2             	add    %rsi,%rdx
ffffff00001042dc:	48 8d 1c 02          	lea    (%rdx,%rax,1),%rbx
ffffff00001042e0:	48 81 fb bf 00 00 00 	cmp    $0xbf,%rbx
ffffff00001042e7:	0f 87 a4 01 00 00    	ja     ffffff0000104491 <_ZN6x86_646lowmem13__alloc_pagesEj+0x221>
ffffff00001042ed:	49 89 d9             	mov    %rbx,%r9
ffffff00001042f0:	48 89 d9             	mov    %rbx,%rcx
ffffff00001042f3:	44 89 fe             	mov    %r15d,%esi
ffffff00001042f6:	49 c1 e9 06          	shr    $0x6,%r9
ffffff00001042fa:	83 e1 3f             	and    $0x3f,%ecx
ffffff00001042fd:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
ffffff0000104304:	4f 8d 2c c8          	lea    (%r8,%r9,8),%r13
ffffff0000104308:	d3 e6                	shl    %cl,%esi
ffffff000010430a:	89 4c 24 fc          	mov    %ecx,-0x4(%rsp)
ffffff000010430e:	48 63 f6             	movslq %esi,%rsi
ffffff0000104311:	4d 8b 65 00          	mov    0x0(%r13),%r12
ffffff0000104315:	4c 21 e6             	and    %r12,%rsi
ffffff0000104318:	48 0f bc f6          	bsf    %rsi,%rsi
ffffff000010431c:	49 0f 44 f3          	cmove  %r11,%rsi
ffffff0000104320:	48 83 c6 01          	add    $0x1,%rsi
ffffff0000104324:	85 f6                	test   %esi,%esi
ffffff0000104326:	0f 84 0c 01 00 00    	je     ffffff0000104438 <_ZN6x86_646lowmem13__alloc_pagesEj+0x1c8>
ffffff000010432c:	48 f7 d1             	not    %rcx
ffffff000010432f:	48 63 f6             	movslq %esi,%rsi
ffffff0000104332:	48 01 ce             	add    %rcx,%rsi
ffffff0000104335:	48 39 fe             	cmp    %rdi,%rsi
ffffff0000104338:	0f 83 dd 01 00 00    	jae    ffffff000010451b <_ZN6x86_646lowmem13__alloc_pagesEj+0x2ab>
ffffff000010433e:	48 85 ff             	test   %rdi,%rdi
ffffff0000104341:	49 8d 49 01          	lea    0x1(%r9),%rcx
ffffff0000104345:	74 49                	je     ffffff0000104390 <_ZN6x86_646lowmem13__alloc_pagesEj+0x120>
ffffff0000104347:	31 f6                	xor    %esi,%esi
ffffff0000104349:	eb 12                	jmp    ffffff000010435d <_ZN6x86_646lowmem13__alloc_pagesEj+0xed>
ffffff000010434b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
ffffff0000104350:	48 83 c6 40          	add    $0x40,%rsi
ffffff0000104354:	48 83 c1 01          	add    $0x1,%rcx
ffffff0000104358:	48 39 fe             	cmp    %rdi,%rsi
ffffff000010435b:	73 33                	jae    ffffff0000104390 <_ZN6x86_646lowmem13__alloc_pagesEj+0x120>
ffffff000010435d:	49 0f bc 04 c8       	bsf    (%r8,%rcx,8),%rax
ffffff0000104362:	49 c7 c3 ff ff ff ff 	mov    $0xffffffffffffffff,%r11
ffffff0000104369:	49 0f 44 c2          	cmove  %r10,%rax
ffffff000010436d:	48 83 c0 01          	add    $0x1,%rax
ffffff0000104371:	85 c0                	test   %eax,%eax
ffffff0000104373:	4c 63 c8             	movslq %eax,%r9
ffffff0000104376:	74 d8                	je     ffffff0000104350 <_ZN6x86_646lowmem13__alloc_pagesEj+0xe0>
ffffff0000104378:	4a 8d 44 0e ff       	lea    -0x1(%rsi,%r9,1),%rax
ffffff000010437d:	48 39 f8             	cmp    %rdi,%rax
ffffff0000104380:	0f 83 1b 02 00 00    	jae    ffffff00001045a1 <_ZN6x86_646lowmem13__alloc_pagesEj+0x331>
ffffff0000104386:	48 8d 6c 0d 01       	lea    0x1(%rbp,%rcx,1),%rbp
ffffff000010438b:	e9 0e ff ff ff       	jmpq   ffffff000010429e <_ZN6x86_646lowmem13__alloc_pagesEj+0x2e>
ffffff0000104390:	48 01 df             	add    %rbx,%rdi
ffffff0000104393:	48 83 c2 3e          	add    $0x3e,%rdx
ffffff0000104397:	48 89 f8             	mov    %rdi,%rax
ffffff000010439a:	48 83 e2 c0          	and    $0xffffffffffffffc0,%rdx
ffffff000010439e:	48 83 e0 c0          	and    $0xffffffffffffffc0,%rax
ffffff00001043a2:	48 39 c2             	cmp    %rax,%rdx
ffffff00001043a5:	0f 87 a5 00 00 00    	ja     ffffff0000104450 <_ZN6x86_646lowmem13__alloc_pagesEj+0x1e0>
ffffff00001043ab:	48 39 d3             	cmp    %rdx,%rbx
ffffff00001043ae:	73 16                	jae    ffffff00001043c6 <_ZN6x86_646lowmem13__alloc_pagesEj+0x156>
ffffff00001043b0:	0f b6 4c 24 fc       	movzbl -0x4(%rsp),%ecx
ffffff00001043b5:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
ffffff00001043bc:	48 d3 e6             	shl    %cl,%rsi
ffffff00001043bf:	49 09 f4             	or     %rsi,%r12
ffffff00001043c2:	4d 89 65 00          	mov    %r12,0x0(%r13)
ffffff00001043c6:	48 39 c7             	cmp    %rax,%rdi
ffffff00001043c9:	76 1f                	jbe    ffffff00001043ea <_ZN6x86_646lowmem13__alloc_pagesEj+0x17a>
ffffff00001043cb:	49 89 c1             	mov    %rax,%r9
ffffff00001043ce:	83 e7 3f             	and    $0x3f,%edi
ffffff00001043d1:	b9 40 00 00 00       	mov    $0x40,%ecx
ffffff00001043d6:	49 c1 e9 03          	shr    $0x3,%r9
ffffff00001043da:	29 f9                	sub    %edi,%ecx
ffffff00001043dc:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
ffffff00001043e3:	48 d3 ee             	shr    %cl,%rsi
ffffff00001043e6:	4b 09 34 08          	or     %rsi,(%r8,%r9,1)
ffffff00001043ea:	48 39 c2             	cmp    %rax,%rdx
ffffff00001043ed:	73 22                	jae    ffffff0000104411 <_ZN6x86_646lowmem13__alloc_pagesEj+0x1a1>
ffffff00001043ef:	48 c1 ea 06          	shr    $0x6,%rdx
ffffff00001043f3:	48 c1 e8 06          	shr    $0x6,%rax
ffffff00001043f7:	48 39 c2             	cmp    %rax,%rdx
ffffff00001043fa:	73 15                	jae    ffffff0000104411 <_ZN6x86_646lowmem13__alloc_pagesEj+0x1a1>
ffffff00001043fc:	0f 1f 40 00          	nopl   0x0(%rax)
ffffff0000104400:	49 c7 04 d0 ff ff ff 	movq   $0xffffffffffffffff,(%r8,%rdx,8)
ffffff0000104407:	ff 
ffffff0000104408:	48 83 c2 01          	add    $0x1,%rdx
ffffff000010440c:	48 39 c2             	cmp    %rax,%rdx
ffffff000010440f:	75 ef                	jne    ffffff0000104400 <_ZN6x86_646lowmem13__alloc_pagesEj+0x190>
ffffff0000104411:	48 c1 e5 06          	shl    $0x6,%rbp
ffffff0000104415:	48 a1 28 56 10 00 00 	movabs 0xffffff0000105628,%rax
ffffff000010441c:	ff ff ff 
ffffff000010441f:	48 01 eb             	add    %rbp,%rbx
ffffff0000104422:	48 c1 e3 0c          	shl    $0xc,%rbx
ffffff0000104426:	48 01 d8             	add    %rbx,%rax
ffffff0000104429:	5b                   	pop    %rbx
ffffff000010442a:	5d                   	pop    %rbp
ffffff000010442b:	41 5c                	pop    %r12
ffffff000010442d:	41 5d                	pop    %r13
ffffff000010442f:	41 5e                	pop    %r14
ffffff0000104431:	41 5f                	pop    %r15
ffffff0000104433:	c3                   	retq   
ffffff0000104434:	0f 1f 40 00          	nopl   0x0(%rax)
ffffff0000104438:	be 3f 00 00 00       	mov    $0x3f,%esi
ffffff000010443d:	48 29 ce             	sub    %rcx,%rsi
ffffff0000104440:	48 39 fe             	cmp    %rdi,%rsi
ffffff0000104443:	73 50                	jae    ffffff0000104495 <_ZN6x86_646lowmem13__alloc_pagesEj+0x225>
ffffff0000104445:	49 8d 49 01          	lea    0x1(%r9),%rcx
ffffff0000104449:	e9 0f ff ff ff       	jmpq   ffffff000010435d <_ZN6x86_646lowmem13__alloc_pagesEj+0xed>
ffffff000010444e:	66 90                	xchg   %ax,%ax
ffffff0000104450:	83 e7 3f             	and    $0x3f,%edi
ffffff0000104453:	b9 40 00 00 00       	mov    $0x40,%ecx
ffffff0000104458:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
ffffff000010445f:	29 f9                	sub    %edi,%ecx
ffffff0000104461:	48 89 c2             	mov    %rax,%rdx
ffffff0000104464:	48 d3 ea             	shr    %cl,%rdx
ffffff0000104467:	0f b6 4c 24 fc       	movzbl -0x4(%rsp),%ecx
ffffff000010446c:	48 d3 e0             	shl    %cl,%rax
ffffff000010446f:	48 21 d0             	and    %rdx,%rax
ffffff0000104472:	49 09 c4             	or     %rax,%r12
ffffff0000104475:	4d 89 65 00          	mov    %r12,0x0(%r13)
ffffff0000104479:	eb 96                	jmp    ffffff0000104411 <_ZN6x86_646lowmem13__alloc_pagesEj+0x1a1>
ffffff000010447b:	5b                   	pop    %rbx
ffffff000010447c:	5d                   	pop    %rbp
ffffff000010447d:	41 5c                	pop    %r12
ffffff000010447f:	41 5d                	pop    %r13
ffffff0000104481:	41 5e                	pop    %r14
ffffff0000104483:	41 5f                	pop    %r15
ffffff0000104485:	48 b8 e0 41 10 00 00 	movabs $0xffffff00001041e0,%rax
ffffff000010448c:	ff ff ff 
ffffff000010448f:	ff e0                	jmpq   *%rax
ffffff0000104491:	31 c0                	xor    %eax,%eax
ffffff0000104493:	eb 94                	jmp    ffffff0000104429 <_ZN6x86_646lowmem13__alloc_pagesEj+0x1b9>
ffffff0000104495:	48 01 df             	add    %rbx,%rdi
ffffff0000104498:	48 83 c2 3e          	add    $0x3e,%rdx
ffffff000010449c:	48 89 fe             	mov    %rdi,%rsi
ffffff000010449f:	48 83 e2 c0          	and    $0xffffffffffffffc0,%rdx
ffffff00001044a3:	48 83 e6 c0          	and    $0xffffffffffffffc0,%rsi
ffffff00001044a7:	48 39 f2             	cmp    %rsi,%rdx
ffffff00001044aa:	0f 87 70 01 00 00    	ja     ffffff0000104620 <_ZN6x86_646lowmem13__alloc_pagesEj+0x3b0>
ffffff00001044b0:	48 39 da             	cmp    %rbx,%rdx
ffffff00001044b3:	76 0f                	jbe    ffffff00001044c4 <_ZN6x86_646lowmem13__alloc_pagesEj+0x254>
ffffff00001044b5:	0f b6 4c 24 fc       	movzbl -0x4(%rsp),%ecx
ffffff00001044ba:	48 d3 e0             	shl    %cl,%rax
ffffff00001044bd:	49 09 c4             	or     %rax,%r12
ffffff00001044c0:	4d 89 65 00          	mov    %r12,0x0(%r13)
ffffff00001044c4:	48 39 f7             	cmp    %rsi,%rdi
ffffff00001044c7:	76 1f                	jbe    ffffff00001044e8 <_ZN6x86_646lowmem13__alloc_pagesEj+0x278>
ffffff00001044c9:	49 89 f1             	mov    %rsi,%r9
ffffff00001044cc:	83 e7 3f             	and    $0x3f,%edi
ffffff00001044cf:	b9 40 00 00 00       	mov    $0x40,%ecx
ffffff00001044d4:	49 c1 e9 03          	shr    $0x3,%r9
ffffff00001044d8:	29 f9                	sub    %edi,%ecx
ffffff00001044da:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
ffffff00001044e1:	48 d3 e8             	shr    %cl,%rax
ffffff00001044e4:	4b 09 04 08          	or     %rax,(%r8,%r9,1)
ffffff00001044e8:	48 39 f2             	cmp    %rsi,%rdx
ffffff00001044eb:	0f 83 20 ff ff ff    	jae    ffffff0000104411 <_ZN6x86_646lowmem13__alloc_pagesEj+0x1a1>
ffffff00001044f1:	48 89 d0             	mov    %rdx,%rax
ffffff00001044f4:	48 c1 ee 06          	shr    $0x6,%rsi
ffffff00001044f8:	48 c1 e8 06          	shr    $0x6,%rax
ffffff00001044fc:	48 39 f0             	cmp    %rsi,%rax
ffffff00001044ff:	0f 83 0c ff ff ff    	jae    ffffff0000104411 <_ZN6x86_646lowmem13__alloc_pagesEj+0x1a1>
ffffff0000104505:	49 c7 04 c0 ff ff ff 	movq   $0xffffffffffffffff,(%r8,%rax,8)
ffffff000010450c:	ff 
ffffff000010450d:	48 83 c0 01          	add    $0x1,%rax
ffffff0000104511:	48 39 f0             	cmp    %rsi,%rax
ffffff0000104514:	75 ef                	jne    ffffff0000104505 <_ZN6x86_646lowmem13__alloc_pagesEj+0x295>
ffffff0000104516:	e9 f6 fe ff ff       	jmpq   ffffff0000104411 <_ZN6x86_646lowmem13__alloc_pagesEj+0x1a1>
ffffff000010451b:	48 01 df             	add    %rbx,%rdi
ffffff000010451e:	48 83 c2 3e          	add    $0x3e,%rdx
ffffff0000104522:	48 89 fe             	mov    %rdi,%rsi
ffffff0000104525:	48 83 e2 c0          	and    $0xffffffffffffffc0,%rdx
ffffff0000104529:	48 83 e6 c0          	and    $0xffffffffffffffc0,%rsi
ffffff000010452d:	48 39 f2             	cmp    %rsi,%rdx
ffffff0000104530:	0f 87 ea 00 00 00    	ja     ffffff0000104620 <_ZN6x86_646lowmem13__alloc_pagesEj+0x3b0>
ffffff0000104536:	48 39 da             	cmp    %rbx,%rdx
ffffff0000104539:	76 0f                	jbe    ffffff000010454a <_ZN6x86_646lowmem13__alloc_pagesEj+0x2da>
ffffff000010453b:	0f b6 4c 24 fc       	movzbl -0x4(%rsp),%ecx
ffffff0000104540:	48 d3 e0             	shl    %cl,%rax
ffffff0000104543:	49 09 c4             	or     %rax,%r12
ffffff0000104546:	4d 89 65 00          	mov    %r12,0x0(%r13)
ffffff000010454a:	48 39 f7             	cmp    %rsi,%rdi
ffffff000010454d:	76 1f                	jbe    ffffff000010456e <_ZN6x86_646lowmem13__alloc_pagesEj+0x2fe>
ffffff000010454f:	49 89 f1             	mov    %rsi,%r9
ffffff0000104552:	83 e7 3f             	and    $0x3f,%edi
ffffff0000104555:	b9 40 00 00 00       	mov    $0x40,%ecx
ffffff000010455a:	49 c1 e9 03          	shr    $0x3,%r9
ffffff000010455e:	29 f9                	sub    %edi,%ecx
ffffff0000104560:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
ffffff0000104567:	48 d3 e8             	shr    %cl,%rax
ffffff000010456a:	4b 09 04 08          	or     %rax,(%r8,%r9,1)
ffffff000010456e:	48 39 f2             	cmp    %rsi,%rdx
ffffff0000104571:	0f 83 9a fe ff ff    	jae    ffffff0000104411 <_ZN6x86_646lowmem13__alloc_pagesEj+0x1a1>
ffffff0000104577:	48 89 d0             	mov    %rdx,%rax
ffffff000010457a:	48 c1 ee 06          	shr    $0x6,%rsi
ffffff000010457e:	48 c1 e8 06          	shr    $0x6,%rax
ffffff0000104582:	48 39 f0             	cmp    %rsi,%rax
ffffff0000104585:	0f 83 86 fe ff ff    	jae    ffffff0000104411 <_ZN6x86_646lowmem13__alloc_pagesEj+0x1a1>
ffffff000010458b:	49 c7 04 c0 ff ff ff 	movq   $0xffffffffffffffff,(%r8,%rax,8)
ffffff0000104592:	ff 
ffffff0000104593:	48 83 c0 01          	add    $0x1,%rax
ffffff0000104597:	48 39 f0             	cmp    %rsi,%rax
ffffff000010459a:	75 ef                	jne    ffffff000010458b <_ZN6x86_646lowmem13__alloc_pagesEj+0x31b>
ffffff000010459c:	e9 70 fe ff ff       	jmpq   ffffff0000104411 <_ZN6x86_646lowmem13__alloc_pagesEj+0x1a1>
ffffff00001045a1:	48 01 df             	add    %rbx,%rdi
ffffff00001045a4:	48 8d 42 3e          	lea    0x3e(%rdx),%rax
ffffff00001045a8:	48 89 fa             	mov    %rdi,%rdx
ffffff00001045ab:	48 83 e0 c0          	and    $0xffffffffffffffc0,%rax
ffffff00001045af:	48 83 e2 c0          	and    $0xffffffffffffffc0,%rdx
ffffff00001045b3:	48 39 d0             	cmp    %rdx,%rax
ffffff00001045b6:	77 77                	ja     ffffff000010462f <_ZN6x86_646lowmem13__alloc_pagesEj+0x3bf>
ffffff00001045b8:	48 39 c3             	cmp    %rax,%rbx
ffffff00001045bb:	73 0f                	jae    ffffff00001045cc <_ZN6x86_646lowmem13__alloc_pagesEj+0x35c>
ffffff00001045bd:	0f b6 4c 24 fc       	movzbl -0x4(%rsp),%ecx
ffffff00001045c2:	49 d3 e3             	shl    %cl,%r11
ffffff00001045c5:	4d 09 dc             	or     %r11,%r12
ffffff00001045c8:	4d 89 65 00          	mov    %r12,0x0(%r13)
ffffff00001045cc:	48 39 d7             	cmp    %rdx,%rdi
ffffff00001045cf:	76 1f                	jbe    ffffff00001045f0 <_ZN6x86_646lowmem13__alloc_pagesEj+0x380>
ffffff00001045d1:	49 89 d1             	mov    %rdx,%r9
ffffff00001045d4:	83 e7 3f             	and    $0x3f,%edi
ffffff00001045d7:	b9 40 00 00 00       	mov    $0x40,%ecx
ffffff00001045dc:	49 c1 e9 03          	shr    $0x3,%r9
ffffff00001045e0:	29 f9                	sub    %edi,%ecx
ffffff00001045e2:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
ffffff00001045e9:	48 d3 ee             	shr    %cl,%rsi
ffffff00001045ec:	4b 09 34 08          	or     %rsi,(%r8,%r9,1)
ffffff00001045f0:	48 39 d0             	cmp    %rdx,%rax
ffffff00001045f3:	0f 83 18 fe ff ff    	jae    ffffff0000104411 <_ZN6x86_646lowmem13__alloc_pagesEj+0x1a1>
ffffff00001045f9:	48 c1 e8 06          	shr    $0x6,%rax
ffffff00001045fd:	48 c1 ea 06          	shr    $0x6,%rdx
ffffff0000104601:	48 39 d0             	cmp    %rdx,%rax
ffffff0000104604:	0f 83 07 fe ff ff    	jae    ffffff0000104411 <_ZN6x86_646lowmem13__alloc_pagesEj+0x1a1>
ffffff000010460a:	49 c7 04 c0 ff ff ff 	movq   $0xffffffffffffffff,(%r8,%rax,8)
ffffff0000104611:	ff 
ffffff0000104612:	48 83 c0 01          	add    $0x1,%rax
ffffff0000104616:	48 39 d0             	cmp    %rdx,%rax
ffffff0000104619:	75 ef                	jne    ffffff000010460a <_ZN6x86_646lowmem13__alloc_pagesEj+0x39a>
ffffff000010461b:	e9 f1 fd ff ff       	jmpq   ffffff0000104411 <_ZN6x86_646lowmem13__alloc_pagesEj+0x1a1>
ffffff0000104620:	83 e7 3f             	and    $0x3f,%edi
ffffff0000104623:	b9 40 00 00 00       	mov    $0x40,%ecx
ffffff0000104628:	29 f9                	sub    %edi,%ecx
ffffff000010462a:	e9 32 fe ff ff       	jmpq   ffffff0000104461 <_ZN6x86_646lowmem13__alloc_pagesEj+0x1f1>
ffffff000010462f:	83 e7 3f             	and    $0x3f,%edi
ffffff0000104632:	b9 40 00 00 00       	mov    $0x40,%ecx
ffffff0000104637:	4c 89 d8             	mov    %r11,%rax
ffffff000010463a:	29 f9                	sub    %edi,%ecx
ffffff000010463c:	48 d3 e8             	shr    %cl,%rax
ffffff000010463f:	0f b6 4c 24 fc       	movzbl -0x4(%rsp),%ecx
ffffff0000104644:	49 d3 e3             	shl    %cl,%r11
ffffff0000104647:	4c 21 d8             	and    %r11,%rax
ffffff000010464a:	49 09 c4             	or     %rax,%r12
ffffff000010464d:	4d 89 65 00          	mov    %r12,0x0(%r13)
ffffff0000104651:	e9 bb fd ff ff       	jmpq   ffffff0000104411 <_ZN6x86_646lowmem13__alloc_pagesEj+0x1a1>
ffffff0000104656:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
ffffff000010465d:	00 00 00 

ffffff0000104660 <_ZN6x86_646lowmem9free_pageEPv>:
ffffff0000104660:	48 b8 28 56 10 00 00 	movabs $0xffffff0000105628,%rax
ffffff0000104667:	ff ff ff 
ffffff000010466a:	48 81 e7 00 f0 ff ff 	and    $0xfffffffffffff000,%rdi
ffffff0000104671:	48 ba 00 56 10 00 00 	movabs $0xffffff0000105600,%rdx
ffffff0000104678:	ff ff ff 
ffffff000010467b:	48 2b 38             	sub    (%rax),%rdi
ffffff000010467e:	b8 01 00 00 00       	mov    $0x1,%eax
ffffff0000104683:	48 89 f9             	mov    %rdi,%rcx
ffffff0000104686:	48 c1 ef 12          	shr    $0x12,%rdi
ffffff000010468a:	48 c1 e9 0c          	shr    $0xc,%rcx
ffffff000010468e:	83 e1 3f             	and    $0x3f,%ecx
ffffff0000104691:	d3 e0                	shl    %cl,%eax
ffffff0000104693:	48 98                	cltq   
ffffff0000104695:	48 f7 d0             	not    %rax
ffffff0000104698:	48 21 04 fa          	and    %rax,(%rdx,%rdi,8)
ffffff000010469c:	c3                   	retq   
ffffff000010469d:	0f 1f 00             	nopl   (%rax)

ffffff00001046a0 <_ZN6x86_646lowmem10free_pagesEPvj>:
ffffff00001046a0:	48 b8 28 56 10 00 00 	movabs $0xffffff0000105628,%rax
ffffff00001046a7:	ff ff ff 
ffffff00001046aa:	48 81 e7 00 f0 ff ff 	and    $0xfffffffffffff000,%rdi
ffffff00001046b1:	89 f6                	mov    %esi,%esi
ffffff00001046b3:	48 2b 38             	sub    (%rax),%rdi
ffffff00001046b6:	49 89 f8             	mov    %rdi,%r8
ffffff00001046b9:	49 c1 e8 0c          	shr    $0xc,%r8
ffffff00001046bd:	4c 01 c6             	add    %r8,%rsi
ffffff00001046c0:	49 8d 40 3f          	lea    0x3f(%r8),%rax
ffffff00001046c4:	48 89 f2             	mov    %rsi,%rdx
ffffff00001046c7:	48 83 e0 c0          	and    $0xffffffffffffffc0,%rax
ffffff00001046cb:	48 83 e2 c0          	and    $0xffffffffffffffc0,%rdx
ffffff00001046cf:	48 39 d0             	cmp    %rdx,%rax
ffffff00001046d2:	0f 87 90 00 00 00    	ja     ffffff0000104768 <_ZN6x86_646lowmem10free_pagesEPvj+0xc8>
ffffff00001046d8:	49 39 c0             	cmp    %rax,%r8
ffffff00001046db:	73 28                	jae    ffffff0000104705 <_ZN6x86_646lowmem10free_pagesEPvj+0x65>
ffffff00001046dd:	41 83 e0 3f          	and    $0x3f,%r8d
ffffff00001046e1:	b9 40 00 00 00       	mov    $0x40,%ecx
ffffff00001046e6:	48 c1 ef 12          	shr    $0x12,%rdi
ffffff00001046ea:	44 29 c1             	sub    %r8d,%ecx
ffffff00001046ed:	49 b9 00 56 10 00 00 	movabs $0xffffff0000105600,%r9
ffffff00001046f4:	ff ff ff 
ffffff00001046f7:	49 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%r8
ffffff00001046fe:	49 d3 e8             	shr    %cl,%r8
ffffff0000104701:	4d 21 04 f9          	and    %r8,(%r9,%rdi,8)
ffffff0000104705:	48 39 d6             	cmp    %rdx,%rsi
ffffff0000104708:	76 25                	jbe    ffffff000010472f <_ZN6x86_646lowmem10free_pagesEPvj+0x8f>
ffffff000010470a:	48 89 f1             	mov    %rsi,%rcx
ffffff000010470d:	48 89 d7             	mov    %rdx,%rdi
ffffff0000104710:	49 b9 00 56 10 00 00 	movabs $0xffffff0000105600,%r9
ffffff0000104717:	ff ff ff 
ffffff000010471a:	48 c1 ef 03          	shr    $0x3,%rdi
ffffff000010471e:	83 e1 3f             	and    $0x3f,%ecx
ffffff0000104721:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
ffffff0000104728:	48 d3 e6             	shl    %cl,%rsi
ffffff000010472b:	49 21 34 39          	and    %rsi,(%r9,%rdi,1)
ffffff000010472f:	48 39 d0             	cmp    %rdx,%rax
ffffff0000104732:	73 2d                	jae    ffffff0000104761 <_ZN6x86_646lowmem10free_pagesEPvj+0xc1>
ffffff0000104734:	48 c1 e8 06          	shr    $0x6,%rax
ffffff0000104738:	48 c1 ea 06          	shr    $0x6,%rdx
ffffff000010473c:	48 39 d0             	cmp    %rdx,%rax
ffffff000010473f:	73 20                	jae    ffffff0000104761 <_ZN6x86_646lowmem10free_pagesEPvj+0xc1>
ffffff0000104741:	49 b9 00 56 10 00 00 	movabs $0xffffff0000105600,%r9
ffffff0000104748:	ff ff ff 
ffffff000010474b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
ffffff0000104750:	49 c7 04 c1 00 00 00 	movq   $0x0,(%r9,%rax,8)
ffffff0000104757:	00 
ffffff0000104758:	48 83 c0 01          	add    $0x1,%rax
ffffff000010475c:	48 39 d0             	cmp    %rdx,%rax
ffffff000010475f:	75 ef                	jne    ffffff0000104750 <_ZN6x86_646lowmem10free_pagesEPvj+0xb0>
ffffff0000104761:	f3 c3                	repz retq 
ffffff0000104763:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
ffffff0000104768:	41 83 e0 3f          	and    $0x3f,%r8d
ffffff000010476c:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
ffffff0000104773:	b9 40 00 00 00       	mov    $0x40,%ecx
ffffff0000104778:	44 29 c1             	sub    %r8d,%ecx
ffffff000010477b:	49 89 c0             	mov    %rax,%r8
ffffff000010477e:	48 c1 ef 12          	shr    $0x12,%rdi
ffffff0000104782:	49 d3 e8             	shr    %cl,%r8
ffffff0000104785:	48 89 f1             	mov    %rsi,%rcx
ffffff0000104788:	48 ba 00 56 10 00 00 	movabs $0xffffff0000105600,%rdx
ffffff000010478f:	ff ff ff 
ffffff0000104792:	83 e1 3f             	and    $0x3f,%ecx
ffffff0000104795:	48 d3 e0             	shl    %cl,%rax
ffffff0000104798:	4c 09 c0             	or     %r8,%rax
ffffff000010479b:	48 21 04 fa          	and    %rax,(%rdx,%rdi,8)
ffffff000010479f:	c3                   	retq   

ffffff00001047a0 <_ZN3lib13fifo_spinlock8try_lockEv>:
ffffff00001047a0:	8b 57 0c             	mov    0xc(%rdi),%edx
ffffff00001047a3:	8b 47 08             	mov    0x8(%rdi),%eax
ffffff00001047a6:	48 8d 4f 0c          	lea    0xc(%rdi),%rcx
ffffff00001047aa:	83 c2 01             	add    $0x1,%edx
ffffff00001047ad:	89 44 24 fc          	mov    %eax,-0x4(%rsp)
ffffff00001047b1:	f0 0f b1 11          	lock cmpxchg %edx,(%rcx)
ffffff00001047b5:	0f 94 c0             	sete   %al
ffffff00001047b8:	c3                   	retq   
ffffff00001047b9:	90                   	nop
ffffff00001047ba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

ffffff00001047c0 <_ZN3lib13fifo_spinlock6unlockEv>:
ffffff00001047c0:	f0 83 47 08 01       	lock addl $0x1,0x8(%rdi)
ffffff00001047c5:	c3                   	retq   
ffffff00001047c6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
ffffff00001047cd:	00 00 00 

ffffff00001047d0 <_ZN3lib13fifo_spinlock4lockEv>:
ffffff00001047d0:	ba 01 00 00 00       	mov    $0x1,%edx
ffffff00001047d5:	f0 0f c1 57 0c       	lock xadd %edx,0xc(%rdi)
ffffff00001047da:	48 83 c7 08          	add    $0x8,%rdi
ffffff00001047de:	eb 02                	jmp    ffffff00001047e2 <_ZN3lib13fifo_spinlock4lockEv+0x12>
ffffff00001047e0:	f3 90                	pause  
ffffff00001047e2:	8b 07                	mov    (%rdi),%eax
ffffff00001047e4:	39 d0                	cmp    %edx,%eax
ffffff00001047e6:	75 f8                	jne    ffffff00001047e0 <_ZN3lib13fifo_spinlock4lockEv+0x10>
ffffff00001047e8:	f3 c3                	repz retq 
ffffff00001047ea:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

ffffff00001047f0 <_GLOBAL__sub_I__ZN6x86_649data_lockE>:
ffffff00001047f0:	48 b8 20 57 10 00 00 	movabs $0xffffff0000105720,%rax
ffffff00001047f7:	ff ff ff 
ffffff00001047fa:	48 ba 50 54 10 00 00 	movabs $0xffffff0000105450,%rdx
ffffff0000104801:	ff ff ff 
ffffff0000104804:	48 89 10             	mov    %rdx,(%rax)
ffffff0000104807:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%rax)
ffffff000010480e:	c7 40 0c 00 00 00 00 	movl   $0x0,0xc(%rax)
ffffff0000104815:	c3                   	retq   
ffffff0000104816:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
ffffff000010481d:	00 00 00 

ffffff0000104820 <_memset>:
ffffff0000104820:	66 44 0f 6e c6       	movd   %esi,%xmm8
ffffff0000104825:	48 89 f8             	mov    %rdi,%rax
ffffff0000104828:	66 45 0f 60 c0       	punpcklbw %xmm8,%xmm8
ffffff000010482d:	66 45 0f 61 c0       	punpcklwd %xmm8,%xmm8
ffffff0000104832:	66 45 0f 70 c0 00    	pshufd $0x0,%xmm8,%xmm8
ffffff0000104838:	48 83 fa 40          	cmp    $0x40,%rdx
ffffff000010483c:	77 32                	ja     ffffff0000104870 <_memset+0x50>
ffffff000010483e:	48 83 fa 10          	cmp    $0x10,%rdx
ffffff0000104842:	0f 86 9a 00 00 00    	jbe    ffffff00001048e2 <_memset+0xc2>
ffffff0000104848:	48 83 fa 20          	cmp    $0x20,%rdx
ffffff000010484c:	f3 44 0f 7f 07       	movdqu %xmm8,(%rdi)
ffffff0000104851:	f3 44 0f 7f 44 17 f0 	movdqu %xmm8,-0x10(%rdi,%rdx,1)
ffffff0000104858:	77 06                	ja     ffffff0000104860 <_memset+0x40>
ffffff000010485a:	f3 c3                	repz retq 
ffffff000010485c:	0f 1f 40 00          	nopl   0x0(%rax)
ffffff0000104860:	f3 44 0f 7f 47 10    	movdqu %xmm8,0x10(%rdi)
ffffff0000104866:	f3 44 0f 7f 44 17 e0 	movdqu %xmm8,-0x20(%rdi,%rdx,1)
ffffff000010486d:	c3                   	retq   
ffffff000010486e:	66 90                	xchg   %ax,%ax
ffffff0000104870:	48 8d 4f 40          	lea    0x40(%rdi),%rcx
ffffff0000104874:	f3 44 0f 7f 07       	movdqu %xmm8,(%rdi)
ffffff0000104879:	48 83 e1 c0          	and    $0xffffffffffffffc0,%rcx
ffffff000010487d:	f3 44 0f 7f 44 17 f0 	movdqu %xmm8,-0x10(%rdi,%rdx,1)
ffffff0000104884:	f3 44 0f 7f 47 10    	movdqu %xmm8,0x10(%rdi)
ffffff000010488a:	f3 44 0f 7f 44 17 e0 	movdqu %xmm8,-0x20(%rdi,%rdx,1)
ffffff0000104891:	f3 44 0f 7f 47 20    	movdqu %xmm8,0x20(%rdi)
ffffff0000104897:	f3 44 0f 7f 44 17 d0 	movdqu %xmm8,-0x30(%rdi,%rdx,1)
ffffff000010489e:	f3 44 0f 7f 47 30    	movdqu %xmm8,0x30(%rdi)
ffffff00001048a4:	f3 44 0f 7f 44 17 c0 	movdqu %xmm8,-0x40(%rdi,%rdx,1)
ffffff00001048ab:	48 01 fa             	add    %rdi,%rdx
ffffff00001048ae:	48 83 e2 c0          	and    $0xffffffffffffffc0,%rdx
ffffff00001048b2:	48 39 d1             	cmp    %rdx,%rcx
ffffff00001048b5:	74 a3                	je     ffffff000010485a <_memset+0x3a>
ffffff00001048b7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
ffffff00001048be:	00 00 
ffffff00001048c0:	66 44 0f 7f 01       	movdqa %xmm8,(%rcx)
ffffff00001048c5:	66 44 0f 7f 41 10    	movdqa %xmm8,0x10(%rcx)
ffffff00001048cb:	66 44 0f 7f 41 20    	movdqa %xmm8,0x20(%rcx)
ffffff00001048d1:	66 44 0f 7f 41 30    	movdqa %xmm8,0x30(%rcx)
ffffff00001048d7:	48 83 c1 40          	add    $0x40,%rcx
ffffff00001048db:	48 39 ca             	cmp    %rcx,%rdx
ffffff00001048de:	75 e0                	jne    ffffff00001048c0 <_memset+0xa0>
ffffff00001048e0:	f3 c3                	repz retq 
ffffff00001048e2:	66 4c 0f 7e c1       	movq   %xmm8,%rcx
ffffff00001048e7:	f6 c2 18             	test   $0x18,%dl
ffffff00001048ea:	75 22                	jne    ffffff000010490e <_memset+0xee>
ffffff00001048ec:	f6 c2 04             	test   $0x4,%dl
ffffff00001048ef:	75 16                	jne    ffffff0000104907 <_memset+0xe7>
ffffff00001048f1:	f6 c2 01             	test   $0x1,%dl
ffffff00001048f4:	74 02                	je     ffffff00001048f8 <_memset+0xd8>
ffffff00001048f6:	88 0f                	mov    %cl,(%rdi)
ffffff00001048f8:	f6 c2 02             	test   $0x2,%dl
ffffff00001048fb:	0f 84 59 ff ff ff    	je     ffffff000010485a <_memset+0x3a>
ffffff0000104901:	66 89 4c 10 fe       	mov    %cx,-0x2(%rax,%rdx,1)
ffffff0000104906:	c3                   	retq   
ffffff0000104907:	89 0f                	mov    %ecx,(%rdi)
ffffff0000104909:	89 4c 17 fc          	mov    %ecx,-0x4(%rdi,%rdx,1)
ffffff000010490d:	c3                   	retq   
ffffff000010490e:	48 89 0f             	mov    %rcx,(%rdi)
ffffff0000104911:	48 89 4c 17 f8       	mov    %rcx,-0x8(%rdi,%rdx,1)
ffffff0000104916:	c3                   	retq   
ffffff0000104917:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
ffffff000010491e:	00 00 

ffffff0000104920 <_memmove>:
ffffff0000104920:	e9 cb f4 ff ff       	jmpq   ffffff0000103df0 <_memcpy>
