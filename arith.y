%{
#include <cstdio>
#include <iostream>
#define YYSTYPE int

using namespace std;

// stuff from flex that bison needs to know about:
extern int line_num;
extern int yylex();
extern int yyparse();
extern FILE *yyin;

void yyerror(const char *s);
%}


%token INT

%left '+'
%left '*'

%%
lines:
      /* nothing */    { }
    | lines expr '\n'  { printf("%d\n", $2); }

expr:
      INT            { $$ = $1; }
    | expr '+' expr  { $$ = $1 + $3; }
    | expr '*' expr  { $$ = $1 * $3; }
    | '(' expr ')'   { $$ = $2; }
    ;
%%

int main(int, char**) {
   yyin = stdin;   // Standard input
   yyparse();
}

void yyerror(const char *s) {
   cout << "EEK, parse error!  Message: " << s << endl;
   cout << "On line: " << line_num << endl;
   // might as well halt now:
   exit(-1);
}
