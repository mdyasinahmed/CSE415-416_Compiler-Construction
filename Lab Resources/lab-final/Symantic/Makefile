input = input.txt
output = output.txt

main: cal.l cal.y
	bison -d cal.y
	flex cal.l
	gcc cal.tab.c lex.yy.c
	./a.exe <$(input)> $(output)

clean:
	rm -f lex.yy.c cal.tab.c cal.tab.h a.exe $(output)