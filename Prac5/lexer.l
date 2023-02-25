%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "parser.tab.c"
void yyerror(char *);
%}
%option case-insensitive
%%
not return NOT;
and return AND;
or return OR;
xor return XOR;
exit return EXIT;
print return PRINT;
if return IF;
else return ELSE;
then return THEN;

v[0-9] {
          yylval.number = atoi(yytext+1);
          return VAR;
       }

t|true {
           yylval.number = 1;
           return NUM;
        }
f|false {
           yylval.number = 0;
           return NUM;
        }

[a-z0-9]+ { 
	strcpy(yylval.string, yytext );
	return STR;
	}

[()=\n] { return *yytext; }
[ \t] ;
,  {return *yytext; } 
. yyerror("invalid character");
%%

int yywrap(void) {
return 1;
}
