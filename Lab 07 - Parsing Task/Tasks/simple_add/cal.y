%{
#include <stdio.h>
#include <stdlib.h>  // for exit()
void yyerror(const char *s);
int yylex();
%}

%token NUM ADD SUB MUL DIV
%start cal

%%

cal:
    expr '\n'  { printf("RESULT = %d\n", $1); }
;

expr:
    expr ADD term  { $$ = $1 + $3; }
  | expr SUB term  { $$ = $1 - $3; }
  | term           { $$ = $1; }
;

term:
    term MUL factor  { $$ = $1 * $3; }
  | term DIV factor  { 
        if ($3 == 0) {
            yyerror("Division by zero!");
            exit(1);
        }
        $$ = $1 / $3;
    }
  | factor           { $$ = $1; }
;

factor:
    NUM  { $$ = $1; }
;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Syntax Error: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}
