%{
#include <stdio.h>
%}

%%
"for"           { printf("Control structure: for\n"); }
"while"         { printf("Control structure: while\n"); }
"if"            { printf("Control structure: if\n"); }
"else"          { printf("Control structure: else\n"); }
"switch"        { printf("Control structure: switch\n"); }
"case"          { printf("Control structure: case\n"); }
"default"       { printf("Control structure: default\n"); }
\n              { return 0; }
[ \t]           { /* Ignore whitespace */ }
.               { printf("Unknown token: %s\n", yytext); }
%%

int main() {
    printf("Enter control structures:\n");
    yylex();
    return 0;
}
