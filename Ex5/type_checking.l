%{
#include "y.tab.h" 
%}
%%
[0-9]+ {
 yylval = atoi(yytext);
 return INTEGER;
}
[0-9]+"."[0-9]* {
 yylval = atof(yytext);
 return FLOAT;
}
[a-zA-Z]+ {
 yylval= yytext;
 return CHAR;
}
[ \t] ; // Ignore whitespace and tabs
\n { return EOL; } // Newline character
. { return yytext[0]; } // Return other characters as is
%%
int yywrap() {
 return 1;
} 