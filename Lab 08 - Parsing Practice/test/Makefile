input = input.txt
output = output.txt

all: cal

cal: cal.y cal.l
	bison -d cal.y
	flex cal.l
	gcc -o cal cal.tab.c lex.yy.c -ll

run: cal
	./cal < $(input) > $(output)

clean:
	rm -f cal lex.yy.c cal.tab.c cal.tab.h $(output)
