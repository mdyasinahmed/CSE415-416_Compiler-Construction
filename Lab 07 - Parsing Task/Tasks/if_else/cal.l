%{
#include <stdio.h>
%}

DIGIT   [0-9]+

%%

"if"            { printf("IF "); }
"else"          { printf("ELSE "); }
"int"           { printf("INT "); }
"return"        { printf("RETURN "); }
"scanf"         { printf("SCANF "); }
"printf"        { printf("PRINTF "); }
"main"          { printf("MAIN "); }

"=="            { printf("EQ "); }
"="             { printf("ASSIGN "); }
"%"             { printf("MOD "); }
"("             { printf("LPAREN "); }
")"             { printf("RPAREN "); }
"{"             { printf("LBRACE "); }
"}"             { printf("RBRACE "); }
";"             { printf("SEMI "); }
","             { printf("COMMA "); }

"\""            { printf("QUOTE "); }
"\\n"           { printf("NEWLINE "); }

{DIGIT}         { printf("NUMBER "); }
[a-zA-Z_][a-zA-Z0-9_]* { printf("ID "); }
[ \t\r\n]+      { /* skip whitespace */ }
.               { printf("UNKNOWN "); }

%%

int main(int argc, char **argv)
{
    yylex();
    return 0;
}