run: link
	./main

getchar: getchar.asm
	nasm -f elf getchar.asm

putchar: putchar.asm
	nasm -f elf putchar.asm

printint: printint.asm
	nasm -f elf printint.asm

scanint: scanint.asm
	nasm -f elf scanint.asm

main: main.asm
	nasm -f elf main.asm

link: printint scanint getchar putchar main
	ld -m elf_i386 -s -o main main.o scanint.o getchar.o putchar.o printint.o
