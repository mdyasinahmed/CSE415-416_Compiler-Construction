%{
#include<stdio.h>
void yyerror(char *s);
int yylex();
%}

%token NUM ADD SUB MUL DIV
%start exp 

%%

exp : NUM ADD NUM ADD NUM ADD NUM ;

%%

void yyerror(char *s)
{
    fprintf(stderr, "error: %s", s);
}

int main()
{
    yyparse();
    printf("Parsing Finished\n");
}

