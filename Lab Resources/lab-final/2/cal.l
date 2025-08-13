%option noyywrap

%{
 #include <stdlib.h>
 #include "cal.tab.h"
%}

letter [a-zA-Z]
digit [0-9]
delim [ \t]
under [_]
num {digit}+(\.{digit}+)?  
id ({letter}|{under})({letter}|{under}|{digit})*

%%

{delim} {}

"int" {return INT_TYPE;}
"float" {return FLOAT_TYPE;}
"switch" {return SWITCH;}
"case" {return CASE;}
"break" {return BREAK;}
"default" {return DEFAULT;}
"return" {return RETURN;}
"for" {return FOR;}
"if" {return IF;}
"else" {return ELSE;}

"(" {return LP;}
")" {return RP;}
"{" {return LB;}
"}" {return RB;}
"," {return COMMA;}
";" {return SEMI;}
"/" {return DIV;}
":" {return COLON;}
"=" {return ASSIGN;}
"+" {return PLUS;}
"-" {return MINUS;}
"*" {return MUL;}
"<" {return LT;}
">" {return GT;}

{num} {yylval = atof(yytext); return NUM;}
{id} {return ID;}

%%