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

%token PRINTF SCANF IF ELSE
%token LPAREN RPAREN LBRACE RBRACE SEMICOLON COLON COMMA
%token NUMBER STRING
%token NEQ
%token POW
%token <ival> SWITCH CASE DEFAULT BREAK ASSIGN
%token <ival> PLUS MINUS MUL DIV POWER
%token <cval> CHAR_CONST
%token <id> ID

%%

program:
      SWITCH LPAREN ID RPAREN LBRACE case_list default_case RBRACE
    ;

case_list:
      case_list case_stmt
    | /* empty */
    ;

case_stmt:
      CASE CHAR_CONST COLON stmt_list BREAK SEMICOLON
    ;

default_case:
      DEFAULT COLON stmt_list
    ;

stmt_list:
      stmt_list stmt
    | /* empty */
    ;

stmt:
      ID ASSIGN expr SEMICOLON
    | PRINTF LPAREN STRING RPAREN SEMICOLON
    | IF LPAREN expr NEQ NUMBER RPAREN stmt ELSE stmt
    ;

expr:
      expr PLUS expr
    | expr MINUS expr
    | expr MUL expr
    | expr DIV expr
    | POW LPAREN expr COMMA expr RPAREN
    | ID
    | NUMBER
    ;

%%

int main() {
    yyparse();
    printf("Parsing completed.\n");
    return 0;
}

int yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}
