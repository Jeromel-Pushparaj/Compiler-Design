%{
#include "y.tab.h"
%}

%%

"+"     { return PLUS; }
"-"     { return MINUS; }
"*"     { return MUL; }
"/"     { return DIV; }
[0-9]+  { yylval = atoi(yytext); return NUMBER; }
[ \t\n] { /* Ignore whitespace */ }
.       { return yytext[0]; }

%%

int yywrap() {
    return 1;
}
