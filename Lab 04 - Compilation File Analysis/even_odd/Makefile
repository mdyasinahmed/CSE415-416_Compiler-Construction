all:
	gcc -o even_odd even_odd.c
	gcc -E -o even_odd.i even_odd.c
	gcc -S -o even_odd.s even_odd.c
	gcc -c -o even_odd.o even_odd.c
	objdump -M intel -d even_odd.o > even_odd.asm
