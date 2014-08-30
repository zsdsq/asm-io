global getchar

section	.text
getchar:
	push ebp
	mov	ebp, esp

	push edx
	push ecx
	push ebx
	pushf
	
	mov	eax, 3		; read
	mov	ebx, 0		; stdin
	lea ecx, [ebp+8]; set buff from stack arg
	mov	edx, 1		; read 1 byte
	int 0x80

	popf
	pop ebx
	pop ecx
	pop	edx
	
	pop ebp
	
	ret
