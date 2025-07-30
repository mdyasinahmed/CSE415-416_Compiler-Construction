%{
#include <stdio.h>
#include "cal.tab.h"
%}

digit              [0-9]
letter             [a-zA-Z]
identifier         {letter}({letter}|{digit}|_)*
integer            {digit}+
character_literal  '[^']'
string             \"[^\"]*\"

%%

"/*"(.|\n)*"*/"   { }
"//".*          { }
[ \t\n]+        { }

"char"          { return CHAR; }
"double"        { return DOUBLE; }
"switch"        { return SWITCH; }
"case"          { return CASE; }
"default"       { return DEFAULT; }
"break"         { return BREAK; }
"int"           { return INT; }
"do"            { return DO; }
"while"         { return WHILE; }
"if"            { return IF; }
"else"          { return ELSE; }
"return"        { return RETURN; }

{identifier}    { yylval.sval = strdup(yytext); return ID; }
{integer}       { yylval.ival = atoi(yytext); return INTEGER; }
{string}        { yylval.sval = strdup(yytext); return STRING_LITERAL; }
{character_literal} { yylval.ival = yytext[1]; return CHARACTER_LITERAL; }

"=="            { return EQ; }
"!="            { return NE; }

"{"             { return '{'; }
"}"             { return '}'; }
"("             { return '('; }
")"             { return ')'; }
";"             { return ';'; }
","             { return ','; }
"&"             { return '&'; }
"="             { return '='; }
"%"             { return '%'; }
"*"             { return '*'; }
"+"             { return '+'; }
"-"             { return '-'; }   
"/"             { return '/'; }
"^"             { return '^'; }
":"             { return ':'; }

.               { printf("Lexical error: Unexpected character '%s'\n", yytext); }

%%

int yywrap(void) {
    return 1;
}