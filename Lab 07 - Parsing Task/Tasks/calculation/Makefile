mycalc: calc.l calc.y
	bison -d calc.y
	flex calc.l
	gcc -o mycalc.exe calc.tab.c lex.yy.c -lfl

run:
	mycalc.exe
clean:
	rm -f mycalc.exe calc.tab.c calc.tab.h lex.yy.c