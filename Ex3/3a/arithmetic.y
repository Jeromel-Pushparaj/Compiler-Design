%{
#include <stdio.h>
#include <stdlib.h>
%}

%token PLUS MINUS MUL DIV NUMBER

%left PLUS MINUS
%left MUL DIV

%%

stmt: expr { printf("Result: %d\n", $1); }
    ;

expr: expr PLUS expr { $$ = $1 + $3; }
    | expr MINUS expr { $$ = $1 - $3; }
    | expr MUL expr { $$ = $1 * $3; }
    | expr DIV expr { $$ = $1 / $3; }
    | NUMBER { $$ = $1; }
    ;

%%

int main() {
    printf("Enter an arithmetic expression:\n");
    yyparse();
    return 0;
}

int yyerror(char *s) {
    printf("Error: %s\n", s);
    return 0;
}
