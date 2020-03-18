/* Lex program to identify identifiers and keywords in a C-program given in a file and print <ID> and <KW> in front of them respectively*/

%{

#include<stdio.h>
char ipfile[20];

%}

%%

default|auto|break|char|const|continue|case|do|else|if|while {fprintf(yyout,"%s<KW>", yytext);}
extern|double|float|for|goto|int|long|register|return|short|signed|sizeof {fprintf(yyout,"%s<KW>", yytext);}
static|enum|struct|switch|typedef|union|unsigned|void|volatile {fprintf(yyout,"%s<KW>", yytext);}

[a-zA-Z_][a-zA-Z0-9_]* {fprintf(yyout,"%s<ID>", yytext);}
[.%<&"#][a-zA-Z0-9_]*  {fprintf(yyout,"%s",yytext);}
[a-zA-Z0-9_]*[ ]*[(].*[)]   {fprintf(yyout,"%s",yytext);}
.                      {fprintf(yyout,"%s", yytext);}
\n                     {fprintf(yyout,"\n");}

%%

int yywrap() {}
int main(){
	extern FILE *yyin , *yyout;

	printf("Enter the filename: \n"); 
	scanf("%s",ipfile); 

	yyin = fopen(ipfile,"r"); 
	yyout = fopen("Q2_output.txt","w");

	yylex();

return 0;
}