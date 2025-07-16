input = input.txt
output = output.txt

all: parser

parser: cal.tab.c lex.yy.c
	gcc cal.tab.c lex.yy.c -o parser

cal.tab.c cal.tab.h: cal.y
	bison -d cal.y

lex.yy.c: cal.l cal.tab.h
	flex cal.l

run: parser
	./parser < $(input) > $(output)

clean:
	del lex.yy.c cal.tab.c cal.tab.h parser output.txt 2>nul
