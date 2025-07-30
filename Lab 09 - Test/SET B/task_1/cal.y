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
%token INT MAIN PRINTF SCANF RETURN IF ELSE DO WHILE
%token EQ NEQ ASSIGN MOD DIV MULT PLUS
%token LPAREN RPAREN LBRACE RBRACE SEMI COMMA
%token AMP STRING

%start program

%%

program:
    INT MAIN LPAREN RPAREN LBRACE statements RBRACE
    ;

statements:
    statements statement
    | statement
    ;

statement:
    declaration
    | assignment
    | print_stmt
    | scan_stmt
    | do_while_loop
    | if_else
    | return_stmt
    ;

declaration:
    INT id_list SEMI
    ;

id_list:
    ID
    | ID ASSIGN expression
    | id_list COMMA ID
    | id_list COMMA ID ASSIGN expression
    ;

assignment:
    ID ASSIGN expression SEMI
    ;

print_stmt:
    PRINTF LPAREN STRING RPAREN SEMI
    | PRINTF LPAREN STRING COMMA ID RPAREN SEMI
    ;

scan_stmt:
    SCANF LPAREN STRING COMMA AMP ID RPAREN SEMI
    ;

expression:
    NUM
    | ID
    | expression PLUS expression
    | expression MULT expression
    | expression DIV expression
    | expression MOD expression
    ;

do_while_loop:
    DO LBRACE statements RBRACE WHILE LPAREN condition RPAREN SEMI
    ;

condition:
    expression EQ expression
    | expression NEQ expression
    ;

if_else:
    IF LPAREN condition RPAREN LBRACE statements RBRACE ELSE LBRACE statements RBRACE
    ;

return_stmt:
    RETURN NUM SEMI
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Syntax error: %s\n", s);
}

int main() {
    yyparse();
    printf("Task-1 Parsing Done.\n");
    return 0;
}
