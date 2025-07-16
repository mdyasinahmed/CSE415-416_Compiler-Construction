%{
#include "calc.tab.h"
%}

%%
[0-9]+              { yylval = atoi(yytext); return NUMBER; }
[\n]                { return '\n'; }
[ \t]               ;  // Ignore spaces and tabs
"+"                 { return '+'; }
"*"                 { return '*'; }
.                   { return yytext[0]; }
%%
