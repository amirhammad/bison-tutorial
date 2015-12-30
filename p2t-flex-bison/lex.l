%{
#include "parse.tab.h"
#include <stdio.h>
static int process_name(const char *name);
%}

%%
"message"	{ return MESSAGE; }
"enum"	{ return ENUM; }
"{"	{ return LBRACE; }
"}"	{ return RBRACE; }
"="	{ return EQUAL; }
";"	{ return SEMICOLON; }
[0-9]+	{ yylval.NUMBER = atoi(yytext); return NUMBER; }
[a-zA-Z]([a-zA-Z0-9])*	{ return process_name(yytext); }

%%

static int process_name(const char *name) {
	if (strcmp(name, "uint8") == 0) {
		yylval.TYPE = 22;
		return TYPE;
	}
	yylval.NAME = strdup(yytext);
	return NAME;
}
