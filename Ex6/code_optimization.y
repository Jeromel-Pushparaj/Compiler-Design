%{
#include <stdio.h>
#include <stdlib.h>

void optimize_addition(int a, int b);
void optimize_multiplication(int a, int b);
void yyerror(const char *s);
int yylex(void);
%}

%token PLUS MINUS MUL DIV NUMBER

%left PLUS MINUS
%left MUL DIV

%%

stmt:
    expr { printf("Result: %d\n", $1); }
    ;

expr:
    expr PLUS expr { optimize_addition($1, $3); $$ = $1 + $3; }
    | expr MINUS expr { $$ = $1 - $3; }
    | expr MUL expr { optimize_multiplication($1, $3); $$ = $1 * $3; }
    | expr DIV expr { if ($3 == 0) yyerror("Division by zero"); else $$ = $1 / $3; }
    | NUMBER { $$ = $1; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

void optimize_addition(int a, int b) {
    printf("Optimization: Adding %d and %d\n", a, b);
}

void optimize_multiplication(int a, int b) {
    printf("Optimization: Multiplying %d and %d\n", a, b);
}

