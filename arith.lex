%{

#include "arith.tab.h"  // to get the token types from Bison
int line_num = 1;

%}

%%
[ \t]                  ;
[0-9]+                 { yylval = atoi(yytext); return INT; }
\(                     { return '('; }
\)                     { return ')'; }
\+                     { return '+'; }
\*                     { return '*'; }
\n                     { ++line_num; return '\n'; }
%%
