%{
#include <stdio.h>
void yyerror(char *s);
int yylex();
%}

%token INT_TYPE FLOAT_TYPE SWITCH CASE DEFAULT BREAK RETURN FOR IF ELSE
%token ID NUM 
%token LB RB LP RP SEMI COLON COMMA
%token DIV MUL PLUS MINUS ASSIGN
%token LT GT

%start program

%%

program:
    stmt_list
    ;

stmt_list:
      stmt_list stmt
    | 
    ;

stmt:
      INT_TYPE decl_list SEMI
    | FLOAT_TYPE decl_list SEMI
    | assignment SEMI
    | for_stmt
    | if_stmt
    | SWITCH LP expr RP LB case_list_opt RB
    | BREAK SEMI
    | RETURN expr SEMI
    ;

decl_list:
      decl_list COMMA decl
    | decl
    ;

decl:
      ID
    | ID ASSIGN expr
    ;

assignment:
      ID ASSIGN expr
    ;

for_stmt:
      FOR LP for_init SEMI expr SEMI assignment RP LB stmt_list RB
    ;

for_init:
      INT_TYPE ID ASSIGN expr
    | assignment
    ;

if_stmt:
      IF LP expr RP LB stmt_list RB else_opt
    ;

else_opt:
      ELSE LB stmt_list RB
    |
    ;

case_list_opt:
      case_list
    |
    ;

case_list:
      case_list case_stmt
    | case_stmt
    ;

case_stmt:
      CASE NUM COLON stmt_list
    | CASE ID COLON stmt_list
    | DEFAULT COLON stmt_list
    ;

expr:
      expr PLUS expr
    | expr MINUS expr
    | expr MUL expr
    | expr DIV expr
    | expr LT expr
    | expr GT expr
    | LP expr RP
    | ID
    | NUM
    ;

%%

void yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);
}

int main()
{
    yyparse();
    printf("Parsing Finished\n");
    return 0;
}