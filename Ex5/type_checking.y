%{
#include <stdio.h>
void yyerror(const char* s) {
 fprintf(stderr, "Parse error: %s\n", s);
}
int yylex(); // Declare the lexer function
%}
%token INTEGER FLOAT CHAR EOL
%%
program:
 /* empty */
 | program line
 ;
line:
 statement EOL {
 if ($1 == INTEGER) {
 printf("Type: INTEGER\n");
 } else if ($1 == FLOAT) {
 printf("Type: FLOAT\n");
 }
 else if ($1 == CHAR) {
 printf("Type: CHAR/STRING\n");
 } else {
 printf("Invalid type\n");
 }
 }
 ;
statement:
 expression {
 $$ = $1;
 }
 ;
expression:
 INTEGER {
 $$ = INTEGER;
 }
 | FLOAT {
 $$ = FLOAT;
 }
 | CHAR {
 $$ = CHAR; 
  }
 ;
%%
int main() {
 yyparse();
 return 0;
} 