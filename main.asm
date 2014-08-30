extern getchar
extern putchar
extern printint
extern scanint

global	_start

section .text
_start:
	sub esp, 4
	call scanint
	call printint
	
	mov ebx, 0
	mov eax, 1	; exit
	int 0x80
