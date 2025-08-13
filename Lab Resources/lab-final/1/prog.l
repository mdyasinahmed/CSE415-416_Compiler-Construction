%option noyywrap

%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include "prog.tab.h"
	
	int lineno = 1; // initialize to 1
	void yyerror();
%}

alpha     [a-zA-Z]
digit     [0-9]
alnum     {alpha}|{digit}

ID        {alpha}{alnum}*
ICONST    [0-9]{digit}*
FCONST    {digit}*"."{digit}+
%%

"//".*        { } 

"int"       { return INT; }
"double"    { return DOUBLE; }
"float"		{ return FLOAT; }


"+"       { return ADDOP; }
"-"       { return SUBOP; }
"*"       { return MULOP; }
"/"       { return DIVOP; }

"("       { return LPAREN; }
")"       { return RPAREN; }
";"       { return SEMI; }
"="       { return ASSIGN; }

{ID}        {strcpy(yylval.str_val, yytext); return ID;}
{ICONST}    {return ICONST;}
{FCONST}    {return FCONST;}

"\n"        { lineno += 1; }
[ \t\r\f]+  

.       { yyerror("Unrecognized character"); }
