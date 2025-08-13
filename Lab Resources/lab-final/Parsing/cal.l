%option noyywrap

%{
    #include "cal.tab.h"
%}

letter [a-zA-Z]
digit [0-9]
delim [ \t\n]
under [_]
num {digit}+
float_num {digit}+"."?{digit}*

%%

{delim} {}
"#include" {return(INCLUDE);}
"<stdio.h>" {return(STDIO);}
"int" {return(INT_TYPE);}
"char" {return(CHAR_TYPE);}
"main" {return(MAIN);}
"printf" {return(PRINTF);}
"scanf" {return(SCANF);}
"switch" {return(SWITCH);}
"case" {return(CASE);}
"default" {return(DEFAULT);}
"break" {return(BREAK);}
"return" {return(RETURN);}
"if" {return(IF);}
"else" {return(ELSE);}

"=" {return(ASSIGN);}
"+" {return(ADD);}
"-" {return(SUB);}
"*" {return(MUL);}
"/" {return(DIV);}
";" {return(SEMI);}
"(" {return(LB);}
")" {return(RB);}
"{" {return(CLB);}
"}" {return(CRB);}
":" {return(COLON);}
"," {return(COMMA);}
"&" {return(ADDRESS);}
"!=" {return(NEQ);}
\'[^\']\' { yylval = yytext[1]; return(CHAR_LITERAL); }

{num} {yylval = atoi(yytext); return(INT_NUM);}
{float_num} {yylval = atof(yytext); return(FLOAT_NUM);}

\"[^\"]*\" {return(STRING);}

({under}|{letter})({under}|{letter}|{digit})* {return(ID);}
%%
