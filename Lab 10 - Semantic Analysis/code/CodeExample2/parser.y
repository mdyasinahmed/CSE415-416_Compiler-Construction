%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    #include "symtab.h"  // Include your symbol table
    void yyerror(const char *);
    extern int lineno;
    extern int yylex();
%}

%union
{
    char str_val[100];
    int int_val;
}

%token CHAR INT DOUBLE IF ELSE WHILE FOR CONTINUE BREAK VOID RETURN
%token ADDOP SUBOP MULOP DIVOP INCR DECR OROP ANDOP NOTOP EQUOP NEQUOP GTEQ GT LTEQ LT
%token LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN COMMA
%token <str_val> ID
%token <int_val> ICONST
%token FCONST
%token CCONST
%token STRING

%type <int_val> exp constant sign

%right ASSIGN
%left OROP
%left ANDOP
%left EQUOP NEQUOP
%left GTEQ GT LTEQ LT
%left ADDOP SUBOP
%left MULOP DIVOP
%right NOTOP INCR DECR
%left LPAREN RPAREN

%start code

%%

code: statements_optional functions;

statements_optional: statements_optional statement | /* empty */ ;

declarations_optional: declarations_optional declaration | /* empty */ ;

declaration: type names SEMI ;

type: INT    { $$ = INT_TYPE; }
    | CHAR   { $$ = CHAR_TYPE; }
    | DOUBLE { $$ = REAL_TYPE; }
    | VOID   { $$ = UNDEF_TYPE; }
    ;

names: names COMMA ID     { insert($3, UNDEF_TYPE); }
     | names COMMA init
     | ID                 { insert($1, UNDEF_TYPE); }
     | init
     ;

init: ID ASSIGN constant  { insert($1, $3); }
    ;

/* statements */
statement:
    declarations_optional |
    if_statement | for_statement | while_statement | assigment SEMI |
    CONTINUE SEMI | BREAK SEMI | function_call SEMI |
    ID INCR SEMI | INCR ID SEMI |
    ID DECR SEMI | DECR ID SEMI | RETURN exp SEMI
    ;

if_statement:
    IF LPAREN exp RPAREN tail else_if optional_else |
    IF LPAREN exp RPAREN tail optional_else
    ;

else_if:
    else_if ELSE IF LPAREN exp RPAREN tail |
    ELSE IF LPAREN exp RPAREN tail
    ;

optional_else: ELSE tail | /* empty */ ;

for_statement: FOR LPAREN assigment SEMI exp SEMI exp RPAREN tail ;

while_statement: WHILE LPAREN exp RPAREN tail ;

tail: LBRACE statements_optional RBRACE ;

exp:
    exp ADDOP exp        { $$ = typecheck($1, $3); }
    | exp SUBOP exp      { $$ = typecheck($1, $3); }
    | exp MULOP exp      { $$ = typecheck($1, $3); }
    | exp DIVOP exp      { $$ = typecheck($1, $3); }
    | INCR ID            {
                            if (idcheck($2))
                                $$ = gettype($2);
                            else
                                $$ = UNDEF_TYPE;
                         }
    | ID INCR            {
                            if (idcheck($1))
                                $$ = gettype($1);
                            else
                                $$ = UNDEF_TYPE;
                         }
    | DECR ID            {
                            if (idcheck($2))
                                $$ = gettype($2);
                            else
                                $$ = UNDEF_TYPE;
                         }
    | ID DECR            {
                            if (idcheck($1))
                                $$ = gettype($1);
                            else
                                $$ = UNDEF_TYPE;
                         }
    | exp OROP exp       { $$ = typecheck($1, $3); }
    | exp ANDOP exp      { $$ = typecheck($1, $3); }
    | NOTOP exp          { $$ = $2; }
    | exp EQUOP exp      { $$ = typecheck($1, $3); }
    | exp NEQUOP exp     { $$ = typecheck($1, $3); }
    | exp GTEQ exp       { $$ = typecheck($1, $3); }
    | exp GT exp         { $$ = typecheck($1, $3); }
    | exp LTEQ exp       { $$ = typecheck($1, $3); }
    | exp LT exp         { $$ = typecheck($1, $3); }
    | LPAREN exp RPAREN  { $$ = $2; }
    | ID                 {
                            if (idcheck($1))
                                $$ = gettype($1);
                            else
                                $$ = UNDEF_TYPE;
                         }
    | sign constant      { $$ = $2; }
    | function_call      { $$ = UNDEF_TYPE; } // assume functions return unknown
    ;

sign: ADDOP { $$ = 0; } | /* empty */ { $$ = 0; };

constant: ICONST { $$ = INT_TYPE; }
        | FCONST { $$ = REAL_TYPE; }
        | CCONST { $$ = CHAR_TYPE; }
        ;

assigment: ID ASSIGN exp {
    if (idcheck($1))
        $$ = gettype($1); // we could do assignment type validation here if needed
    else
        $$ = UNDEF_TYPE;
};

function_call: ID LPAREN call_params RPAREN;

call_params: call_params call_param | /* empty */ ;

call_param: call_param COMMA exp | call_param COMMA STRING | STRING | exp;

/* functions */
functions: functions function | function ;

function: function_head function_tail ;

function_head: return_type ID LPAREN parameters_optional RPAREN ;

return_type: type ;

parameters_optional: parameters | /* empty */ ;

parameters: parameters COMMA parameter | parameter ;

parameter: type ID { insert($2, $1); };

function_tail: LBRACE statements_optional RBRACE ;

%%

void yyerror(const char *s)
{
    printf("Syntax error at line %d: %s\n", lineno, s);
    exit(1);
}

int main(int argc, char *argv[])
{
    if (yyparse() == 0)
        printf("Parsing finished successfully!\n");

    return 0;
}
