all:
	gcc -o three_sum three_sum.c
	gcc -E -o three_sum.i three_sum.c
	gcc -S -o three_sum.s three_sum.c
	gcc -c -o three_sum.o three_sum.c
	objdump -M intel -d three_sum.o > three_sum.asm
