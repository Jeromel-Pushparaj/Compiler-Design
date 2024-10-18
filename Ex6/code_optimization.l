%{
#include "y.tab.h"
%}

%%

"+"     { return PLUS; }
"-"     { return MINUS; }
"*"     { return MUL; }
"/"     { return DIV; }
[0-9]+  { yylval = atoi(yytext); return NUMBER; }
[ \t\n] { /* ignore whitespace */ }

%%

int yywrap() {
    return 1;
}
