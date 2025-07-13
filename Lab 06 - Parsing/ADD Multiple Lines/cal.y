%{
#include<stdio.h>
void yyerror(char *s);
int yylex();
%}

%token NUM ADD SUB MUL DIV
%start exp 

%%
exp : exp exp | ;
exp : exp ADD term 
    | exp SUB term
    | term ;
term : NUM ;

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

