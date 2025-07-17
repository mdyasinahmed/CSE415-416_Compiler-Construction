INPUT = input.txt
OUTPUT = output.txt

all: main

main: parser
	./parser < $(INPUT) > $(OUTPUT)

parser: cal.tab.c lex.yy.c
	gcc cal.tab.c lex.yy.c -o parser

cal.tab.c cal.tab.h: cal.y
	bison -d cal.y

lex.yy.c: cal.l cal.tab.h
	flex cal.l

clean:
	rm -f cal.tab.c cal.tab.h lex.yy.c parser $(OUTPUT)
