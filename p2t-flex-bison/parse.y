%{
#include<stdio.h>
extern "C" int yylex();
extern int yyerror(...);
%}

%token NUM
%left '+' '-'
%left '*' '/'

%start line 

%%

line:   
       /* empty */ 
     |line exp '\n' {printf("%d\n",$2);}
     | error '\n';

exp:      exp '+' exp {$$ = $1 + $3;}
        | exp '*' exp {$$ = $1 * $3;}
        | exp '-' exp {$$ = $1 - $3;}
        | exp '/' exp { if ($3 == 0)
                                $$ = 0;
                        else
                                $$ = $1/$3;}
        | NUM          {$$ = $1;};
%%

int yyerror(...)
{
        printf("Error detected in parsing\n");
	return 0;
}

int main()
{
        yyparse();
	return 0;
}
