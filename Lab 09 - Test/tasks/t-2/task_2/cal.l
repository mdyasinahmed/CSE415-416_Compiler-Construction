%{
#include "cal.tab.h"
#include <stdlib.h>
#include <string.h>  
%}

%%

"switch"         { return SWITCH; }
"case"           { return CASE; }
"default"        { return DEFAULT; }
"break"          { return BREAK; }
":"              { return COLON; }
";"              { return SEMICOLON; }
"="              { return ASSIGN; }
"("              { return LPAREN; }
")"              { return RPAREN; }
"{"              { return LBRACE; }
"}"              { return RBRACE; }
","              { return COMMA; }
"+"              { return PLUS; }
"-"              { return MINUS; }
"*"              { return MUL; }
"/"              { return DIV; }
"^"              { return POWER; }

[0-9]+           { yylval.ival = atoi(yytext); return NUMBER; }
[a-zA-Z_][a-zA-Z0-9_]* { yylval.id = strdup(yytext); return ID; }

[ \t\r\n]+       { /* Ignore whitespace */ }

.                { return yytext[0]; }

%%

int yywrap() {
    return 1;
}
