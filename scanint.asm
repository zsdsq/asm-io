extern getchar
extern putchar

global scanint

section	.text
scanint:
	push ebp
	mov	ebp, esp

	pushad
	pushf

	sub esp, 2
	mov byte [esp+1], 0;
	mov dword [ebp+8], 0
	mov ecx, 10 ; max len 10
	mov ebx, 10
.lp:
	call getchar

	cmp eax, 1
	jne .setsign

	cmp byte [esp], '-'
	jne .adddigit
	mov byte [esp+1], 1;
	loop .lp
.adddigit:
	mov eax, [ebp+8]
	mul ebx

	sub byte [esp], '0'

	xor edx, edx
	mov dl, [esp]
	add eax, edx

	mov [ebp+8], eax
	loop .lp

.setsign:
	cmp byte [esp+1], 1
	jne .quit
	neg dword [ebp+8]
.quit:
	add esp, 2
	popf
	popad
	
	pop ebp
	
	ret
