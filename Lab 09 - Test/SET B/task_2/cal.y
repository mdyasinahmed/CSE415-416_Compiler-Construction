%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

double a, b, result;
char op;

int yylex(void);
int yyerror(char *s);
%}

%union {
    int ival;
    char cval;
    char *id;
    double dval;
}

%token <ival> INT CHAR DOUBLE RETURN MAIN
%token <id> ID
%token <cval> CHAR_CONST
%token <dval> NUMBER
%token <id> STRING

%token IF ELSE SCANF PRINTF
%token SWITCH CASE DEFAULT BREAK
%token ASSIGN PLUS MINUS MUL DIV POWER
%token NEQ AMP
%token LPAREN RPAREN LBRACE RBRACE SEMICOLON COLON COMMA

%start program

%%

program:
      INT MAIN LPAREN RPAREN LBRACE declarations statements RBRACE
    ;

declarations:
      declarations declaration
    | declaration
    ;

declaration:
      CHAR ID SEMICOLON
    | DOUBLE id_list SEMICOLON
    ;

id_list:
      ID
    | id_list COMMA ID
    ;

statements:
      statements statement
    | statement
    ;

statement:
      scan_stmt
    | print_stmt
    | assign_stmt
    | switch_stmt
    | return_stmt
    | if_stmt
    ;

scan_stmt:
      SCANF LPAREN STRING COMMA AMP ID RPAREN SEMICOLON
    ;

print_stmt:
      PRINTF LPAREN STRING RPAREN SEMICOLON
    | PRINTF LPAREN STRING COMMA ID RPAREN SEMICOLON
    ;

assign_stmt:
      ID ASSIGN expr SEMICOLON
    ;

switch_stmt:
      SWITCH LPAREN ID RPAREN LBRACE case_list default_case RBRACE
    ;

case_list:
      case_list case_stmt
    | case_stmt
    ;

case_stmt:
      CASE CHAR_CONST COLON statements BREAK SEMICOLON
    ;

default_case:
      DEFAULT COLON statements
    ;

return_stmt:
      RETURN NUMBER SEMICOLON
    ;

if_stmt:
      IF LPAREN expr NEQ NUMBER RPAREN statement
    | IF LPAREN expr NEQ NUMBER RPAREN statement ELSE statement
    ;

expr:
      expr PLUS expr
    | expr MINUS expr
    | expr MUL expr
    | expr DIV expr
    | POWER LPAREN expr COMMA expr RPAREN
    | ID
    | NUMBER
    ;

%%

int main() {
    yyparse();
    printf("Task-2 Parsing Done.\n");
    return 0;
}

int yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}
