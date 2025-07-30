%option noyywrap

%{
#include "cal.tab.h"
#include <string.h>
%}

digit   [0-9]
number  {digit}+
id      [a-zA-Z_][a-zA-Z0-9_]*
ws      [ \t\n]+
string  \"([^\"\n]*)\"

%%

{ws}                 {/* skip whitespace */}
{number}             { yylval.num = atoi(yytext); return NUM; }
{string}             { yylval.id = strdup(yytext); return STRING; }

"int"                { return INT; }
"main"               { return MAIN; }
"printf"             { return PRINTF; }
"scanf"              { return SCANF; }
"return"             { return RETURN; }
"if"                 { return IF; }
"else"               { return ELSE; }
"do"                 { return DO; }
"while"              { return WHILE; }

"=="                 { return EQ; }
"!="                 { return NEQ; }
"="                  { return ASSIGN; }
"%"                  { return MOD; }
"/"                  { return DIV; }
"*"                  { return MULT; }
"+"                  { return PLUS; }

"&"                  { return AMP; }
";"                  { return SEMI; }
","                  { return COMMA; }
"("                  { return LPAREN; }
")"                  { return RPAREN; }
"{"                  { return LBRACE; }
"}"                  { return RBRACE; }

{id}                 { yylval.id = strdup(yytext); return ID; }

.                    { /* ignore unknown chars */ }

%%
