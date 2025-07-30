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
"for"                { return FOR; }
"if"                 { return IF; }
"return"             { return RETURN; }
"printf"             { return PRINTF; }
"break"              { return BREAK; }

"=="                 { return EQ; }
"!="                 { return NEQ; }
"<="                 { return LE; }
"<"                  { return LT; }
"+"                  { return PLUS; }
"++"                 { return PLUSPLUS; }
"%"                  { return MOD; }
"/"                  { return DIV; }
"="                  { return ASSIGN; }
";"                  { return SEMI; }
","                  { return COMMA; }
"("                  { return LPAREN; }
")"                  { return RPAREN; }
"{"                  { return LBRACE; }
"}"                  { return RBRACE; }

{id}                 { yylval.id = strdup(yytext); return ID; }

.                    { /* ignore unknown chars */ }

%%
