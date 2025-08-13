input = input.txt
output = output.txt

main: cal.l cal.y
	bison -d -v cal.y
	flex cal.l
	gcc cal.tab.c lex.yy.c
	./a.exe <$(input)> $(output)
