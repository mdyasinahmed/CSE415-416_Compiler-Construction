%{
#include "cal.tab.h"
#include <string.h>
%}

%%
"include"       { return T_INCLUDE_KEYWORD; }
"int"           { return T_INT; }
"char"          { return T_CHAR; }
"for"           { return T_FOR; }
"if"            { return T_IF; }
"else"          { return T_ELSE; }
"return"        { return T_RETURN; }
"<"[a-zA-Z0-9_.]*">" { yylval.sval = strdup(yytext); return T_INCLUDE_PATH; }
"\""(\\.|[^"\\])*"\"" { yylval.sval = strdup(yytext); return T_STRING_LITERAL; }
">="            { return T_GE; }
"<="            { return T_LE; }
"&&"            { return T_AND; }
"=="            { return T_EQ; }
"++"            { return T_INC; }
[a-zA-Z_][a-zA-Z0-9_]* { yylval.sval = strdup(yytext); return T_ID; }
[0-9]+          { yylval.ival = atoi(yytext); return T_INTEGER_LITERAL; }
[ \t]           { /* Ignore space and tab */ }
\n              { yylineno++; }
.               { return yytext[0]; }
%%
int yywrap(void) { return 1; }