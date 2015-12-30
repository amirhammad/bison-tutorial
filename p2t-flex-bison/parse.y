%{
#include<stdio.h>
extern "C" int yylex();
extern int yyerror(...);
int i = 0;
%}

/*%define api.value.type union /* Generate YYSTYPE from these types:  */
%define api.value.type union/* Generate YYSTYPE from these types:  */
%token <int> NUMBER
%token <int> TYPE
%token LBRACE
%token RBRACE
%token SEMICOLON
%token EQUAL
%token MESSAGE
%token ENUM
%token <const char*> NAME
%type <const char*> contents

%left '+' '-'
%left '*' '/'
%start file

%%

file:
|	file MESSAGE NAME LBRACE contents RBRACE { printf("Found message(%d): %s %s\n", i++, $3, $5); }
;

contents: { $$ = "empty"; }
|	contents TYPE NAME SEMICOLON { $$ = $3; printf("Fount item: %d %s\n", $2, $3); }
;
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
