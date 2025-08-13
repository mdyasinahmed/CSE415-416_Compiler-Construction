%option noyywrap

%{
#include "parser.tab.h"
#include <string.h>
%}

digit       [0-9]
alpha       [a-zA-Z_]
alphanum    [a-zA-Z0-9_]

%%

"int"           { return INT; }
"float"         { return FLOAT; }
"char"          { return CHAR; }
"return"        { return RETURN; }
"if"            { return IF; }
"else"          { return ELSE; }
"for"           { return FOR; }
"printf"        { return PRINTF; }

"=="            { return EQ; }
"!="            { return NEQ; }
">="            { return GE; }
"<="            { return LE; }
">"             { return '>'; }
"<"             { return '<'; }
"="             { return '='; }
"+"             { return '+'; }
"-"             { return '-'; }
"*"             { return '*'; }
"/"             { return '/'; }
"("             { return '('; }
")"             { return ')'; }
"{"             { return '{'; }
"}"             { return '}'; }
";"             { return ';'; }
","             { return ','; }
"++"            { return INCR; }

{digit}+        { yylval.ival = atoi(yytext); return ICONST; }
{digit}+"."{digit}+  { yylval.fval = atof(yytext); return FCONST; }

{alpha}{alphanum}* {
                    yylval.sval = strdup(yytext);
                    return IDENT;
                  }

\"([^\\\"]|\\.)*\" { yylval.sval = strdup(yytext); return STRING; }

[ \t\n\r]+      { /* skip whitespace */ }

.               { /* ignore unknown chars or error */ }

%%
