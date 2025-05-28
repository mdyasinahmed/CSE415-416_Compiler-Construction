all:
	gcc -o seperation seperation.c
	gcc -E -o seperation.i seperation.c
	gcc -S -o seperation.s seperation.c
	gcc -c -o seperation.o seperation.c
	objdump -M intel -d seperation.o > seperation.asm
