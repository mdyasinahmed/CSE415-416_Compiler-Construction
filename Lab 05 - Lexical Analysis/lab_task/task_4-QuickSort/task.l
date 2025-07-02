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

"#include"                      { printf("%s -> PREPROCESSOR\n", yytext); }
"<stdio.h>"                    { printf("%s -> HEADER_FILE\n", yytext); }

"int"                          { printf("%s -> INT\n", yytext); }
"void"                         { printf("%s -> VOID\n", yytext); }
"main"                         { printf("%s -> MAIN\n", yytext); }
"return"                       { printf("%s -> RETURN\n", yytext); }
"for"                          { printf("%s -> FOR\n", yytext); }
"if"                           { printf("%s -> IF\n", yytext); }
"printf"                       { printf("%s -> PRINTF\n", yytext); }

"="                            { printf("%s -> ASSIGN\n", yytext); }
"=="                           { printf("%s -> EQ\n", yytext); }
"<="                           { printf("%s -> LE\n", yytext); }
">="                           { printf("%s -> GE\n", yytext); }
"<"                            { printf("%s -> LT\n", yytext); }
">"                            { printf("%s -> GT\n", yytext); }
"++"                           { printf("%s -> INC\n", yytext); }
"+"                            { printf("%s -> ADD\n", yytext); }
"-"                            { printf("%s -> SUB\n", yytext); }
"*"                            { printf("%s -> MUL\n", yytext); }
"/"                            { printf("%s -> DIV\n", yytext); }
"%"                            { printf("%s -> MOD\n", yytext); }

"&"                            { printf("%s -> ADDRESS\n", yytext); }

"("                            { printf("%s -> LPAREN\n", yytext); }
")"                            { printf("%s -> RPAREN\n", yytext); }
"{"                            { printf("%s -> LBRACE\n", yytext); }
"}"                            { printf("%s -> RBRACE\n", yytext); }
";"                            { printf("%s -> SEMI\n", yytext); }
","                            { printf("%s -> COMMA\n", yytext); }
"\["                           { printf("%s -> LBRACKET\n", yytext); }
"\]"                           { printf("%s -> RBRACKET\n", yytext); }

{float_num}                    { printf("%s -> FLOAT_NUM\n", yytext); }
{num}                          { printf("%s -> NUMBER\n", yytext); }
{id}                           { printf("%s -> ID\n", yytext); }

{delim}                        {/* skip whitespace */}
.                              { printf("%s -> PUNCT\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}
