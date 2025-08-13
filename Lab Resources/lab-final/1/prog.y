%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
    #include "symtab.c"
	void yyerror();
	extern int lineno;
	extern int yylex();
%}

%union
{
    char str_val[100];
    int int_val;
}

%token INT DOUBLE FLOAT
%token ADDOP SUBOP MULOP DIVOP
%token LPAREN RPAREN SEMI ASSIGN
%token<str_val> ID
%token ICONST
%token FCONST
%token CCONST

%left ADDOP SUBOP 
%left MULOP DIVOP /*MULOP has lowest precedence*/

%type<int_val> type exp constant

%start code

%%
code: statements;

statements: 
          | statements statement
          ;

statement: declaration
         ;

declaration: type ID SEMI
            {
                //printf("%s\n", $2);
                //printf("%d\n", $1);
                insert($2, $1);
            }
            |type ID ASSIGN exp SEMI
            {
                //printf("%s\n", $2);
                //printf("%d\n", $1);
                insert($2, $1);
            }
            ;

type: INT {$$=INT_TYPE;}
    | DOUBLE {$$=FLOAT_OR_DOUBLE_TYPE;}
    | FLOAT {$$=FLOAT_OR_DOUBLE_TYPE;}
    ;


exp: constant { $$ = $1; }
   | ID { if(idcheck($1)) { $$ = gettype($1); } }
   | exp ADDOP exp { $$ = typecheck($1, $3); }
   | exp MULOP exp { $$ = typecheck($1, $3); }
   | exp SUBOP exp { $$ = typecheck($1, $3); }
   | exp DIVOP exp { $$ = typecheck($1, $3); }
   | LPAREN exp RPAREN { $$ = $2; }
   ;

constant: ICONST {$$=INT_TYPE;}
        | FCONST {$$=FLOAT_OR_DOUBLE_TYPE;}
        | CCONST {$$=CHAR_TYPE;}
        ;


%%

void yyerror ()
{
	printf("Syntax error at line %d\n", lineno);
	exit(1);
}

int main (int argc, char *argv[])
{
	yyparse();
	printf("Parsing finished!\n");	
	return 0;
}
