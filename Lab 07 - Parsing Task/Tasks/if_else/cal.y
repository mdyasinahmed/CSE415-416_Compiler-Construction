%{
#include <stdio.h>
#include <stdlib.h>
int yylex(void);
void yyerror(const char *s);
%}

%token IF ELSE INT RETURN SCANF PRINTF MAIN
%token EQ ASSIGN MOD LPAREN RPAREN LBRACE RBRACE SEMI COMMA
%token QUOTE NEWLINE NUMBER ID

%%

program
    : /* empty */
    | program statement
    ;

statement
    : IF LPAREN expr RPAREN statement
    | IF LPAREN expr RPAREN statement ELSE statement
    | LBRACE program RBRACE
    | expr SEMI
    | RETURN expr SEMI
    | INT ID SEMI
    | INT ID ASSIGN expr SEMI
    | SCANF LPAREN QUOTE COMMA ID RPAREN SEMI
    | PRINTF LPAREN QUOTE COMMA expr RPAREN SEMI
    ;

expr
    : NUMBER
    | ID
    | expr EQ expr
    | expr MOD expr
    | expr ASSIGN expr
    | LPAREN expr RPAREN
    ;

%%

int main(int argc, char **argv)
{
    yyparse();
    return 0;
}

void yyerror(const char *s)
{
    fprintf(stderr, "Error: %s\n", s);
}