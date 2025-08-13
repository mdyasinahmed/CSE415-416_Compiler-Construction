%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex(void);
void yyerror(const char *s);
extern int yylineno;
%}

%union {
    char   *sval;
    int    ival;
}

%token <sval> T_ID T_STRING_LITERAL T_INCLUDE_PATH
%token <ival> T_INTEGER_LITERAL

%token T_INCLUDE_KEYWORD T_INT T_CHAR T_FOR T_IF T_ELSE T_RETURN
%token T_GE T_LE T_AND T_EQ T_INC

%right '?' ':'
%right '='
%left  T_AND
%left  T_EQ
%left  T_LE T_GE '<' '>'
%left  '+' '-'
%left  '*' '/' '%'
%right '&' '!'

%nonassoc T_LOWER_THAN_ELSE
%nonassoc T_ELSE

%start program

%%

program
    : external_declaration_list
    ;

external_declaration_list
    : external_declaration
    | external_declaration_list external_declaration
    ;

external_declaration
    : function_definition
    | preprocessor_directive
    ;

preprocessor_directive
    : '#' T_INCLUDE_KEYWORD T_INCLUDE_PATH
    ;

function_definition
    : type_specifier declarator compound_statement
    ;

compound_statement
    : '{' block_item_list '}'
    | '{' '}'
    ;

block_item_list
    : block_item
    | block_item_list block_item
    ;

block_item
    : declaration
    | statement
    ;

declaration
    : type_specifier init_declarator_list ';'
    ;

type_specifier
    : T_INT
    | T_CHAR
    ;

init_declarator_list
    : init_declarator
    | init_declarator_list ',' init_declarator
    ;

init_declarator
    : declarator
    | declarator '=' initializer
    ;

declarator
    : T_ID
    | '*' T_ID
    | declarator '[' ']'
    | declarator '[' expression ']'
    | declarator '(' ')'
    ;

initializer
    : expression
    | '{' initializer_list '}'
    ;

initializer_list
    : initializer
    | initializer_list ',' initializer
    ;

statement
    : expression_stmt
    | selection_stmt
    | iteration_stmt
    | jump_stmt
    | compound_statement
    ;

expression_stmt
    : expression ';'
    | ';'
    ;

selection_stmt
    : T_IF '(' expression ')' statement %prec T_LOWER_THAN_ELSE
    | T_IF '(' expression ')' statement T_ELSE statement
    ;

iteration_stmt
    : T_FOR '(' declaration expression ';' expression ')' statement
    | T_FOR '(' expression_stmt expression_stmt expression ')' statement
    ;

jump_stmt
    : T_RETURN expression ';'
    ;

expression
    : assignment_expression
    ;

assignment_expression
    : conditional_expression
    | unary_expression '=' assignment_expression
    ;

conditional_expression
    : logical_and_expression
    | logical_and_expression '?' expression ':' conditional_expression
    ;

logical_and_expression
    : equality_expression
    | logical_and_expression T_AND equality_expression
    ;

equality_expression
    : relational_expression
    | equality_expression T_EQ relational_expression
    ;

relational_expression
    : additive_expression
    | relational_expression '<' additive_expression
    | relational_expression '>' additive_expression
    | relational_expression T_LE additive_expression
    | relational_expression T_GE additive_expression
    ;

additive_expression
    : multiplicative_expression
    | additive_expression '+' multiplicative_expression
    | additive_expression '-' multiplicative_expression
    ;

multiplicative_expression
    : unary_expression
    | multiplicative_expression '*' unary_expression
    | multiplicative_expression '/' unary_expression
    | multiplicative_expression '%' unary_expression
    ;

unary_expression
    : postfix_expression
    | T_INC unary_expression
    | '&' unary_expression
    ;

postfix_expression
    : primary_expression
    | postfix_expression '[' expression ']'
    | postfix_expression '(' ')'
    | postfix_expression '(' argument_expression_list ')'
    | postfix_expression T_INC
    ;

primary_expression
    : T_ID
    | T_INTEGER_LITERAL
    | T_STRING_LITERAL
    | '(' expression ')'
    ;

argument_expression_list
    : assignment_expression
    | argument_expression_list ',' assignment_expression
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Parse Error on line %d: %s\n", yylineno, s);
}

int main(void) {
    if (yyparse() == 0) {
        printf("\nParsing completed successfully!\n");
    } else {
        printf("\nParsing failed.\n");
    }
    return 0;
}