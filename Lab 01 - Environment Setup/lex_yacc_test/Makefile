all:
	bison -d calc.y
	flex calc.l
	gcc -o calc calc.tab.c lex.yy.c -lfl

clean:
	rm -f calc calc.tab.c calc.tab.h lex.yy.c
