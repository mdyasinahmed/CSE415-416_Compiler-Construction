%{
#include "cal.tab.h"
#include <stdio.h>
%}

%%
"int"           { return INT; }
"return"        { return RETURN; }
"if"            { return IF; }
"else"          { return ELSE; }
"for"           { return FOR; }
"switch"        { return SWITCH; }
"case"          { return CASE; }
"default"       { return DEFAULT; }
"break"         { return BREAK; }
"printf"        { return PRINTF; }
"main"          { return MAIN; }

[a-zA-Z_][a-zA-Z0-9_]*   { return ID; }
[0-9]+                  { return NUMBER; }

"=="|"%="|"!="|"<="|">="|"="|"%"|"+"|"-"|"*"|"/"|"<"|">" { return OP; }

"("         { return LPAREN; }
")"         { return RPAREN; }
"{"         { return LBRACE; }
"}"         { return RBRACE; }
";"         { return SEMICOLON; }
","         { return COMMA; }
"\n"        { /* ignore */ }
[ \t]+      { /* skip whitespace */ }

.           { return yytext[0]; }
%%

int yywrap() {
    return 1;
}
