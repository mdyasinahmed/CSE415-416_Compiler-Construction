%{
#include <stdio.h>
int yylex();
void yyerror(const char* s) { printf("Error: %s\n", s); }
%}

%token INT RETURN IF ELSE FOR SWITCH CASE DEFAULT BREAK PRINTF MAIN
%token ID NUMBER OP
%token LPAREN RPAREN LBRACE RBRACE SEMICOLON COMMA

%%
program:
      program statement
    | /* empty */
    ;

statement:
      INT ID SEMICOLON
    | INT ID '=' NUMBER SEMICOLON
    | IF LPAREN expr RPAREN statement
    | IF LPAREN expr RPAREN statement ELSE statement
    | FOR LPAREN expr SEMICOLON expr SEMICOLON expr RPAREN statement
    | SWITCH LPAREN ID RPAREN LBRACE cases RBRACE
    | RETURN expr SEMICOLON
    | PRINTF LPAREN ID RPAREN SEMICOLON
    | ID LPAREN args RPAREN SEMICOLON
    | INT ID LPAREN params RPAREN LBRACE statement RBRACE
    | INT ID '[' NUMBER ']' '=' LBRACE array_values RBRACE SEMICOLON
    ;

cases:
      cases CASE NUMBER ':' statement BREAK SEMICOLON
    | DEFAULT ':' statement
    ;

expr:
      ID
    | NUMBER
    | expr OP expr
    ;

params:
      INT ID
    | params COMMA INT ID
    | /* empty */
    ;

args:
      ID
    | args COMMA ID
    | /* empty */
    ;

array_values:
      NUMBER
    | array_values COMMA NUMBER
    ;
%%
int main() {
    yyparse();
    return 0;
}
