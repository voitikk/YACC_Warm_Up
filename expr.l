%{
/* Alex Voitik          */
/* expr.l               */
/* Last Edit: 10/2/2016 */


#define LOGICAL_EOF 0
#include "y.tab.h"
extern int yylval;

%}

%%

max               { return MAX; }

[0-9]+            { yylval = atoi(yytext); return NUMBER; }

[ \t]             ;

\n                { return LOGICAL_EOF; }

.		  { return yytext[0]; }

%%

