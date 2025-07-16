%option noyywrap

%{
#include "cal.tab.h"
#include <stdlib.h>  // for atoi
%}

digit   [0-9]
number  {digit}+
ws      [ \t\n]+

%%

{ws}              { /* ignore whitespace */ }
{number}          { yylval = atoi(yytext); return NUM; }

"+"               { return ADD; }
"-"               { return SUB; }
"*"               { return MUL; }
"/"               { return DIV; }

.                 { printf("Invalid character: %s\n", yytext); }

%%
