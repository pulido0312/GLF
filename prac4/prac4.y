/*Alejandro Pulido Sanchez*/
%{
#include <stdio.h>
#include "lex.yy.c"

/*Defino la funcion yyerror para los errores, yylex y yywrap para saber si sigue habiendo valores de entrada*/
int yyerror( char * s ) {
fprintf ( stderr, "%s\n", s ); return 0;
 }
int yywrap()
{
return 1;
}
int yylex(); %}
/*Defino los componentes lexicos*/
%%
I : S '\n' { printf("Correcto\n"); }
; 
a:'/''*'
b:'*''/'
S : a S b S { printf("S->a S b S \n"); }
| { printf("S->epsilon\n"); }
;
%%
/*Defino la funcion main*/
int main() { yyparse(); return 1; }
