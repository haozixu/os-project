
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
  100020:	00 40 10             	add    %al,0x10(%rax)
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
  10007a:	17                   	(bad)  
  10007b:	00 00                	add    %al,(%rax)
  10007d:	10 00                	adc    %al,(%rax)
  10007f:	00 00                	add    %al,(%rax)
  100081:	ff                   	(bad)  
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
  1000f4:	b8 00 10 00 00       	mov    $0x1000,%eax
  1000f9:	66 f7 e3             	mul    %bx
  1000fc:	05 00 c0 00 00       	add    $0xc000,%eax
  100101:	89 c4                	mov    %eax,%esp
  100103:	b8 00 50 00 00       	mov    $0x5000,%eax
  100108:	66 f7 e3             	mul    %bx
  10010b:	05 00 80 00 00       	add    $0x8000,%eax
  100110:	6a 00                	pushq  $0x0
  100112:	50                   	push   %rax
  100113:	b8 00 80 00 00       	mov    $0x8000,%eax
  100118:	c7 00 83 00 00 00    	movl   $0x83,(%rax)
  10011e:	c7 40 08 83 00 20 00 	movl   $0x200083,0x8(%rax)
  100125:	c7 40 10 83 00 40 00 	movl   $0x400083,0x10(%rax)
  10012c:	c7 40 18 83 00 60 00 	movl   $0x600083,0x18(%rax)
  100133:	31 d2                	xor    %edx,%edx
  100135:	89 50 04             	mov    %edx,0x4(%rax)
  100138:	89 50 0c             	mov    %edx,0xc(%rax)
  10013b:	89 50 14             	mov    %edx,0x14(%rax)
  10013e:	89 50 1c             	mov    %edx,0x1c(%rax)
  100141:	0c 03                	or     $0x3,%al
  100143:	be 00 30 00 00       	mov    $0x3000,%esi
  100148:	89 06                	mov    %eax,(%rsi)
  10014a:	89 56 04             	mov    %edx,0x4(%rsi)
  10014d:	bf 00 40 00 00       	mov    $0x4000,%edi
  100152:	89 07                	mov    %eax,(%rdi)
  100154:	89 57 04             	mov    %edx,0x4(%rdi)
  100157:	b8 00 20 00 00       	mov    $0x2000,%eax
  10015c:	c7 00 07 30 00 00    	movl   $0x3007,(%rax)
  100162:	89 50 04             	mov    %edx,0x4(%rax)
  100165:	c7 80 f0 0f 00 00 03 	movl   $0x4003,0xff0(%rax)
  10016c:	40 00 00 
  10016f:	89 90 f4 0f 00 00    	mov    %edx,0xff4(%rax)
  100175:	c7 80 f8 0f 00 00 03 	movl   $0x5003,0xff8(%rax)
  10017c:	50 00 00 
  10017f:	89 90 fc 0f 00 00    	mov    %edx,0xffc(%rax)
  100185:	0f 22 d8             	mov    %rax,%cr3
  100188:	0f 20 e0             	mov    %cr4,%rax
  10018b:	0d a0 06 00 00       	or     $0x6a0,%eax
  100190:	0f 22 e0             	mov    %rax,%cr4
  100193:	b9 80 00 00 c0       	mov    $0xc0000080,%ecx
  100198:	0f 32                	rdmsr  
  10019a:	0d 01 09 00 00       	or     $0x901,%eax
  10019f:	0f 30                	wrmsr  
  1001a1:	0f 20 c0             	mov    %cr0,%rax
  1001a4:	25 fb ff ff 1f       	and    $0x1ffffffb,%eax
  1001a9:	0d 02 00 00 80       	or     $0x80000002,%eax
  1001ae:	0f 22 c0             	mov    %rax,%cr0
  1001b1:	0f 01 15 70 00 10 00 	lgdt   0x100070(%rip)        # 200228 <__multiboot_load_end+0xfc228>
  1001b8:	ea                   	(bad)  
  1001b9:	bf 01 10 00 08       	mov    $0x8001001,%edi
  1001be:	00 48 b9             	add    %cl,-0x47(%rax)
  1001c1:	00 20                	add    %ah,(%rax)
  1001c3:	10 00                	adc    %al,(%rax)
  1001c5:	00 ff                	add    %bh,%bh
  1001c7:	ff                   	(bad)  
  1001c8:	ff                   	(bad)  
  1001c9:	ff e1                	jmpq   *%rcx

Disassembly of section .init:

ffffff0000101000 <__init_array_start>:
ffffff0000101000:	e0 24                	loopne ffffff0000101026 <_ZN4arch8pre_initEm+0x16>
ffffff0000101002:	10 00                	adc    %al,(%rax)
ffffff0000101004:	00 ff                	add    %bh,%bh
ffffff0000101006:	ff                   	(bad)  
ffffff0000101007:	ff 20                	jmpq   *(%rax)
ffffff0000101009:	2a 10                	sub    (%rax),%dl
ffffff000010100b:	00 00                	add    %al,(%rax)
ffffff000010100d:	ff                   	(bad)  
ffffff000010100e:	ff                   	(bad)  
ffffff000010100f:	ff 48 89             	decl   -0x77(%rax)

ffffff0000101010 <_ZN4arch8pre_initEm>:
ffffff0000101010:	48 89 f8             	mov    %rdi,%rax
ffffff0000101013:	53                   	push   %rbx
ffffff0000101014:	48 be 4c 33 10 00 00 	movabs $0xffffff000010334c,%rsi
ffffff000010101b:	ff ff ff 
ffffff000010101e:	48 a3 00 33 10 00 00 	movabs %rax,0xffffff0000103300
ffffff0000101025:	ff ff ff 
ffffff0000101028:	31 c0                	xor    %eax,%eax
ffffff000010102a:	0f a2                	cpuid  
ffffff000010102c:	89 1e                	mov    %ebx,(%rsi)
ffffff000010102e:	89 56 04             	mov    %edx,0x4(%rsi)
ffffff0000101031:	89 4e 08             	mov    %ecx,0x8(%rsi)
ffffff0000101034:	48 bf 40 33 10 00 00 	movabs $0xffffff0000103340,%rdi
ffffff000010103b:	ff ff ff 
ffffff000010103e:	89 47 04             	mov    %eax,0x4(%rdi)
ffffff0000101041:	b8 01 00 00 00       	mov    $0x1,%eax
ffffff0000101046:	0f a2                	cpuid  
ffffff0000101048:	c1 eb 10             	shr    $0x10,%ebx
ffffff000010104b:	81 e3 ff 00 00 00    	and    $0xff,%ebx
ffffff0000101051:	89 1f                	mov    %ebx,(%rdi)
ffffff0000101053:	b8 00 00 00 80       	mov    $0x80000000,%eax
ffffff0000101058:	0f a2                	cpuid  
ffffff000010105a:	48 be 58 33 10 00 00 	movabs $0xffffff0000103358,%rsi
ffffff0000101061:	ff ff ff 
ffffff0000101064:	89 47 08             	mov    %eax,0x8(%rdi)
ffffff0000101067:	b8 02 00 00 80       	mov    $0x80000002,%eax
ffffff000010106c:	0f a2                	cpuid  
ffffff000010106e:	89 06                	mov    %eax,(%rsi)
ffffff0000101070:	89 5e 04             	mov    %ebx,0x4(%rsi)
ffffff0000101073:	89 4e 08             	mov    %ecx,0x8(%rsi)
ffffff0000101076:	89 56 0c             	mov    %edx,0xc(%rsi)
ffffff0000101079:	b8 03 00 00 80       	mov    $0x80000003,%eax
ffffff000010107e:	0f a2                	cpuid  
ffffff0000101080:	89 46 10             	mov    %eax,0x10(%rsi)
ffffff0000101083:	89 5e 14             	mov    %ebx,0x14(%rsi)
ffffff0000101086:	89 4e 18             	mov    %ecx,0x18(%rsi)
ffffff0000101089:	89 56 1c             	mov    %edx,0x1c(%rsi)
ffffff000010108c:	b8 04 00 00 80       	mov    $0x80000004,%eax
ffffff0000101091:	0f a2                	cpuid  
ffffff0000101093:	89 46 20             	mov    %eax,0x20(%rsi)
ffffff0000101096:	89 5e 24             	mov    %ebx,0x24(%rsi)
ffffff0000101099:	89 4e 28             	mov    %ecx,0x28(%rsi)
ffffff000010109c:	89 56 2c             	mov    %edx,0x2c(%rsi)
ffffff000010109f:	5b                   	pop    %rbx
ffffff00001010a0:	c3                   	retq   
ffffff00001010a1:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
ffffff00001010a8:	0f 1f 84 00 00 00 00 
ffffff00001010af:	00 

ffffff00001010b0 <_ZN4arch4initEv>:
ffffff00001010b0:	f3 c3                	repz retq 
ffffff00001010b2:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

Disassembly of section .text:

ffffff0000102000 <_text>:
ffffff0000102000:	0f 01 14 25 7a 00 10 	lgdt   0x10007a
ffffff0000102007:	00 
ffffff0000102008:	66 b8 10 00          	mov    $0x10,%ax
ffffff000010200c:	8e d8                	mov    %eax,%ds
ffffff000010200e:	8e c0                	mov    %eax,%es
ffffff0000102010:	8e d0                	mov    %eax,%ss
ffffff0000102012:	48 ba 00 00 00 00 00 	movabs $0xffffff0000000000,%rdx
ffffff0000102019:	ff ff ff 
ffffff000010201c:	48 01 d4             	add    %rdx,%rsp
ffffff000010201f:	48 b8 00 10 10 00 00 	movabs $0xffffff0000101000,%rax
ffffff0000102026:	ff ff ff 
ffffff0000102029:	48 bb 10 10 10 00 00 	movabs $0xffffff0000101010,%rbx
ffffff0000102030:	ff ff ff 
ffffff0000102033:	48 39 c3             	cmp    %rax,%rbx
ffffff0000102036:	74 0c                	je     ffffff0000102044 <_text+0x44>
ffffff0000102038:	50                   	push   %rax
ffffff0000102039:	53                   	push   %rbx
ffffff000010203a:	ff 10                	callq  *(%rax)
ffffff000010203c:	5b                   	pop    %rbx
ffffff000010203d:	58                   	pop    %rax
ffffff000010203e:	48 83 c0 08          	add    $0x8,%rax
ffffff0000102042:	eb ef                	jmp    ffffff0000102033 <_text+0x33>
ffffff0000102044:	48 bf 00 00 00 00 00 	movabs $0xffffff0000000000,%rdi
ffffff000010204b:	ff ff ff 
ffffff000010204e:	5e                   	pop    %rsi
ffffff000010204f:	48 01 fe             	add    %rdi,%rsi
ffffff0000102052:	48 81 c7 00 05 00 00 	add    $0x500,%rdi
ffffff0000102059:	e9 02 00 00 00       	jmpq   ffffff0000102060 <__kernel_pre_start>
ffffff000010205e:	f4                   	hlt    
ffffff000010205f:	90                   	nop

ffffff0000102060 <__kernel_pre_start>:
ffffff0000102060:	55                   	push   %rbp
ffffff0000102061:	53                   	push   %rbx
ffffff0000102062:	48 89 f5             	mov    %rsi,%rbp
ffffff0000102065:	48 89 fb             	mov    %rdi,%rbx
ffffff0000102068:	48 b8 30 23 10 00 00 	movabs $0xffffff0000102330,%rax
ffffff000010206f:	ff ff ff 
ffffff0000102072:	48 bf 00 30 10 00 00 	movabs $0xffffff0000103000,%rdi
ffffff0000102079:	ff ff ff 
ffffff000010207c:	48 83 ec 08          	sub    $0x8,%rsp
ffffff0000102080:	ff d0                	callq  *%rax
ffffff0000102082:	8b 13                	mov    (%rbx),%edx
ffffff0000102084:	48 89 de             	mov    %rbx,%rsi
ffffff0000102087:	48 b9 90 23 10 00 00 	movabs $0xffffff0000102390,%rcx
ffffff000010208e:	ff ff ff 
ffffff0000102091:	48 bf 18 30 10 00 00 	movabs $0xffffff0000103018,%rdi
ffffff0000102098:	ff ff ff 
ffffff000010209b:	31 c0                	xor    %eax,%eax
ffffff000010209d:	ff d1                	callq  *%rcx
ffffff000010209f:	48 89 ef             	mov    %rbp,%rdi
ffffff00001020a2:	48 b8 10 10 10 00 00 	movabs $0xffffff0000101010,%rax
ffffff00001020a9:	ff ff ff 
ffffff00001020ac:	ff d0                	callq  *%rax
ffffff00001020ae:	48 b8 10 22 10 00 00 	movabs $0xffffff0000102210,%rax
ffffff00001020b5:	ff ff ff 
ffffff00001020b8:	48 89 df             	mov    %rbx,%rdi
ffffff00001020bb:	ff d0                	callq  *%rax
ffffff00001020bd:	48 b8 b0 10 10 00 00 	movabs $0xffffff00001010b0,%rax
ffffff00001020c4:	ff ff ff 
ffffff00001020c7:	ff d0                	callq  *%rax
ffffff00001020c9:	eb fe                	jmp    ffffff00001020c9 <__kernel_pre_start+0x69>
ffffff00001020cb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

ffffff00001020d0 <_ZN6kernel4exitEi>:
ffffff00001020d0:	31 ff                	xor    %edi,%edi
ffffff00001020d2:	48 b8 50 21 10 00 00 	movabs $0xffffff0000102150,%rax
ffffff00001020d9:	ff ff ff 
ffffff00001020dc:	ff e0                	jmpq   *%rax
ffffff00001020de:	66 90                	xchg   %ax,%ax

ffffff00001020e0 <_ZN6kernel4mainEv>:
ffffff00001020e0:	48 83 ec 08          	sub    $0x8,%rsp
ffffff00001020e4:	48 b8 b0 10 10 00 00 	movabs $0xffffff00001010b0,%rax
ffffff00001020eb:	ff ff ff 
ffffff00001020ee:	ff d0                	callq  *%rax
ffffff00001020f0:	eb fe                	jmp    ffffff00001020f0 <_ZN6kernel4mainEv+0x10>
ffffff00001020f2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
ffffff00001020f9:	00 00 00 
ffffff00001020fc:	0f 1f 40 00          	nopl   0x0(%rax)

ffffff0000102100 <__cxa_atexit>:
ffffff0000102100:	48 b8 80 31 10 00 00 	movabs $0xffffff0000103180,%rax
ffffff0000102107:	ff ff ff 
ffffff000010210a:	8b 08                	mov    (%rax),%ecx
ffffff000010210c:	83 f9 0f             	cmp    $0xf,%ecx
ffffff000010210f:	77 2f                	ja     ffffff0000102140 <__cxa_atexit+0x40>
ffffff0000102111:	8d 51 01             	lea    0x1(%rcx),%edx
ffffff0000102114:	89 d0                	mov    %edx,%eax
ffffff0000102116:	48 ba c0 31 10 00 00 	movabs $0xffffff00001031c0,%rdx
ffffff000010211d:	ff ff ff 
ffffff0000102120:	a3 80 31 10 00 00 ff 	movabs %eax,0xffffff0000103180
ffffff0000102127:	ff ff 
ffffff0000102129:	89 c8                	mov    %ecx,%eax
ffffff000010212b:	48 c1 e0 04          	shl    $0x4,%rax
ffffff000010212f:	48 01 d0             	add    %rdx,%rax
ffffff0000102132:	48 89 38             	mov    %rdi,(%rax)
ffffff0000102135:	48 89 70 08          	mov    %rsi,0x8(%rax)
ffffff0000102139:	31 c0                	xor    %eax,%eax
ffffff000010213b:	c3                   	retq   
ffffff000010213c:	0f 1f 40 00          	nopl   0x0(%rax)
ffffff0000102140:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
ffffff0000102145:	c3                   	retq   
ffffff0000102146:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
ffffff000010214d:	00 00 00 

ffffff0000102150 <__cxa_finalize>:
ffffff0000102150:	41 55                	push   %r13
ffffff0000102152:	41 54                	push   %r12
ffffff0000102154:	55                   	push   %rbp
ffffff0000102155:	53                   	push   %rbx
ffffff0000102156:	48 83 ec 08          	sub    $0x8,%rsp
ffffff000010215a:	48 85 ff             	test   %rdi,%rdi
ffffff000010215d:	a1 80 31 10 00 00 ff 	movabs 0xffffff0000103180,%eax
ffffff0000102164:	ff ff 
ffffff0000102166:	74 53                	je     ffffff00001021bb <__cxa_finalize+0x6b>
ffffff0000102168:	49 89 fc             	mov    %rdi,%r12
ffffff000010216b:	8d 68 ff             	lea    -0x1(%rax),%ebp
ffffff000010216e:	49 bd c0 31 10 00 00 	movabs $0xffffff00001031c0,%r13
ffffff0000102175:	ff ff ff 
ffffff0000102178:	eb 09                	jmp    ffffff0000102183 <__cxa_finalize+0x33>
ffffff000010217a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
ffffff0000102180:	83 ed 01             	sub    $0x1,%ebp
ffffff0000102183:	83 fd ff             	cmp    $0xffffffff,%ebp
ffffff0000102186:	74 28                	je     ffffff00001021b0 <__cxa_finalize+0x60>
ffffff0000102188:	89 eb                	mov    %ebp,%ebx
ffffff000010218a:	48 c1 e3 04          	shl    $0x4,%rbx
ffffff000010218e:	4c 01 eb             	add    %r13,%rbx
ffffff0000102191:	4c 39 23             	cmp    %r12,(%rbx)
ffffff0000102194:	75 ea                	jne    ffffff0000102180 <__cxa_finalize+0x30>
ffffff0000102196:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
ffffff000010219a:	41 ff d4             	callq  *%r12
ffffff000010219d:	48 c7 03 00 00 00 00 	movq   $0x0,(%rbx)
ffffff00001021a4:	eb da                	jmp    ffffff0000102180 <__cxa_finalize+0x30>
ffffff00001021a6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
ffffff00001021ad:	00 00 00 
ffffff00001021b0:	48 83 c4 08          	add    $0x8,%rsp
ffffff00001021b4:	5b                   	pop    %rbx
ffffff00001021b5:	5d                   	pop    %rbp
ffffff00001021b6:	41 5c                	pop    %r12
ffffff00001021b8:	41 5d                	pop    %r13
ffffff00001021ba:	c3                   	retq   
ffffff00001021bb:	85 c0                	test   %eax,%eax
ffffff00001021bd:	75 07                	jne    ffffff00001021c6 <__cxa_finalize+0x76>
ffffff00001021bf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
ffffff00001021c4:	eb a2                	jmp    ffffff0000102168 <__cxa_finalize+0x18>
ffffff00001021c6:	83 e8 01             	sub    $0x1,%eax
ffffff00001021c9:	48 ba c0 31 10 00 00 	movabs $0xffffff00001031c0,%rdx
ffffff00001021d0:	ff ff ff 
ffffff00001021d3:	48 c1 e0 04          	shl    $0x4,%rax
ffffff00001021d7:	48 01 d0             	add    %rdx,%rax
ffffff00001021da:	48 8b 10             	mov    (%rax),%rdx
ffffff00001021dd:	48 85 d2             	test   %rdx,%rdx
ffffff00001021e0:	74 ce                	je     ffffff00001021b0 <__cxa_finalize+0x60>
ffffff00001021e2:	48 8b 78 08          	mov    0x8(%rax),%rdi
ffffff00001021e6:	48 83 c4 08          	add    $0x8,%rsp
ffffff00001021ea:	5b                   	pop    %rbx
ffffff00001021eb:	5d                   	pop    %rbp
ffffff00001021ec:	41 5c                	pop    %r12
ffffff00001021ee:	41 5d                	pop    %r13
ffffff00001021f0:	ff e2                	jmpq   *%rdx
ffffff00001021f2:	66 66 66 66 66 2e 0f 	data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
ffffff00001021f9:	1f 84 00 00 00 00 00 

ffffff0000102200 <__cxa_pure_virtual>:
ffffff0000102200:	f3 c3                	repz retq 
ffffff0000102202:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
ffffff0000102209:	00 00 00 
ffffff000010220c:	0f 1f 40 00          	nopl   0x0(%rax)

ffffff0000102210 <_ZN10multiboot25parseEm>:
ffffff0000102210:	41 54                	push   %r12
ffffff0000102212:	55                   	push   %rbp
ffffff0000102213:	49 bc 90 23 10 00 00 	movabs $0xffffff0000102390,%r12
ffffff000010221a:	ff ff ff 
ffffff000010221d:	53                   	push   %rbx
ffffff000010221e:	8b 47 08             	mov    0x8(%rdi),%eax
ffffff0000102221:	48 8d 6f 08          	lea    0x8(%rdi),%rbp
ffffff0000102225:	85 c0                	test   %eax,%eax
ffffff0000102227:	75 30                	jne    ffffff0000102259 <_ZN10multiboot25parseEm+0x49>
ffffff0000102229:	e9 b3 00 00 00       	jmpq   ffffff00001022e1 <_ZN10multiboot25parseEm+0xd1>
ffffff000010222e:	66 90                	xchg   %ax,%ax
ffffff0000102230:	83 f8 08             	cmp    $0x8,%eax
ffffff0000102233:	0f 84 d7 00 00 00    	je     ffffff0000102310 <_ZN10multiboot25parseEm+0x100>
ffffff0000102239:	83 f8 02             	cmp    $0x2,%eax
ffffff000010223c:	0f 84 ae 00 00 00    	je     ffffff00001022f0 <_ZN10multiboot25parseEm+0xe0>
ffffff0000102242:	8b 45 04             	mov    0x4(%rbp),%eax
ffffff0000102245:	83 c0 07             	add    $0x7,%eax
ffffff0000102248:	83 e0 f8             	and    $0xfffffff8,%eax
ffffff000010224b:	48 01 c5             	add    %rax,%rbp
ffffff000010224e:	8b 45 00             	mov    0x0(%rbp),%eax
ffffff0000102251:	85 c0                	test   %eax,%eax
ffffff0000102253:	0f 84 88 00 00 00    	je     ffffff00001022e1 <_ZN10multiboot25parseEm+0xd1>
ffffff0000102259:	83 f8 06             	cmp    $0x6,%eax
ffffff000010225c:	75 d2                	jne    ffffff0000102230 <_ZN10multiboot25parseEm+0x20>
ffffff000010225e:	8b 45 04             	mov    0x4(%rbp),%eax
ffffff0000102261:	31 d2                	xor    %edx,%edx
ffffff0000102263:	48 8d 5d 10          	lea    0x10(%rbp),%rbx
ffffff0000102267:	83 e8 10             	sub    $0x10,%eax
ffffff000010226a:	f7 75 08             	divl   0x8(%rbp)
ffffff000010226d:	89 c7                	mov    %eax,%edi
ffffff000010226f:	a3 c0 32 10 00 00 ff 	movabs %eax,0xffffff00001032c0
ffffff0000102276:	ff ff 
ffffff0000102278:	48 89 d8             	mov    %rbx,%rax
ffffff000010227b:	89 fe                	mov    %edi,%esi
ffffff000010227d:	48 a3 c8 32 10 00 00 	movabs %rax,0xffffff00001032c8
ffffff0000102284:	ff ff ff 
ffffff0000102287:	48 bf 68 30 10 00 00 	movabs $0xffffff0000103068,%rdi
ffffff000010228e:	ff ff ff 
ffffff0000102291:	31 c0                	xor    %eax,%eax
ffffff0000102293:	41 ff d4             	callq  *%r12
ffffff0000102296:	eb 27                	jmp    ffffff00001022bf <_ZN10multiboot25parseEm+0xaf>
ffffff0000102298:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
ffffff000010229f:	00 
ffffff00001022a0:	8b 4b 10             	mov    0x10(%rbx),%ecx
ffffff00001022a3:	48 8b 53 08          	mov    0x8(%rbx),%rdx
ffffff00001022a7:	31 c0                	xor    %eax,%eax
ffffff00001022a9:	48 8b 33             	mov    (%rbx),%rsi
ffffff00001022ac:	48 bf a0 30 10 00 00 	movabs $0xffffff00001030a0,%rdi
ffffff00001022b3:	ff ff ff 
ffffff00001022b6:	41 ff d4             	callq  *%r12
ffffff00001022b9:	8b 45 08             	mov    0x8(%rbp),%eax
ffffff00001022bc:	48 01 c3             	add    %rax,%rbx
ffffff00001022bf:	8b 55 04             	mov    0x4(%rbp),%edx
ffffff00001022c2:	48 89 d0             	mov    %rdx,%rax
ffffff00001022c5:	48 01 ea             	add    %rbp,%rdx
ffffff00001022c8:	48 39 d3             	cmp    %rdx,%rbx
ffffff00001022cb:	72 d3                	jb     ffffff00001022a0 <_ZN10multiboot25parseEm+0x90>
ffffff00001022cd:	83 c0 07             	add    $0x7,%eax
ffffff00001022d0:	83 e0 f8             	and    $0xfffffff8,%eax
ffffff00001022d3:	48 01 c5             	add    %rax,%rbp
ffffff00001022d6:	8b 45 00             	mov    0x0(%rbp),%eax
ffffff00001022d9:	85 c0                	test   %eax,%eax
ffffff00001022db:	0f 85 78 ff ff ff    	jne    ffffff0000102259 <_ZN10multiboot25parseEm+0x49>
ffffff00001022e1:	5b                   	pop    %rbx
ffffff00001022e2:	5d                   	pop    %rbp
ffffff00001022e3:	41 5c                	pop    %r12
ffffff00001022e5:	c3                   	retq   
ffffff00001022e6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
ffffff00001022ed:	00 00 00 
ffffff00001022f0:	31 c0                	xor    %eax,%eax
ffffff00001022f2:	48 8d 75 08          	lea    0x8(%rbp),%rsi
ffffff00001022f6:	48 bf 4f 30 10 00 00 	movabs $0xffffff000010304f,%rdi
ffffff00001022fd:	ff ff ff 
ffffff0000102300:	41 ff d4             	callq  *%r12
ffffff0000102303:	8b 45 04             	mov    0x4(%rbp),%eax
ffffff0000102306:	e9 3a ff ff ff       	jmpq   ffffff0000102245 <_ZN10multiboot25parseEm+0x35>
ffffff000010230b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
ffffff0000102310:	48 8b 75 08          	mov    0x8(%rbp),%rsi
ffffff0000102314:	48 bf e0 30 10 00 00 	movabs $0xffffff00001030e0,%rdi
ffffff000010231b:	ff ff ff 
ffffff000010231e:	31 c0                	xor    %eax,%eax
ffffff0000102320:	41 ff d4             	callq  *%r12
ffffff0000102323:	e9 1a ff ff ff       	jmpq   ffffff0000102242 <_ZN10multiboot25parseEm+0x32>
ffffff0000102328:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
ffffff000010232f:	00 

ffffff0000102330 <_ZN6kernel5debug3logEPKc>:
ffffff0000102330:	44 0f b6 07          	movzbl (%rdi),%r8d
ffffff0000102334:	45 84 c0             	test   %r8b,%r8b
ffffff0000102337:	74 46                	je     ffffff000010237f <_ZN6kernel5debug3logEPKc+0x4f>
ffffff0000102339:	48 b8 d2 32 10 00 00 	movabs $0xffffff00001032d2,%rax
ffffff0000102340:	ff ff ff 
ffffff0000102343:	66 44 8b 08          	mov    (%rax),%r9w
ffffff0000102347:	be 01 00 00 00       	mov    $0x1,%esi
ffffff000010234c:	41 8d 49 05          	lea    0x5(%r9),%ecx
ffffff0000102350:	eb 0e                	jmp    ffffff0000102360 <_ZN6kernel5debug3logEPKc+0x30>
ffffff0000102352:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
ffffff0000102358:	f3 90                	pause  
ffffff000010235a:	f3 90                	pause  
ffffff000010235c:	f3 90                	pause  
ffffff000010235e:	f3 90                	pause  
ffffff0000102360:	89 ca                	mov    %ecx,%edx
ffffff0000102362:	ec                   	in     (%dx),%al
ffffff0000102363:	a8 20                	test   $0x20,%al
ffffff0000102365:	74 f1                	je     ffffff0000102358 <_ZN6kernel5debug3logEPKc+0x28>
ffffff0000102367:	44 89 c0             	mov    %r8d,%eax
ffffff000010236a:	44 89 ca             	mov    %r9d,%edx
ffffff000010236d:	ee                   	out    %al,(%dx)
ffffff000010236e:	44 0f b6 04 37       	movzbl (%rdi,%rsi,1),%r8d
ffffff0000102373:	8d 46 01             	lea    0x1(%rsi),%eax
ffffff0000102376:	45 84 c0             	test   %r8b,%r8b
ffffff0000102379:	74 04                	je     ffffff000010237f <_ZN6kernel5debug3logEPKc+0x4f>
ffffff000010237b:	89 c6                	mov    %eax,%esi
ffffff000010237d:	eb e1                	jmp    ffffff0000102360 <_ZN6kernel5debug3logEPKc+0x30>
ffffff000010237f:	f3 c3                	repz retq 
ffffff0000102381:	66 66 66 66 66 66 2e 	data16 data16 data16 data16 data16 nopw %cs:0x0(%rax,%rax,1)
ffffff0000102388:	0f 1f 84 00 00 00 00 
ffffff000010238f:	00 

ffffff0000102390 <_ZN6kernel5debug10log_formatEPKcz>:
ffffff0000102390:	48 81 ec d8 01 00 00 	sub    $0x1d8,%rsp
ffffff0000102397:	84 c0                	test   %al,%al
ffffff0000102399:	48 89 b4 24 28 01 00 	mov    %rsi,0x128(%rsp)
ffffff00001023a0:	00 
ffffff00001023a1:	48 89 94 24 30 01 00 	mov    %rdx,0x130(%rsp)
ffffff00001023a8:	00 
ffffff00001023a9:	48 89 8c 24 38 01 00 	mov    %rcx,0x138(%rsp)
ffffff00001023b0:	00 
ffffff00001023b1:	4c 89 84 24 40 01 00 	mov    %r8,0x140(%rsp)
ffffff00001023b8:	00 
ffffff00001023b9:	4c 89 8c 24 48 01 00 	mov    %r9,0x148(%rsp)
ffffff00001023c0:	00 
ffffff00001023c1:	74 40                	je     ffffff0000102403 <_ZN6kernel5debug10log_formatEPKcz+0x73>
ffffff00001023c3:	0f 29 84 24 50 01 00 	movaps %xmm0,0x150(%rsp)
ffffff00001023ca:	00 
ffffff00001023cb:	0f 29 8c 24 60 01 00 	movaps %xmm1,0x160(%rsp)
ffffff00001023d2:	00 
ffffff00001023d3:	0f 29 94 24 70 01 00 	movaps %xmm2,0x170(%rsp)
ffffff00001023da:	00 
ffffff00001023db:	0f 29 9c 24 80 01 00 	movaps %xmm3,0x180(%rsp)
ffffff00001023e2:	00 
ffffff00001023e3:	0f 29 a4 24 90 01 00 	movaps %xmm4,0x190(%rsp)
ffffff00001023ea:	00 
ffffff00001023eb:	0f 29 ac 24 a0 01 00 	movaps %xmm5,0x1a0(%rsp)
ffffff00001023f2:	00 
ffffff00001023f3:	0f 29 b4 24 b0 01 00 	movaps %xmm6,0x1b0(%rsp)
ffffff00001023fa:	00 
ffffff00001023fb:	0f 29 bc 24 c0 01 00 	movaps %xmm7,0x1c0(%rsp)
ffffff0000102402:	00 
ffffff0000102403:	48 8d 84 24 e0 01 00 	lea    0x1e0(%rsp),%rax
ffffff000010240a:	00 
ffffff000010240b:	48 89 fe             	mov    %rdi,%rsi
ffffff000010240e:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
ffffff0000102413:	48 8d 7c 24 20       	lea    0x20(%rsp),%rdi
ffffff0000102418:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
ffffff000010241d:	48 8d 84 24 20 01 00 	lea    0x120(%rsp),%rax
ffffff0000102424:	00 
ffffff0000102425:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%rsp)
ffffff000010242c:	00 
ffffff000010242d:	c7 44 24 0c 30 00 00 	movl   $0x30,0xc(%rsp)
ffffff0000102434:	00 
ffffff0000102435:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
ffffff000010243a:	48 b8 5d 25 10 00 00 	movabs $0xffffff000010255d,%rax
ffffff0000102441:	ff ff ff 
ffffff0000102444:	ff d0                	callq  *%rax
ffffff0000102446:	48 b8 d2 32 10 00 00 	movabs $0xffffff00001032d2,%rax
ffffff000010244d:	ff ff ff 
ffffff0000102450:	66 44 8b 00          	mov    (%rax),%r8w
ffffff0000102454:	be 01 00 00 00       	mov    $0x1,%esi
ffffff0000102459:	bf 5b 00 00 00       	mov    $0x5b,%edi
ffffff000010245e:	49 b9 08 31 10 00 00 	movabs $0xffffff0000103108,%r9
ffffff0000102465:	ff ff ff 
ffffff0000102468:	41 8d 48 05          	lea    0x5(%r8),%ecx
ffffff000010246c:	eb 0a                	jmp    ffffff0000102478 <_ZN6kernel5debug10log_formatEPKcz+0xe8>
ffffff000010246e:	66 90                	xchg   %ax,%ax
ffffff0000102470:	f3 90                	pause  
ffffff0000102472:	f3 90                	pause  
ffffff0000102474:	f3 90                	pause  
ffffff0000102476:	f3 90                	pause  
ffffff0000102478:	89 ca                	mov    %ecx,%edx
ffffff000010247a:	ec                   	in     (%dx),%al
ffffff000010247b:	a8 20                	test   $0x20,%al
ffffff000010247d:	74 f1                	je     ffffff0000102470 <_ZN6kernel5debug10log_formatEPKcz+0xe0>
ffffff000010247f:	89 f8                	mov    %edi,%eax
ffffff0000102481:	44 89 c2             	mov    %r8d,%edx
ffffff0000102484:	ee                   	out    %al,(%dx)
ffffff0000102485:	41 0f b6 3c 31       	movzbl (%r9,%rsi,1),%edi
ffffff000010248a:	8d 46 01             	lea    0x1(%rsi),%eax
ffffff000010248d:	40 84 ff             	test   %dil,%dil
ffffff0000102490:	74 04                	je     ffffff0000102496 <_ZN6kernel5debug10log_formatEPKcz+0x106>
ffffff0000102492:	89 c6                	mov    %eax,%esi
ffffff0000102494:	eb e2                	jmp    ffffff0000102478 <_ZN6kernel5debug10log_formatEPKcz+0xe8>
ffffff0000102496:	0f b6 7c 24 20       	movzbl 0x20(%rsp),%edi
ffffff000010249b:	be 01 00 00 00       	mov    $0x1,%esi
ffffff00001024a0:	40 84 ff             	test   %dil,%dil
ffffff00001024a3:	75 13                	jne    ffffff00001024b8 <_ZN6kernel5debug10log_formatEPKcz+0x128>
ffffff00001024a5:	eb 2f                	jmp    ffffff00001024d6 <_ZN6kernel5debug10log_formatEPKcz+0x146>
ffffff00001024a7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
ffffff00001024ae:	00 00 
ffffff00001024b0:	f3 90                	pause  
ffffff00001024b2:	f3 90                	pause  
ffffff00001024b4:	f3 90                	pause  
ffffff00001024b6:	f3 90                	pause  
ffffff00001024b8:	89 ca                	mov    %ecx,%edx
ffffff00001024ba:	ec                   	in     (%dx),%al
ffffff00001024bb:	a8 20                	test   $0x20,%al
ffffff00001024bd:	74 f1                	je     ffffff00001024b0 <_ZN6kernel5debug10log_formatEPKcz+0x120>
ffffff00001024bf:	89 f8                	mov    %edi,%eax
ffffff00001024c1:	44 89 c2             	mov    %r8d,%edx
ffffff00001024c4:	ee                   	out    %al,(%dx)
ffffff00001024c5:	0f b6 7c 34 20       	movzbl 0x20(%rsp,%rsi,1),%edi
ffffff00001024ca:	8d 46 01             	lea    0x1(%rsi),%eax
ffffff00001024cd:	40 84 ff             	test   %dil,%dil
ffffff00001024d0:	74 04                	je     ffffff00001024d6 <_ZN6kernel5debug10log_formatEPKcz+0x146>
ffffff00001024d2:	89 c6                	mov    %eax,%esi
ffffff00001024d4:	eb e2                	jmp    ffffff00001024b8 <_ZN6kernel5debug10log_formatEPKcz+0x128>
ffffff00001024d6:	48 81 c4 d8 01 00 00 	add    $0x1d8,%rsp
ffffff00001024dd:	c3                   	retq   
ffffff00001024de:	66 90                	xchg   %ax,%ax

ffffff00001024e0 <_GLOBAL__sub_I__ZN6kernel5debug4com1E>:
ffffff00001024e0:	48 b8 d2 32 10 00 00 	movabs $0xffffff00001032d2,%rax
ffffff00001024e7:	ff ff ff 
ffffff00001024ea:	ba f8 03 00 00       	mov    $0x3f8,%edx
ffffff00001024ef:	66 89 10             	mov    %dx,(%rax)
ffffff00001024f2:	ba f9 03 00 00       	mov    $0x3f9,%edx
ffffff00001024f7:	31 c0                	xor    %eax,%eax
ffffff00001024f9:	ee                   	out    %al,(%dx)
ffffff00001024fa:	be 80 ff ff ff       	mov    $0xffffff80,%esi
ffffff00001024ff:	b2 fb                	mov    $0xfb,%dl
ffffff0000102501:	89 f0                	mov    %esi,%eax
ffffff0000102503:	ee                   	out    %al,(%dx)
ffffff0000102504:	b8 03 00 00 00       	mov    $0x3,%eax
ffffff0000102509:	b2 f8                	mov    $0xf8,%dl
ffffff000010250b:	ee                   	out    %al,(%dx)
ffffff000010250c:	31 c0                	xor    %eax,%eax
ffffff000010250e:	b2 f9                	mov    $0xf9,%dl
ffffff0000102510:	ee                   	out    %al,(%dx)
ffffff0000102511:	b8 03 00 00 00       	mov    $0x3,%eax
ffffff0000102516:	b2 fb                	mov    $0xfb,%dl
ffffff0000102518:	ee                   	out    %al,(%dx)
ffffff0000102519:	b9 c7 ff ff ff       	mov    $0xffffffc7,%ecx
ffffff000010251e:	b2 fa                	mov    $0xfa,%dl
ffffff0000102520:	89 c8                	mov    %ecx,%eax
ffffff0000102522:	ee                   	out    %al,(%dx)
ffffff0000102523:	48 b8 d0 32 10 00 00 	movabs $0xffffff00001032d0,%rax
ffffff000010252a:	ff ff ff 
ffffff000010252d:	bf f8 02 00 00       	mov    $0x2f8,%edi
ffffff0000102532:	ba f9 02 00 00       	mov    $0x2f9,%edx
ffffff0000102537:	66 89 38             	mov    %di,(%rax)
ffffff000010253a:	31 c0                	xor    %eax,%eax
ffffff000010253c:	ee                   	out    %al,(%dx)
ffffff000010253d:	b2 fb                	mov    $0xfb,%dl
ffffff000010253f:	89 f0                	mov    %esi,%eax
ffffff0000102541:	ee                   	out    %al,(%dx)
ffffff0000102542:	b8 03 00 00 00       	mov    $0x3,%eax
ffffff0000102547:	b2 f8                	mov    $0xf8,%dl
ffffff0000102549:	ee                   	out    %al,(%dx)
ffffff000010254a:	31 c0                	xor    %eax,%eax
ffffff000010254c:	b2 f9                	mov    $0xf9,%dl
ffffff000010254e:	ee                   	out    %al,(%dx)
ffffff000010254f:	b8 03 00 00 00       	mov    $0x3,%eax
ffffff0000102554:	b2 fb                	mov    $0xfb,%dl
ffffff0000102556:	ee                   	out    %al,(%dx)
ffffff0000102557:	b2 fa                	mov    $0xfa,%dl
ffffff0000102559:	89 c8                	mov    %ecx,%eax
ffffff000010255b:	ee                   	out    %al,(%dx)
ffffff000010255c:	c3                   	retq   

ffffff000010255d <kvsprintf>:
ffffff000010255d:	41 57                	push   %r15
ffffff000010255f:	41 56                	push   %r14
ffffff0000102561:	41 55                	push   %r13
ffffff0000102563:	41 54                	push   %r12
ffffff0000102565:	49 89 fd             	mov    %rdi,%r13
ffffff0000102568:	55                   	push   %rbp
ffffff0000102569:	53                   	push   %rbx
ffffff000010256a:	48 89 f5             	mov    %rsi,%rbp
ffffff000010256d:	48 89 d3             	mov    %rdx,%rbx
ffffff0000102570:	49 89 fc             	mov    %rdi,%r12
ffffff0000102573:	48 83 ec 28          	sub    $0x28,%rsp
ffffff0000102577:	8a 45 00             	mov    0x0(%rbp),%al
ffffff000010257a:	84 c0                	test   %al,%al
ffffff000010257c:	0f 84 6d 02 00 00    	je     ffffff00001027ef <kvsprintf+0x292>
ffffff0000102582:	3c 25                	cmp    $0x25,%al
ffffff0000102584:	74 0c                	je     ffffff0000102592 <kvsprintf+0x35>
ffffff0000102586:	41 88 04 24          	mov    %al,(%r12)
ffffff000010258a:	48 ff c5             	inc    %rbp
ffffff000010258d:	49 ff c4             	inc    %r12
ffffff0000102590:	eb e5                	jmp    ffffff0000102577 <kvsprintf+0x1a>
ffffff0000102592:	8a 45 01             	mov    0x1(%rbp),%al
ffffff0000102595:	3c 30                	cmp    $0x30,%al
ffffff0000102597:	74 06                	je     ffffff000010259f <kvsprintf+0x42>
ffffff0000102599:	48 83 c5 02          	add    $0x2,%rbp
ffffff000010259d:	eb 07                	jmp    ffffff00001025a6 <kvsprintf+0x49>
ffffff000010259f:	8a 45 02             	mov    0x2(%rbp),%al
ffffff00001025a2:	48 83 c5 03          	add    $0x3,%rbp
ffffff00001025a6:	8d 50 d0             	lea    -0x30(%rax),%edx
ffffff00001025a9:	80 fa 09             	cmp    $0x9,%dl
ffffff00001025ac:	77 09                	ja     ffffff00001025b7 <kvsprintf+0x5a>
ffffff00001025ae:	8a 45 00             	mov    0x0(%rbp),%al
ffffff00001025b1:	41 88 d6             	mov    %dl,%r14b
ffffff00001025b4:	48 ff c5             	inc    %rbp
ffffff00001025b7:	3c 6c                	cmp    $0x6c,%al
ffffff00001025b9:	0f 84 be 00 00 00    	je     ffffff000010267d <kvsprintf+0x120>
ffffff00001025bf:	7f 0e                	jg     ffffff00001025cf <kvsprintf+0x72>
ffffff00001025c1:	3c 63                	cmp    $0x63,%al
ffffff00001025c3:	0f 84 80 01 00 00    	je     ffffff0000102749 <kvsprintf+0x1ec>
ffffff00001025c9:	3c 64                	cmp    $0x64,%al
ffffff00001025cb:	74 13                	je     ffffff00001025e0 <kvsprintf+0x83>
ffffff00001025cd:	eb a8                	jmp    ffffff0000102577 <kvsprintf+0x1a>
ffffff00001025cf:	3c 75                	cmp    $0x75,%al
ffffff00001025d1:	74 44                	je     ffffff0000102617 <kvsprintf+0xba>
ffffff00001025d3:	3c 78                	cmp    $0x78,%al
ffffff00001025d5:	74 6a                	je     ffffff0000102641 <kvsprintf+0xe4>
ffffff00001025d7:	3c 73                	cmp    $0x73,%al
ffffff00001025d9:	75 9c                	jne    ffffff0000102577 <kvsprintf+0x1a>
ffffff00001025db:	e9 9d 01 00 00       	jmpq   ffffff000010277d <kvsprintf+0x220>
ffffff00001025e0:	8b 13                	mov    (%rbx),%edx
ffffff00001025e2:	83 fa 30             	cmp    $0x30,%edx
ffffff00001025e5:	73 0d                	jae    ffffff00001025f4 <kvsprintf+0x97>
ffffff00001025e7:	89 d0                	mov    %edx,%eax
ffffff00001025e9:	83 c2 08             	add    $0x8,%edx
ffffff00001025ec:	48 03 43 10          	add    0x10(%rbx),%rax
ffffff00001025f0:	89 13                	mov    %edx,(%rbx)
ffffff00001025f2:	eb 0c                	jmp    ffffff0000102600 <kvsprintf+0xa3>
ffffff00001025f4:	48 8b 43 08          	mov    0x8(%rbx),%rax
ffffff00001025f8:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffffff00001025fc:	48 89 53 08          	mov    %rdx,0x8(%rbx)
ffffff0000102600:	48 8b 38             	mov    (%rax),%rdi
ffffff0000102603:	ba 0a 00 00 00       	mov    $0xa,%edx
ffffff0000102608:	48 89 e6             	mov    %rsp,%rsi
ffffff000010260b:	48 b8 f4 28 10 00 00 	movabs $0xffffff00001028f4,%rax
ffffff0000102612:	ff ff ff 
ffffff0000102615:	eb 5f                	jmp    ffffff0000102676 <kvsprintf+0x119>
ffffff0000102617:	8b 13                	mov    (%rbx),%edx
ffffff0000102619:	83 fa 30             	cmp    $0x30,%edx
ffffff000010261c:	73 0d                	jae    ffffff000010262b <kvsprintf+0xce>
ffffff000010261e:	89 d0                	mov    %edx,%eax
ffffff0000102620:	83 c2 08             	add    $0x8,%edx
ffffff0000102623:	48 03 43 10          	add    0x10(%rbx),%rax
ffffff0000102627:	89 13                	mov    %edx,(%rbx)
ffffff0000102629:	eb 0c                	jmp    ffffff0000102637 <kvsprintf+0xda>
ffffff000010262b:	48 8b 43 08          	mov    0x8(%rbx),%rax
ffffff000010262f:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffffff0000102633:	48 89 53 08          	mov    %rdx,0x8(%rbx)
ffffff0000102637:	48 8b 38             	mov    (%rax),%rdi
ffffff000010263a:	ba 0a 00 00 00       	mov    $0xa,%edx
ffffff000010263f:	eb 28                	jmp    ffffff0000102669 <kvsprintf+0x10c>
ffffff0000102641:	8b 13                	mov    (%rbx),%edx
ffffff0000102643:	83 fa 30             	cmp    $0x30,%edx
ffffff0000102646:	73 0d                	jae    ffffff0000102655 <kvsprintf+0xf8>
ffffff0000102648:	89 d0                	mov    %edx,%eax
ffffff000010264a:	83 c2 08             	add    $0x8,%edx
ffffff000010264d:	48 03 43 10          	add    0x10(%rbx),%rax
ffffff0000102651:	89 13                	mov    %edx,(%rbx)
ffffff0000102653:	eb 0c                	jmp    ffffff0000102661 <kvsprintf+0x104>
ffffff0000102655:	48 8b 43 08          	mov    0x8(%rbx),%rax
ffffff0000102659:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffffff000010265d:	48 89 53 08          	mov    %rdx,0x8(%rbx)
ffffff0000102661:	48 8b 38             	mov    (%rax),%rdi
ffffff0000102664:	ba 10 00 00 00       	mov    $0x10,%edx
ffffff0000102669:	48 89 e6             	mov    %rsp,%rsi
ffffff000010266c:	48 b8 9f 28 10 00 00 	movabs $0xffffff000010289f,%rax
ffffff0000102673:	ff ff ff 
ffffff0000102676:	ff d0                	callq  *%rax
ffffff0000102678:	e9 9d 00 00 00       	jmpq   ffffff000010271a <kvsprintf+0x1bd>
ffffff000010267d:	80 7d 00 6c          	cmpb   $0x6c,0x0(%rbp)
ffffff0000102681:	74 08                	je     ffffff000010268b <kvsprintf+0x12e>
ffffff0000102683:	48 ff c5             	inc    %rbp
ffffff0000102686:	e9 ec fe ff ff       	jmpq   ffffff0000102577 <kvsprintf+0x1a>
ffffff000010268b:	8a 45 01             	mov    0x1(%rbp),%al
ffffff000010268e:	4c 8d 7d 02          	lea    0x2(%rbp),%r15
ffffff0000102692:	3c 75                	cmp    $0x75,%al
ffffff0000102694:	74 4a                	je     ffffff00001026e0 <kvsprintf+0x183>
ffffff0000102696:	3c 78                	cmp    $0x78,%al
ffffff0000102698:	0f 84 84 00 00 00    	je     ffffff0000102722 <kvsprintf+0x1c5>
ffffff000010269e:	3c 64                	cmp    $0x64,%al
ffffff00001026a0:	4c 89 fd             	mov    %r15,%rbp
ffffff00001026a3:	0f 85 ce fe ff ff    	jne    ffffff0000102577 <kvsprintf+0x1a>
ffffff00001026a9:	8b 13                	mov    (%rbx),%edx
ffffff00001026ab:	83 fa 30             	cmp    $0x30,%edx
ffffff00001026ae:	73 0d                	jae    ffffff00001026bd <kvsprintf+0x160>
ffffff00001026b0:	89 d0                	mov    %edx,%eax
ffffff00001026b2:	83 c2 08             	add    $0x8,%edx
ffffff00001026b5:	48 03 43 10          	add    0x10(%rbx),%rax
ffffff00001026b9:	89 13                	mov    %edx,(%rbx)
ffffff00001026bb:	eb 0c                	jmp    ffffff00001026c9 <kvsprintf+0x16c>
ffffff00001026bd:	48 8b 43 08          	mov    0x8(%rbx),%rax
ffffff00001026c1:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffffff00001026c5:	48 89 53 08          	mov    %rdx,0x8(%rbx)
ffffff00001026c9:	48 8b 38             	mov    (%rax),%rdi
ffffff00001026cc:	ba 0a 00 00 00       	mov    $0xa,%edx
ffffff00001026d1:	48 89 e6             	mov    %rsp,%rsi
ffffff00001026d4:	48 b8 74 29 10 00 00 	movabs $0xffffff0000102974,%rax
ffffff00001026db:	ff ff ff 
ffffff00001026de:	eb 35                	jmp    ffffff0000102715 <kvsprintf+0x1b8>
ffffff00001026e0:	8b 13                	mov    (%rbx),%edx
ffffff00001026e2:	83 fa 30             	cmp    $0x30,%edx
ffffff00001026e5:	73 0d                	jae    ffffff00001026f4 <kvsprintf+0x197>
ffffff00001026e7:	89 d0                	mov    %edx,%eax
ffffff00001026e9:	83 c2 08             	add    $0x8,%edx
ffffff00001026ec:	48 03 43 10          	add    0x10(%rbx),%rax
ffffff00001026f0:	89 13                	mov    %edx,(%rbx)
ffffff00001026f2:	eb 0c                	jmp    ffffff0000102700 <kvsprintf+0x1a3>
ffffff00001026f4:	48 8b 43 08          	mov    0x8(%rbx),%rax
ffffff00001026f8:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffffff00001026fc:	48 89 53 08          	mov    %rdx,0x8(%rbx)
ffffff0000102700:	ba 0a 00 00 00       	mov    $0xa,%edx
ffffff0000102705:	48 8b 38             	mov    (%rax),%rdi
ffffff0000102708:	48 89 e6             	mov    %rsp,%rsi
ffffff000010270b:	48 b8 1f 29 10 00 00 	movabs $0xffffff000010291f,%rax
ffffff0000102712:	ff ff ff 
ffffff0000102715:	4c 89 fd             	mov    %r15,%rbp
ffffff0000102718:	ff d0                	callq  *%rax
ffffff000010271a:	48 89 e0             	mov    %rsp,%rax
ffffff000010271d:	e9 8f 00 00 00       	jmpq   ffffff00001027b1 <kvsprintf+0x254>
ffffff0000102722:	8b 13                	mov    (%rbx),%edx
ffffff0000102724:	83 fa 30             	cmp    $0x30,%edx
ffffff0000102727:	73 0d                	jae    ffffff0000102736 <kvsprintf+0x1d9>
ffffff0000102729:	89 d0                	mov    %edx,%eax
ffffff000010272b:	83 c2 08             	add    $0x8,%edx
ffffff000010272e:	48 03 43 10          	add    0x10(%rbx),%rax
ffffff0000102732:	89 13                	mov    %edx,(%rbx)
ffffff0000102734:	eb 0c                	jmp    ffffff0000102742 <kvsprintf+0x1e5>
ffffff0000102736:	48 8b 43 08          	mov    0x8(%rbx),%rax
ffffff000010273a:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffffff000010273e:	48 89 53 08          	mov    %rdx,0x8(%rbx)
ffffff0000102742:	ba 10 00 00 00       	mov    $0x10,%edx
ffffff0000102747:	eb bc                	jmp    ffffff0000102705 <kvsprintf+0x1a8>
ffffff0000102749:	8b 13                	mov    (%rbx),%edx
ffffff000010274b:	49 8d 4c 24 01       	lea    0x1(%r12),%rcx
ffffff0000102750:	83 fa 30             	cmp    $0x30,%edx
ffffff0000102753:	73 0d                	jae    ffffff0000102762 <kvsprintf+0x205>
ffffff0000102755:	89 d0                	mov    %edx,%eax
ffffff0000102757:	83 c2 08             	add    $0x8,%edx
ffffff000010275a:	48 03 43 10          	add    0x10(%rbx),%rax
ffffff000010275e:	89 13                	mov    %edx,(%rbx)
ffffff0000102760:	eb 0c                	jmp    ffffff000010276e <kvsprintf+0x211>
ffffff0000102762:	48 8b 43 08          	mov    0x8(%rbx),%rax
ffffff0000102766:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffffff000010276a:	48 89 53 08          	mov    %rdx,0x8(%rbx)
ffffff000010276e:	48 8b 00             	mov    (%rax),%rax
ffffff0000102771:	41 88 04 24          	mov    %al,(%r12)
ffffff0000102775:	49 89 cc             	mov    %rcx,%r12
ffffff0000102778:	e9 fa fd ff ff       	jmpq   ffffff0000102577 <kvsprintf+0x1a>
ffffff000010277d:	8b 13                	mov    (%rbx),%edx
ffffff000010277f:	83 fa 30             	cmp    $0x30,%edx
ffffff0000102782:	73 0d                	jae    ffffff0000102791 <kvsprintf+0x234>
ffffff0000102784:	89 d0                	mov    %edx,%eax
ffffff0000102786:	83 c2 08             	add    $0x8,%edx
ffffff0000102789:	48 03 43 10          	add    0x10(%rbx),%rax
ffffff000010278d:	89 13                	mov    %edx,(%rbx)
ffffff000010278f:	eb 0c                	jmp    ffffff000010279d <kvsprintf+0x240>
ffffff0000102791:	48 8b 43 08          	mov    0x8(%rbx),%rax
ffffff0000102795:	48 8d 50 08          	lea    0x8(%rax),%rdx
ffffff0000102799:	48 89 53 08          	mov    %rdx,0x8(%rbx)
ffffff000010279d:	48 8b 00             	mov    (%rax),%rax
ffffff00001027a0:	48 ba 0f 31 10 00 00 	movabs $0xffffff000010310f,%rdx
ffffff00001027a7:	ff ff ff 
ffffff00001027aa:	48 85 c0             	test   %rax,%rax
ffffff00001027ad:	48 0f 44 c2          	cmove  %rdx,%rax
ffffff00001027b1:	48 89 c2             	mov    %rax,%rdx
ffffff00001027b4:	80 3a 00             	cmpb   $0x0,(%rdx)
ffffff00001027b7:	74 05                	je     ffffff00001027be <kvsprintf+0x261>
ffffff00001027b9:	48 ff c2             	inc    %rdx
ffffff00001027bc:	eb f6                	jmp    ffffff00001027b4 <kvsprintf+0x257>
ffffff00001027be:	49 0f be ce          	movsbq %r14b,%rcx
ffffff00001027c2:	48 01 c1             	add    %rax,%rcx
ffffff00001027c5:	48 39 ca             	cmp    %rcx,%rdx
ffffff00001027c8:	73 0e                	jae    ffffff00001027d8 <kvsprintf+0x27b>
ffffff00001027ca:	49 ff c4             	inc    %r12
ffffff00001027cd:	41 c6 44 24 ff 30    	movb   $0x30,-0x1(%r12)
ffffff00001027d3:	48 ff c2             	inc    %rdx
ffffff00001027d6:	eb ed                	jmp    ffffff00001027c5 <kvsprintf+0x268>
ffffff00001027d8:	8a 10                	mov    (%rax),%dl
ffffff00001027da:	84 d2                	test   %dl,%dl
ffffff00001027dc:	0f 84 95 fd ff ff    	je     ffffff0000102577 <kvsprintf+0x1a>
ffffff00001027e2:	49 ff c4             	inc    %r12
ffffff00001027e5:	48 ff c0             	inc    %rax
ffffff00001027e8:	41 88 54 24 ff       	mov    %dl,-0x1(%r12)
ffffff00001027ed:	eb e9                	jmp    ffffff00001027d8 <kvsprintf+0x27b>
ffffff00001027ef:	41 c6 04 24 00       	movb   $0x0,(%r12)
ffffff00001027f4:	4c 89 e0             	mov    %r12,%rax
ffffff00001027f7:	48 83 c4 28          	add    $0x28,%rsp
ffffff00001027fb:	5b                   	pop    %rbx
ffffff00001027fc:	4c 29 e8             	sub    %r13,%rax
ffffff00001027ff:	5d                   	pop    %rbp
ffffff0000102800:	41 5c                	pop    %r12
ffffff0000102802:	41 5d                	pop    %r13
ffffff0000102804:	41 5e                	pop    %r14
ffffff0000102806:	41 5f                	pop    %r15
ffffff0000102808:	c3                   	retq   

ffffff0000102809 <ksprintf>:
ffffff0000102809:	48 81 ec d8 00 00 00 	sub    $0xd8,%rsp
ffffff0000102810:	84 c0                	test   %al,%al
ffffff0000102812:	48 89 54 24 30       	mov    %rdx,0x30(%rsp)
ffffff0000102817:	48 89 4c 24 38       	mov    %rcx,0x38(%rsp)
ffffff000010281c:	4c 89 44 24 40       	mov    %r8,0x40(%rsp)
ffffff0000102821:	4c 89 4c 24 48       	mov    %r9,0x48(%rsp)
ffffff0000102826:	74 37                	je     ffffff000010285f <ksprintf+0x56>
ffffff0000102828:	0f 29 44 24 50       	movaps %xmm0,0x50(%rsp)
ffffff000010282d:	0f 29 4c 24 60       	movaps %xmm1,0x60(%rsp)
ffffff0000102832:	0f 29 54 24 70       	movaps %xmm2,0x70(%rsp)
ffffff0000102837:	0f 29 9c 24 80 00 00 	movaps %xmm3,0x80(%rsp)
ffffff000010283e:	00 
ffffff000010283f:	0f 29 a4 24 90 00 00 	movaps %xmm4,0x90(%rsp)
ffffff0000102846:	00 
ffffff0000102847:	0f 29 ac 24 a0 00 00 	movaps %xmm5,0xa0(%rsp)
ffffff000010284e:	00 
ffffff000010284f:	0f 29 b4 24 b0 00 00 	movaps %xmm6,0xb0(%rsp)
ffffff0000102856:	00 
ffffff0000102857:	0f 29 bc 24 c0 00 00 	movaps %xmm7,0xc0(%rsp)
ffffff000010285e:	00 
ffffff000010285f:	48 8d 84 24 e0 00 00 	lea    0xe0(%rsp),%rax
ffffff0000102866:	00 
ffffff0000102867:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
ffffff000010286c:	48 89 44 24 10       	mov    %rax,0x10(%rsp)
ffffff0000102871:	48 8d 44 24 20       	lea    0x20(%rsp),%rax
ffffff0000102876:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%rsp)
ffffff000010287d:	00 
ffffff000010287e:	c7 44 24 0c 30 00 00 	movl   $0x30,0xc(%rsp)
ffffff0000102885:	00 
ffffff0000102886:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
ffffff000010288b:	48 b8 5d 25 10 00 00 	movabs $0xffffff000010255d,%rax
ffffff0000102892:	ff ff ff 
ffffff0000102895:	ff d0                	callq  *%rax
ffffff0000102897:	48 81 c4 d8 00 00 00 	add    $0xd8,%rsp
ffffff000010289e:	c3                   	retq   

ffffff000010289f <kuitoa>:
ffffff000010289f:	41 89 d2             	mov    %edx,%r10d
ffffff00001028a2:	48 89 f1             	mov    %rsi,%rcx
ffffff00001028a5:	49 bb 16 31 10 00 00 	movabs $0xffffff0000103116,%r11
ffffff00001028ac:	ff ff ff 
ffffff00001028af:	89 f8                	mov    %edi,%eax
ffffff00001028b1:	31 d2                	xor    %edx,%edx
ffffff00001028b3:	4c 8d 49 01          	lea    0x1(%rcx),%r9
ffffff00001028b7:	41 f7 f2             	div    %r10d
ffffff00001028ba:	41 89 d0             	mov    %edx,%r8d
ffffff00001028bd:	85 c0                	test   %eax,%eax
ffffff00001028bf:	89 c7                	mov    %eax,%edi
ffffff00001028c1:	43 8a 14 03          	mov    (%r11,%r8,1),%dl
ffffff00001028c5:	41 88 51 ff          	mov    %dl,-0x1(%r9)
ffffff00001028c9:	74 05                	je     ffffff00001028d0 <kuitoa+0x31>
ffffff00001028cb:	4c 89 c9             	mov    %r9,%rcx
ffffff00001028ce:	eb df                	jmp    ffffff00001028af <kuitoa+0x10>
ffffff00001028d0:	c6 41 01 00          	movb   $0x0,0x1(%rcx)
ffffff00001028d4:	48 89 f2             	mov    %rsi,%rdx
ffffff00001028d7:	48 39 d1             	cmp    %rdx,%rcx
ffffff00001028da:	76 14                	jbe    ffffff00001028f0 <kuitoa+0x51>
ffffff00001028dc:	8a 02                	mov    (%rdx),%al
ffffff00001028de:	40 8a 39             	mov    (%rcx),%dil
ffffff00001028e1:	48 ff c2             	inc    %rdx
ffffff00001028e4:	48 ff c9             	dec    %rcx
ffffff00001028e7:	40 88 7a ff          	mov    %dil,-0x1(%rdx)
ffffff00001028eb:	88 41 01             	mov    %al,0x1(%rcx)
ffffff00001028ee:	eb e7                	jmp    ffffff00001028d7 <kuitoa+0x38>
ffffff00001028f0:	48 89 f0             	mov    %rsi,%rax
ffffff00001028f3:	c3                   	retq   

ffffff00001028f4 <kitoa>:
ffffff00001028f4:	83 fa 0a             	cmp    $0xa,%edx
ffffff00001028f7:	48 b8 9f 28 10 00 00 	movabs $0xffffff000010289f,%rax
ffffff00001028fe:	ff ff ff 
ffffff0000102901:	75 07                	jne    ffffff000010290a <kitoa+0x16>
ffffff0000102903:	89 f9                	mov    %edi,%ecx
ffffff0000102905:	c1 e9 1f             	shr    $0x1f,%ecx
ffffff0000102908:	75 02                	jne    ffffff000010290c <kitoa+0x18>
ffffff000010290a:	ff e0                	jmpq   *%rax
ffffff000010290c:	c6 06 2d             	movb   $0x2d,(%rsi)
ffffff000010290f:	f7 df                	neg    %edi
ffffff0000102911:	48 ff c6             	inc    %rsi
ffffff0000102914:	ba 0a 00 00 00       	mov    $0xa,%edx
ffffff0000102919:	ff d0                	callq  *%rax
ffffff000010291b:	48 ff c8             	dec    %rax
ffffff000010291e:	c3                   	retq   

ffffff000010291f <kulltoa>:
ffffff000010291f:	48 89 f1             	mov    %rsi,%rcx
ffffff0000102922:	41 89 d0             	mov    %edx,%r8d
ffffff0000102925:	49 ba 16 31 10 00 00 	movabs $0xffffff0000103116,%r10
ffffff000010292c:	ff ff ff 
ffffff000010292f:	48 89 f8             	mov    %rdi,%rax
ffffff0000102932:	31 d2                	xor    %edx,%edx
ffffff0000102934:	4c 8d 49 01          	lea    0x1(%rcx),%r9
ffffff0000102938:	49 f7 f0             	div    %r8
ffffff000010293b:	41 8a 14 12          	mov    (%r10,%rdx,1),%dl
ffffff000010293f:	48 85 c0             	test   %rax,%rax
ffffff0000102942:	48 89 c7             	mov    %rax,%rdi
ffffff0000102945:	41 88 51 ff          	mov    %dl,-0x1(%r9)
ffffff0000102949:	74 05                	je     ffffff0000102950 <kulltoa+0x31>
ffffff000010294b:	4c 89 c9             	mov    %r9,%rcx
ffffff000010294e:	eb df                	jmp    ffffff000010292f <kulltoa+0x10>
ffffff0000102950:	c6 41 01 00          	movb   $0x0,0x1(%rcx)
ffffff0000102954:	48 89 f2             	mov    %rsi,%rdx
ffffff0000102957:	48 39 d1             	cmp    %rdx,%rcx
ffffff000010295a:	76 14                	jbe    ffffff0000102970 <kulltoa+0x51>
ffffff000010295c:	8a 02                	mov    (%rdx),%al
ffffff000010295e:	40 8a 39             	mov    (%rcx),%dil
ffffff0000102961:	48 ff c2             	inc    %rdx
ffffff0000102964:	48 ff c9             	dec    %rcx
ffffff0000102967:	40 88 7a ff          	mov    %dil,-0x1(%rdx)
ffffff000010296b:	88 41 01             	mov    %al,0x1(%rcx)
ffffff000010296e:	eb e7                	jmp    ffffff0000102957 <kulltoa+0x38>
ffffff0000102970:	48 89 f0             	mov    %rsi,%rax
ffffff0000102973:	c3                   	retq   

ffffff0000102974 <klltoa>:
ffffff0000102974:	83 fa 0a             	cmp    $0xa,%edx
ffffff0000102977:	48 b8 1f 29 10 00 00 	movabs $0xffffff000010291f,%rax
ffffff000010297e:	ff ff ff 
ffffff0000102981:	75 09                	jne    ffffff000010298c <klltoa+0x18>
ffffff0000102983:	48 89 f9             	mov    %rdi,%rcx
ffffff0000102986:	48 c1 e9 3f          	shr    $0x3f,%rcx
ffffff000010298a:	75 02                	jne    ffffff000010298e <klltoa+0x1a>
ffffff000010298c:	ff e0                	jmpq   *%rax
ffffff000010298e:	c6 06 2d             	movb   $0x2d,(%rsi)
ffffff0000102991:	48 f7 df             	neg    %rdi
ffffff0000102994:	48 ff c6             	inc    %rsi
ffffff0000102997:	ba 0a 00 00 00       	mov    $0xa,%edx
ffffff000010299c:	ff d0                	callq  *%rax
ffffff000010299e:	48 ff c8             	dec    %rax
ffffff00001029a1:	c3                   	retq   
ffffff00001029a2:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
ffffff00001029a9:	00 00 00 
ffffff00001029ac:	0f 1f 40 00          	nopl   0x0(%rax)

ffffff00001029b0 <_ZN7utility13fifo_spinlock6unlockEv>:
ffffff00001029b0:	f0 83 47 08 01       	lock addl $0x1,0x8(%rdi)
ffffff00001029b5:	c3                   	retq   
ffffff00001029b6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
ffffff00001029bd:	00 00 00 

ffffff00001029c0 <_ZN7utility13fifo_spinlock8try_lockEv>:
ffffff00001029c0:	8b 57 08             	mov    0x8(%rdi),%edx
ffffff00001029c3:	31 c0                	xor    %eax,%eax
ffffff00001029c5:	48 8d 77 08          	lea    0x8(%rdi),%rsi
ffffff00001029c9:	89 d1                	mov    %edx,%ecx
ffffff00001029cb:	c1 f9 10             	sar    $0x10,%ecx
ffffff00001029ce:	66 39 ca             	cmp    %cx,%dx
ffffff00001029d1:	74 05                	je     ffffff00001029d8 <_ZN7utility13fifo_spinlock8try_lockEv+0x18>
ffffff00001029d3:	f3 c3                	repz retq 
ffffff00001029d5:	0f 1f 00             	nopl   (%rax)
ffffff00001029d8:	f0 81 06 00 00 01 00 	lock addl $0x10000,(%rsi)
ffffff00001029df:	b8 01 00 00 00       	mov    $0x1,%eax
ffffff00001029e4:	c3                   	retq   
ffffff00001029e5:	90                   	nop
ffffff00001029e6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
ffffff00001029ed:	00 00 00 

ffffff00001029f0 <_ZN7utility13fifo_spinlock4lockEv>:
ffffff00001029f0:	48 83 c7 08          	add    $0x8,%rdi
ffffff00001029f4:	b8 00 00 01 00       	mov    $0x10000,%eax
ffffff00001029f9:	f0 0f c1 07          	lock xadd %eax,(%rdi)
ffffff00001029fd:	89 c1                	mov    %eax,%ecx
ffffff00001029ff:	c1 f9 10             	sar    $0x10,%ecx
ffffff0000102a02:	66 39 c1             	cmp    %ax,%cx
ffffff0000102a05:	89 ca                	mov    %ecx,%edx
ffffff0000102a07:	74 10                	je     ffffff0000102a19 <_ZN7utility13fifo_spinlock4lockEv+0x29>
ffffff0000102a09:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
ffffff0000102a10:	f3 90                	pause  
ffffff0000102a12:	8b 07                	mov    (%rdi),%eax
ffffff0000102a14:	66 39 c2             	cmp    %ax,%dx
ffffff0000102a17:	75 f7                	jne    ffffff0000102a10 <_ZN7utility13fifo_spinlock4lockEv+0x20>
ffffff0000102a19:	f3 c3                	repz retq 
ffffff0000102a1b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

ffffff0000102a20 <_GLOBAL__sub_I__ZN4arch14arch_data_lockE>:
ffffff0000102a20:	48 b8 50 31 10 00 00 	movabs $0xffffff0000103150,%rax
ffffff0000102a27:	ff ff ff 
ffffff0000102a2a:	48 a3 10 33 10 00 00 	movabs %rax,0xffffff0000103310
ffffff0000102a31:	ff ff ff 
ffffff0000102a34:	48 b8 18 33 10 00 00 	movabs $0xffffff0000103318,%rax
ffffff0000102a3b:	ff ff ff 
ffffff0000102a3e:	c7 00 00 00 00 00    	movl   $0x0,(%rax)
ffffff0000102a44:	0f ae f0             	mfence 
ffffff0000102a47:	c3                   	retq   
