%{
#include <stdio.h>
#include <stdlib.h>
%}

%token IF ELSE ID NUM EQ GT LT ASSIGN SEMI

%%

program:
    statement
    ;

statement:
      IF condition statement ELSE statement { printf("IF-ELSE matched\n"); }
    | IF condition statement                { printf("IF matched\n"); }
    | ID SEMI                               { printf("Simple statement\n"); }
    ;

condition:
      ID GT NUM
    | ID LT NUM
    | ID EQ NUM
    ;

%%

int main() {
    printf("Enter an if-else statement:\n");
    yyparse();
    return 0;
}

int yyerror(char *s) {
    printf("Syntax Error: %s\n", s);
    return 0;
}
