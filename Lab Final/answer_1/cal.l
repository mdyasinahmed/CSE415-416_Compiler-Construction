%option noyywrap
%{
#include "cal.tab.h"
#include <string.h>
#ifndef strdup
#define strdup _strdup
#endif
%}

digit   [0-9]
id      [a-zA-Z_][a-zA-Z0-9_]*
str     \"([^\\\"]|\\.)*\"

%%
"#include"             { return INCLUDE; }
"<stdio.h>"            { return HEADER; }
"int"                  { return INT; }
"char"                 { return CHAR; }
"for"                  { return FOR; }
"if"                   { return IF; }
"else"                 { return ELSE; }
"return"               { return RETURN; }
"printf"               { return PRINTF; }
"scanf"                { return SCANF; }

"++"                   { return INCR; }
"=="                   { return EQ; }
"!="                   { return NEQ; }
">="                   { return GE; }
"<="                   { return LE; }
"&&"                   { return AND; }
"||"                   { return OR; }
"?"                    { return QMARK; }
":"                    { return COLON; }

{str}                  { yylval.str = strdup(yytext); return STRING; }
{id}                   { yylval.str = strdup(yytext); return IDENT; }
{digit}+               { yylval.num = atoi(yytext); return NUMBER; }

.                      { return yytext[0]; }

[ \t\n\r]+             { /* skip whitespace */ }

%%
