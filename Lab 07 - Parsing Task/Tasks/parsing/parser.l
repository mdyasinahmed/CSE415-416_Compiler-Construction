%{
#include "parser.tab.h"
#include <stdio.h>
%}

%%
"even"       { return EVEN; }
"odd"        { return ODD; }
"vowel"      { return VOWEL; }
"consonant"  { return CONSONANT; }
"greater"    { return GREATER; }
"less"       { return LESS; }
"prime"      { return PRIME; }
"factorial"  { return FACTORIAL; }

[0-9]+       { yylval.num = atoi(yytext); return NUMBER; }
\'[a-zA-Z]\' { yylval.ch = yytext[1]; return CHAR; }

\(           { return LPAREN; }
\)           { return RPAREN; }
\,           { return COMMA; }
\;           { return SEMICOLON; }

[ \t\n]      ;  // Ignore whitespace

.            { printf("Unknown character: %s\n", yytext); }
%%
