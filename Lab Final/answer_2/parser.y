%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *s);
int yylex(void);

typedef union {
    int ival;
    float fval;
    char *sval;
} YYSTYPE;

#define YYSTYPE_IS_DECLARED 1

%}

%union {
    int ival;
    float fval;
    char *sval;
}

%token <ival> ICONST
%token <fval> FCONST
%token <sval> IDENT STRING

%token INT FLOAT CHAR RETURN IF ELSE FOR PRINTF
%token INCR EQ NEQ GE LE

%left '+' '-'
%left '*' '/'

%start program

%%

program:
    program external_decl
  | external_decl
  ;

external_decl:
    function_def
  | declaration
  ;

function_def:
    type_spec IDENT '(' param_list_opt ')' compound_stmt
  ;

param_list_opt:
    param_list
  | /* empty */
  ;

param_list:
    param_decl
  | param_list ',' param_decl
  ;

param_decl:
    type_spec IDENT
  ;

declaration:
    type_spec IDENT ';'
  | type_spec IDENT '=' expression ';'
  ;

type_spec:
    INT
  | FLOAT
  | CHAR
  ;

compound_stmt:
    '{' stmt_list '}'
  ;

stmt_list:
    stmt_list stmt
  | /* empty */
  ;

stmt:
    declaration
  | expression_stmt
  | return_stmt
  | if_stmt
  | for_stmt
  | compound_stmt
  ;

expression_stmt:
    expression ';'
  | ';'
  ;

return_stmt:
    RETURN expression ';'
  ;

if_stmt:
    IF '(' expression ')' stmt
  | IF '(' expression ')' stmt ELSE stmt
  ;

for_stmt:
    FOR '(' expression_stmt expression_stmt expression ')' stmt
  ;

expression:
    assignment
  | logical_or
  ;

assignment:
    IDENT '=' expression
  | logical_or
  ;

logical_or:
    logical_and
  ;

logical_and:
    equality
  ;

equality:
    relational
  | equality EQ relational
  | equality NEQ relational
  ;

relational:
    additive
  | relational '<' additive
  | relational '>' additive
  | relational LE additive
  | relational GE additive
  ;

additive:
    multiplicative
  | additive '+' multiplicative
  | additive '-' multiplicative
  ;

multiplicative:
    primary
  | multiplicative '*' primary
  | multiplicative '/' primary
  ;

primary:
    IDENT
  | ICONST
  | FCONST
  | STRING
  | '(' expression ')'
  ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    return yyparse();
}
