%{
#include<stdio.h>
void yyerror(char *s);
int yylex();
%}

%token INCLUDE STDIO INT_TYPE CHAR_TYPE MAIN PRINTF SCANF SWITCH CASE DEFAULT BREAK RETURN IF ELSE
%token INT_NUM FLOAT_NUM ASSIGN ADD SUB MUL DIV SEMI LB RB CLB CRB COLON COMMA ADDRESS NEQ
%token ID STRING CHAR_LITERAL
%start program

%left ADD SUB
%left MUL DIV
%nonassoc LOWER_THAN_ELSE
%nonassoc ELSE

%%

program : includes main_function;

includes : include_stmt;

include_stmt : INCLUDE STDIO;

main_function : INT_TYPE MAIN LB RB block;

block : CLB decl_list stmt_list CRB;

decl_list : /* empty */
          | decl_list declaration;

declaration : INT_TYPE var_init_list SEMI
            | CHAR_TYPE var_init_list SEMI;

var_init_list : var_init
              | var_init_list COMMA var_init;

var_init : ID
         | ID ASSIGN expr
         | ID ASSIGN CHAR_LITERAL;

stmt_list : /* empty */
          | stmt_list statement;

statement : printf_stmt
          | scanf_stmt
          | assignment_stmt
          | switch_stmt
          | if_stmt
          | RETURN INT_NUM SEMI
          | SEMI;

printf_stmt : PRINTF LB STRING RB SEMI
            | PRINTF LB STRING COMMA expr RB SEMI;

scanf_stmt : SCANF LB STRING COMMA ADDRESS ID RB SEMI
           | SCANF LB STRING COMMA ADDRESS ID COMMA ADDRESS ID RB SEMI;

assignment_stmt : ID ASSIGN expr SEMI;

switch_stmt : SWITCH LB ID RB switch_block;

switch_block : CLB switch_items CRB;

switch_items : /* empty */
             | switch_items case_block
             | switch_items default_block;

case_block : CASE CHAR_LITERAL COLON case_body
           | CASE INT_NUM COLON case_body;

case_body : stmt_list BREAK SEMI;

default_block : DEFAULT COLON stmt_list;

if_stmt : IF LB condition RB statement %prec LOWER_THAN_ELSE
        | IF LB condition RB statement ELSE statement;

condition : expr NEQ expr;

expr : expr ADD term
     | expr SUB term
     | term;

term : term MUL factor
     | term DIV factor
     | factor;

factor : ID
       | INT_NUM
       | LB expr RB;

%%

void yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);
}

int main()
{
    yyparse();
    printf("Parsing Finished");
    return 0;
}
