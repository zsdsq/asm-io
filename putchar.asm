global putchar

section	.text
putchar:
	push ebp
	mov	ebp, esp

	push edx
	push ecx
	push ebx
	pushf
	
	mov	eax, 4		; write
	mov	ebx, 1		; stout
	lea ecx, [ebp+8];
	mov	edx, 1		; write 1 byte
	int 0x80

	popf
	pop ebx
	pop ecx
	pop	edx
	
	pop ebp
	
	ret
