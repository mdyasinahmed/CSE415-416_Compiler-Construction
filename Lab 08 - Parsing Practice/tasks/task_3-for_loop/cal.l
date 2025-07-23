%{
#include <stdio.h>
%}

%%

"for"           { printf("FOR keyword\n"); }
"int"           { printf("INT keyword\n"); }
[0-9]+          { printf("NUMBER: %s\n", yytext); }
";"             { printf("SEMICOLON\n"); }
"="             { printf("ASSIGNMENT\n"); }
"++"|"--"       { printf("INCREMENT/DECREMENT\n"); }
"<="|">="|"=="  { printf("COMPARISON OPERATOR: %s\n", yytext); }
[a-zA-Z_][a-zA-Z0-9_]*  { printf("IDENTIFIER: %s\n", yytext); }
[ \t\n]+        { /* skip whitespace */ }

%%

int main() {
    yylex();
    return 0;
}
