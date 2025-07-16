%{
#include <stdio.h>
#include <stdlib.h>
%}

%token NUMBER

%%
input:
    /* empty */
  | input line
;

line:
    expr '\n'      { printf("= %d\n", $1); }
;

expr:
    expr '+' term  { $$ = $1 + $3; }
  | term
;

term:
    term '*' factor { $$ = $1 * $3; }
  | factor
;

factor:
    NUMBER         { $$ = $1; }
;
%%

int main() {
    printf("Enter expressions (Ctrl+C to quit):\n");
    return yyparse();
}

int yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
    return 0;
}
