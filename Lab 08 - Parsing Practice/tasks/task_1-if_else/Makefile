input = input.txt
output = output.txt

main: cal.l cal.y
	bison -d cal.y                    # Generates cal.tab.c and cal.tab.h
	flex cal.l                        # Generates lex.yy.c (uses cal.tab.h)
	gcc cal.tab.c lex.yy.c -o a.exe   # Compiles everything
	./a.exe < $(input) > $(output)    # Run with input/output redirection
	@echo "Parsing Done"
