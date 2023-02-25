%{
 #include <stdio.h>
 #include <stdbool.h>
 #define printBool(b) ((b) ? "true" : "false")
void yyerror(char *s);
int yylex(void);
bool vector[10];
%}
//Defino los token, los tokens con su tipo si es necesario, el tipo de las reglas  y los operadores que actuan a la izquierda o a la derecha por orden de precedencia
%token EXIT PRINT THEN IF ELSE
%token <number> VAR
%token <number> NUM
%token <string> STR
%right NOT '='
%left AND OR XOR

%type <number> variables
%type <number> statment
%type <number> expression
%type <string> string
 //Defino la funcion union que puede ser un entero o una cadena
%union{ int number;
	char string[100];
}
%%
//pido expresiones por consola
init: init variables '\n'
    |variables '\n'
    ;
//variables se encarga de impirimir una cadena, asignar una variable o una expresion
variables:
 	VAR '=' variables { vector[$1] = $3;$$=$3;}
|  VAR '=' statment { vector[$1] = $3;}
| statment { $$=$1; }
| PRINT string { printf("%s\n", $2); } 
;
//statment se encarga de salir del programa y de funcionamiento de los condicionales simples y dobles
statment:
	PRINT expression {printf("%s\n", printBool((int)$2));}
| EXIT {exit(1); YYACCEPT;}
| expression {$$ = $1;}
| IF expression THEN statment {if($2==1){$$=$4;}else{$$=0;}}
| IF expression THEN expression ELSE expression {if($2==1){$$=$4;}else{$$=$6;}}
;
//expression se encarga de las reglas lógicas
expression: 
	 expression OR expression   {$$ = $1|$3;}
| expression AND expression   {$$ = $1&$3;}
| expression XOR expression   {$$ = ($1&(!$3))| ((!$1)&$3);}
| NOT expression        {$$ = !$2;} 
| '(' expression ')'    { $$ = $2;}
|VAR {$$ = vector[$1];}
|NUM {$$ = $1;}
;
//string implementa cond simple o doble con cadenas
string:
	STR {strcpy($$,$1);}
|IF expression THEN string {{if($2==1){ strcpy($$,$4);}else{ strcpy($$,"\"\"");}}}
|IF expression THEN string ELSE string {if($2==1){ strcpy($$,$4);}else{strcpy($$,$6);}}
;
%%
//Funcion de error
void yyerror(char *s) {
	printf("Error en el sistema\n");
	exit(0);
}
// En el main lleno el vector de -1
int main(void) {
	for(int i = 0; i<10; i++){
		vector[i] = -1;
	}
	
	return yyparse();
};
