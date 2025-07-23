%{
#include "cal.tab.h"
%}

%%

"if"        { return IF; }
"else"      { return ELSE; }
"="         { return ASSIGN; }
"=="        { return EQ; }
">"         { return GT; }
"<"         { return LT; }
";"         { return SEMI; }

[0-9]+      { yylval = atoi(yytext); return NUM; }
[a-zA-Z_][a-zA-Z0-9_]* { return ID; }

[ \t\n]+    { /* skip whitespace */ }
.           { return yytext[0]; }

%%

int yywrap() { return 1; }
