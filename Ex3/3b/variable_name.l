%{
#include <stdio.h>
%}

%%
[a-zA-Z_][a-zA-Z0-9_]*    { printf("Valid variable: %s\n", yytext); }
[0-9]+                    { printf("Invalid variable (starts with digit): %s\n", yytext); }
\n                        { return 0; }
.                         { printf("Invalid token: %s\n", yytext); }
%%

int main() {
    printf("Enter variable names (CTRL+D to stop):\n");
    yylex();
    return 0;
}
