all:
	gcc -o palindrome palindrome.c
	gcc -E -o palindrome.i palindrome.c
	gcc -S -o palindrome.s palindrome.c
	gcc -c -o palindrome.o palindrome.c
	objdump -M intel -d palindrome.o > palindrome.asm
