%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%union {
    int num;
    char* id;
}

%token <num> NUM
%token <id> ID
%token INT FOR IF RETURN PRINTF
%token ASSIGN PLUS MOD LT EQ NEQ
%token LPAREN RPAREN LBRACE RBRACE SEMI
%token COMMA STRING DIV LE BREAK PLUSPLUS

%start program

%%

program:
    main_function
    ;

main_function:
    INT ID LPAREN RPAREN LBRACE declarations prime_loop PRINTF LPAREN STRING COMMA ID RPAREN SEMI RETURN NUM SEMI RBRACE
    ;

declarations:
    declaration declarations
    | declaration
    ;

declaration:
    INT ID SEMI
    | INT ID ASSIGN NUM SEMI
    ;

prime_loop:
    FOR LPAREN ID ASSIGN NUM SEMI ID LE NUM SEMI ID PLUSPLUS RPAREN LBRACE
        ID ASSIGN NUM SEMI
        inner_loop
        IF LPAREN ID RPAREN LBRACE
            ID ASSIGN ID PLUS ID SEMI
        RBRACE
    RBRACE
    ;

inner_loop:
    FOR LPAREN ID ASSIGN NUM SEMI ID LE ID DIV NUM SEMI ID PLUSPLUS RPAREN LBRACE
        IF LPAREN ID MOD ID EQ NUM RPAREN LBRACE
            ID ASSIGN NUM SEMI
            BREAK SEMI
        RBRACE
    RBRACE
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Syntax error: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}
