all:
	gcc -o factorial factorial.c
	gcc -E -o factorial.i factorial.c
	gcc -S -o factorial.s factorial.c
	gcc -c -o factorial.o factorial.c
	objdump -M intel -d factorial.o > factorial.asm
