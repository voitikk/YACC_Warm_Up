%{
/* Alex Voitik          */
/* expr.y               */
/* Last Edit: 10/2/2016 */
#define max(a,b) (a > b) ? a : b

%}

%token NUMBER MAX

%right '+' '-'
%left '*' '/'
%nonassoc UMINUS

%%
statement  : expression 				{printf("= %d\n", $1); } ;

expression : expression '*' expression    		{$$ = $1 * $3;}
	   | expression '/' expression
							{if ($3 == 0)
								yyerror("division by zero");
							else
								$$ = $1 / $3;
							}
	   | expression '+' expression		   	{$$ = $1 + $3;}
	   | expression '-' expression		   	{$$ = $1 - $3;}
	   | '-' expression %prec UMINUS           	{$$ = - $2;}
           | '(' expression ')'                    	{$$ = $2;}
	   | NUMBER 				    	{$$ = $1;}
	   | MAX '(' expression ',' expression ')'	{$$ = max($3, $5);}
;
%%
#include "stdio.h"
main()
{
    printf("About to parse\n");
    yyparse();
}
