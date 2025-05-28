all:
	gcc -o two_sum two_sum.c
	gcc -E -o two_sum.i two_sum.c
	gcc -S -o two_sum.s two_sum.c
	gcc -c -o two_sum.o two_sum.c
	objdump -M intel -d two_sum.o > two_sum.asm
