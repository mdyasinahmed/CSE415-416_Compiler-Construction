%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
extern int yylex();
extern int yyparse();
extern FILE *yyin;
void yyerror(const char *s);
%}

%union {
    int ival;
    char *sval;
}

%token <sval> ID STRING_LITERAL
%token <ival> INTEGER CHARACTER_LITERAL
%token INT CHAR DOUBLE
%token IF ELSE WHILE DO RETURN
%token SWITCH CASE DEFAULT BREAK
%token EQ NE

%nonassoc "no else"
%nonassoc ELSE
%right '='
%left EQ NE
%left '+' '-'
%left '*' '/' '%'
%right '^'

%start program

%%

program:
    function_definition
    ;

function_definition:
    type_specifier ID '(' ')' statement
    ;

type_specifier:
    INT
    | CHAR
    | DOUBLE
    ;

statement:
    type_specifier init_declarator_list ';'
    | expression ';'
    | ';'
    | '{' statement_list '}'
    | IF '(' expression ')' statement %prec "no else"
    | IF '(' expression ')' statement ELSE statement
    | SWITCH '(' expression ')' statement
    | DO statement WHILE '(' expression ')' ';'
    | RETURN expression ';'
    | BREAK ';'
    | CASE constant_expression ':' statement
    | DEFAULT ':' statement
    ;

statement_list:
    | statement_list statement
    ;

init_declarator_list:
    init_declarator
    | init_declarator_list ',' init_declarator
    ;

init_declarator:
    ID
    | ID '=' expression
    ;

expression:
    assignment_expression
    ;

assignment_expression:
    equality_expression
    | ID '=' assignment_expression
    ;

equality_expression:
    additive_expression
    | equality_expression EQ additive_expression
    | equality_expression NE additive_expression
    ;

additive_expression:
    multiplicative_expression
    | additive_expression '+' multiplicative_expression
    | additive_expression '-' multiplicative_expression
    ;

multiplicative_expression:
    power_expression
    | multiplicative_expression '*' power_expression
    | multiplicative_expression '/' power_expression
    | multiplicative_expression '%' power_expression
    ;

power_expression:
    unary_expression
    | power_expression '^' unary_expression
    ;

unary_expression:
    postfix_expression
    | '&' ID
    ;

postfix_expression:
    primary_expression
    | ID '(' argument_list ')'
    ;

primary_expression:
    ID
    | constant_expression
    | STRING_LITERAL
    | '(' expression ')'
    ;

constant_expression:
    INTEGER
    | CHARACTER_LITERAL
    ;

argument_list:
    expression
    | argument_list ',' expression
    ;

%%

void yyerror(const char *s) {
    extern int yylineno;
    fprintf(stderr, "Parse error on line %d: %s\n", yylineno, s);
}

int main(int argc, char **argv) {
    if (argc > 1) {
        yyin = fopen(argv[1], "r");
        if (!yyin) {
            perror(argv[1]);
            return 1;
        }
    }
    if (yyparse() == 0) {
        printf("Parse successful: Program structure is valid.\n");
    } else {
        printf("Parse failed: Program structure is invalid.\n");
    }
    return 0;
}