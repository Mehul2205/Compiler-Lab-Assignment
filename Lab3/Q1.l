/*Lex program to covert for loop into while loop without changing the meaning of the program. */
%{

#include<stdio.h>
#include<string.h>
#include<ctype.h>
 
	char ipfile[20];
	char line[20][10];
	int i=0, j=0;
%}

sp "."
ext [a-zA-Z]+
funend ")"
ini "{"
fin "}"

op "++"|"--"
rop "<"|">"|"<="|">="|"=="|"!="
id [a-zA-Z][a-zA-Z0-9]*
no [0-9]*
pp [\n\t" "]

%%

({sp}{ext})?\>		{ fprintf(yyout, "%s", yytext); }
({rop}({id}|{no}))?\;	;
({no}|{id}|{pp}|{funend})?\;	{ fprintf(yyout, "%s", yytext); }

for\(					;
({id}=({no}|{id}))?\;	{fprintf(yyout, "%s", yytext);}
{id}{rop}({id}|{no})	{fprintf(yyout, "\nwhile("); fprintf(yyout, "%s" ")" ,yytext);}
{id}{op}\;		{fprintf(yyout, "%s", yytext);}
{id}{op}  		{ strcpy(line[i++], yytext);}
({op})?\)		;
({id}\")?\)\;		{ fprintf(yyout, "%s", yytext); }
(\()?\)			{ fprintf(yyout, "%s" , yytext); }

do([^{]*\n?)*[{]			{ fprintf(yyout, "while(true){"); }
[}]([ ]*\n?)*while		;
\({id}{rop}({id}|{no})\)	{fprintf(yyout, "if(!"); fprintf(yyout, "%s" "){ break;}}" ,yytext);}
\n	{ fprintf(yyout, "\n"); }
\t	{ fprintf(yyout, "\t"); } 
\{	{ fprintf(yyout, "%s", yytext); }
\.	{ fprintf(yyout, "%s", line); }  
\}	{ fprintf(yyout, "%s" ";" "\n" "\t" "}", line[--i]); }
{id}{pp}*{no}\;{pp}*\} { fprintf(yyout, "%s" , yytext); }

%% 

int yywrap() 
{ 
    return 1; 
} 
  
/* driver section */
int main() 
{ 
    extern FILE *yyin, *yyout; 

	printf("Enter the filename: \n"); 
	scanf("%s",ipfile);
   	yyin=fopen(ipfile, "r"); 
   
   	yyout=fopen("Q1_output.c", "w");
	
        yylex();

return 0;
} 
