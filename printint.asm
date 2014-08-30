global printint

section	.text
printint:
	push ebp
	mov	ebp, esp

	pushad
	pushf

	sub esp, 11
	mov edi, esp

	mov eax, [ebp+8]
	xor ecx, ecx
	mov ebx, 10

	test eax, eax
	jns .cycle
	xor eax, 0xFFFFFFFF
	add eax, 1
	
	mov byte [edi], '-'
	lea edi, [edi+1]
	
.cycle:
	xor edx, edx
	div ebx	
	push edx
	inc ecx 
	cmp eax, 0
	je .makestr
	jmp .cycle
.makestr:
	mov edx, ecx
	cld
.lp:
	pop eax
	add eax, '0'
	stosb
	loop .lp

	cmp byte [esp], '-'
	jne .print
	add edx, 1
.print
	mov	eax, 4		; write
	mov	ebx, 1		; stout
	mov ecx, esp
	int 0x80

	add esp, 11

	popf
	popad
	
	pop ebp
	
	ret
