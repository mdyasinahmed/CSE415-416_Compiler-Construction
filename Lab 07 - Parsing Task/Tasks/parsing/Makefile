all: run

run: parser
	./parser

parser: parser.tab.c lex.yy.c
	gcc -o parser parser.tab.c lex.yy.c -lm

parser.tab.c parser.tab.h: parser.y
	bison -d parser.y

lex.yy.c: parser.l
	flex parser.l

clean:
	del *.exe *.o *.tab.* lex.yy.c output.txt
