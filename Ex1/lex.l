%{
#include <stdio.h>
#include <ctype.h>
#include <string.h>

int identifiers = 0, constants = 0, operators = 0, comments = 0;
%}

%option noyywrap

%%
[a-zA-Z_][a-zA-Z0-9_]*  { printf("Identifier: %s\n", yytext); identifiers++; }
[0-9]+                  { printf("Constant: %s\n", yytext); constants++; }
"/*"([^*]|[\r\n]|"*"[^/])*"*/"  { printf("Comment detected\n"); comments++; }
"+"|"-"|"*"|"/"         { printf("Operator: %s\n", yytext); operators++; }
\n                      { /* Ignore newlines */ }
[ \t]                   { /* Ignore spaces */ }
.                       { printf("Unknown character: %s\n", yytext); }
%%

int main() {
    printf("Enter C code:\n");
    yylex();
    printf("\nSummary:\nIdentifiers: %d\nConstants: %d\nOperators: %d\nComments: %d\n", identifiers, constants, operators, comments);
    return 0;
}
