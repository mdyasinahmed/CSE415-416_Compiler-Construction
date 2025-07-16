%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

FILE *out;

int is_prime(int n) {
    if (n <= 1) return 0;
    for (int i = 2; i*i <= n; i++) {
        if (n % i == 0) return 0;
    }
    return 1;
}

int factorial(int n) {
    if (n == 0) return 1;
    return n * factorial(n-1);
}

%}

%union {
    int num;
    char ch;
}

%token <num> NUMBER
%token <ch> CHAR
%token EVEN ODD VOWEL CONSONANT GREATER LESS PRIME FACTORIAL
%token LPAREN RPAREN COMMA SEMICOLON

%%

program:
    | program statement
    ;

statement:
      EVEN LPAREN NUMBER RPAREN SEMICOLON
        { fprintf(out, "%d is %s\n", $3, ($3 % 2 == 0 ? "Even" : "Not Even")); }
    | ODD LPAREN NUMBER RPAREN SEMICOLON
        { fprintf(out, "%d is %s\n", $3, ($3 % 2 != 0 ? "Odd" : "Not Odd")); }
    | VOWEL LPAREN CHAR RPAREN SEMICOLON
        { fprintf(out, "%c is %s\n", $3, (strchr("aeiouAEIOU", $3) ? "Vowel" : "Not Vowel")); }
    | CONSONANT LPAREN CHAR RPAREN SEMICOLON
        { fprintf(out, "%c is %s\n", $3, (strchr("aeiouAEIOU", $3) ? "Not Consonant" : "Consonant")); }
    | GREATER LPAREN NUMBER COMMA NUMBER RPAREN SEMICOLON
        { fprintf(out, "%d is Greater\n", ($3 > $5 ? $3 : $5)); }
    | LESS LPAREN NUMBER COMMA NUMBER RPAREN SEMICOLON
        { fprintf(out, "%d is Less\n", ($3 < $5 ? $3 : $5)); }
    | PRIME LPAREN NUMBER RPAREN SEMICOLON
        { fprintf(out, "%d is %s\n", $3, (is_prime($3) ? "Prime" : "Not Prime")); }
    | FACTORIAL LPAREN NUMBER RPAREN SEMICOLON
        { fprintf(out, "Factorial of %d is %d\n", $3, factorial($3)); }
    ;

%%

int yyerror(char *s) {
    fprintf(out, "Error: %s\n", s);
    return 0;
}

int main(void) {
    FILE *in = fopen("input.txt", "r");
    out = fopen("output.txt", "w");

    if (!in || !out) {
        printf("File error.\n");
        return 1;
    }

    yyin = in;
    yyparse();

    fclose(in);
    fclose(out);
    return 0;
}
