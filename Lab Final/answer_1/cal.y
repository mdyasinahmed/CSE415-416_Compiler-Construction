%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex();
void yyerror(const char *s);
%}

%union {
    char *str;
    int num;
}

%token <str> IDENT STRING
%token <num> NUMBER
%token INCLUDE HEADER INT CHAR FOR IF ELSE RETURN PRINTF SCANF
%token EQ NEQ GE LE AND OR INCR QMARK COLON

%right QMARK COLON

%start program

%%

program
    : INCLUDE HEADER main_func
    ;

main_func
    : INT IDENT '(' ')' compound_stmt
    ;

compound_stmt
    : '{' statement_list '}'
    ;

statement_list
    : /* empty */
    | statement_list statement
    ;

statement
    : declaration
    | for_loop
    | if_block
    | printf_stmt
    | scanf_stmt
    | RETURN expression ';'
    | compound_stmt
    | ';'
    ;

declaration
    : INT var_list ';'
    | CHAR pointer_array_decl ';'
    ;

pointer_array_decl
    : '*' IDENT '[' ']' '=' '{' string_list '}'
    | '*' IDENT '[' NUMBER ']' '=' '{' string_list '}'
    ;

var_list
    : IDENT
    | IDENT ',' var_list
    ;

string_list
    : STRING
    | STRING ',' string_list
    ;

for_loop
    : FOR '(' INT IDENT '=' NUMBER ';' condition ';' IDENT INCR ')' statement
    | FOR '(' expression ';' condition ';' expression ')' statement
    ;

condition
    : expression relop expression
    | expression
    ;

relop
    : EQ | NEQ | GE | LE | '>' | '<'
    ;

expression
    : IDENT
    | NUMBER
    | STRING
    | IDENT '+' IDENT
    | IDENT '*' IDENT
    | IDENT '%' NUMBER
    | IDENT '*' IDENT '*' IDENT
    | IDENT '[' expression ']'
    | expression '+' expression
    | expression '*' expression
    | expression '%' expression
    | expression relop expression
    | expression QMARK expression COLON expression
    ;

if_block
    : IF '(' condition ')' statement
    | IF '(' condition ')' statement ELSE statement
    ;

printf_stmt
    : PRINTF '(' STRING ')' ';'
    | PRINTF '(' STRING ',' arg_list ')' ';'
    ;

scanf_stmt
    : SCANF '(' STRING ',' '&' IDENT ')' ';'
    ;

arg_list
    : expression
    | expression ',' arg_list
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    if (yyparse() == 0) {
        printf("Parsing Done.\n");
    }
    return 0;
}
