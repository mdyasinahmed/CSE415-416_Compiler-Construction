%{
#include "cal.tab.h"
#include <stdlib.h>
#include <string.h>
%}

%%

"int"           { return INT; }
"char"          { return CHAR; }
"double"        { return DOUBLE; }
"main"          { return MAIN; }
"return"        { return RETURN; }
"scanf"         { return SCANF; }
"printf"        { return PRINTF; }
"switch"        { return SWITCH; }
"case"          { return CASE; }
"default"       { return DEFAULT; }
"break"         { return BREAK; }
"if"            { return IF; }
"else"          { return ELSE; }

"!="            { return NEQ; }
"^"             { return POWER; }
"&"             { return AMP; }   

":"             { return COLON; }
";"             { return SEMICOLON; }
"="             { return ASSIGN; }
","             { return COMMA; }
"("             { return LPAREN; }
")"             { return RPAREN; }
"{"             { return LBRACE; }
"}"             { return RBRACE; }

[0-9]+\.[0-9]+  { yylval.dval = atof(yytext); return NUMBER; }
[0-9]+          { yylval.dval = atof(yytext); return NUMBER; }
"\'."           { yylval.cval = yytext[1]; return CHAR_CONST; }

[a-zA-Z_][a-zA-Z0-9_]* { yylval.id = strdup(yytext); return ID; }

\".*\"          { return STRING; }

"+"             { return PLUS; }
"-"             { return MINUS; }
"*"             { return MUL; }
"/"             { return DIV; }

[ \t\r\n]+      { /* skip whitespace */ }

.               { return yytext[0]; }

%%

int yywrap() {
    return 1;
}
