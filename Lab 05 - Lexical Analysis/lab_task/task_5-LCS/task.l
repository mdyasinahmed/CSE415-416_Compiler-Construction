%option noyywrap

%{
#include <stdio.h>
%}

letter      [a-zA-Z]
digit       [0-9]
delim       [ \t\n]
under       [_]
num         {digit}+
float_num   {num}[.]{num}
id          ({under}|{letter})({under}|{letter}|{digit})*

%%

"#include"                     { printf("%s -> PREPROCESSOR\n", yytext); }
"<stdio.h>"                   { printf("%s -> HEADER_FILE\n", yytext); }
"<string.h>"                  { printf("%s -> HEADER_FILE\n", yytext); }

"int"                         { printf("%s -> INT\n", yytext); }
"char"                        { printf("%s -> CHAR\n", yytext); }
"void"                        { printf("%s -> VOID\n", yytext); }
"return"                      { printf("%s -> RETURN\n", yytext); }
"main"                        { printf("%s -> MAIN\n", yytext); }
"for"                         { printf("%s -> FOR\n", yytext); }
"if"                          { printf("%s -> IF\n", yytext); }
"else"                        { printf("%s -> ELSE\n", yytext); }
"printf"                      { printf("%s -> PRINTF\n", yytext); }
"strlen"                      { printf("%s -> STRLEN\n", yytext); }

"="                           { printf("%s -> ASSIGN\n", yytext); }
"=="                          { printf("%s -> EQ\n", yytext); }
"!="                          { printf("%s -> NEQ\n", yytext); }
"<"                           { printf("%s -> LT\n", yytext); }
">"                           { printf("%s -> GT\n", yytext); }
"<="                          { printf("%s -> LE\n", yytext); }
">="                          { printf("%s -> GE\n", yytext); }
"?"                           { printf("%s -> TERNARY_IF\n", yytext); }
":"                           { printf("%s -> TERNARY_ELSE\n", yytext); }
"&&"                          { printf("%s -> AND\n", yytext); }
"||"                          { printf("%s -> OR\n", yytext); }

"&"                           { printf("%s -> ADDRESS\n", yytext); }
"*"                           { printf("%s -> MUL\n", yytext); }
"+"                           { printf("%s -> ADD\n", yytext); }
"-"                           { printf("%s -> SUB\n", yytext); }
"/"                           { printf("%s -> DIV\n", yytext); }
"%"                           { printf("%s -> MOD\n", yytext); }

"("                           { printf("%s -> LPAREN\n", yytext); }
")"                           { printf("%s -> RPAREN\n", yytext); }
"{"                           { printf("%s -> LBRACE\n", yytext); }
"}"                           { printf("%s -> RBRACE\n", yytext); }
"\["                          { printf("%s -> LBRACKET\n", yytext); }
"\]"                          { printf("%s -> RBRACKET\n", yytext); }
";"                           { printf("%s -> SEMI\n", yytext); }
","                           { printf("%s -> COMMA\n", yytext); }
\"[^"]*\"                     { printf("%s -> STRING_LITERAL\n", yytext); }

{num}                         { printf("%s -> NUMBER\n", yytext); }
{id}                          { printf("%s -> ID\n", yytext); }

{delim}                       {/* skip whitespace */}
.                             { printf("%s -> UNKNOWN\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}
