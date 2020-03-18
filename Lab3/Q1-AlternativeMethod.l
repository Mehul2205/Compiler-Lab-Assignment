%{
#include<stdio.h> 
#include<string.h>

#include"for_to_while.h"

struct node *head = NULL;

%}


%%
for([ ]*\n?)*[(](([^(])*\n?)*[)]([ ]*\n?)*[{] {head = replace_init(yyout, yytext,yyleng,head);}
do([^{]*\n?)*[{] {fprintf(yyout,"while(1){");}
[}]([ ]*\n?)*while([^(]*\n?)*[(]([^)]*\n?)*[)]([ ]*\n?)*[;] {replace(yyout,yytext,yyleng);}
[}] {head=replace_stop(yyout,head);}
[{] {fprintf(yyout,"{ ");head=push(head,0,NULL);}
["]([^"]*\n?)*["] {fprintf(yyout,"%s",yytext);}
.   {fprintf(yyout,"%s",yytext);}
\n  {fprintf(yyout,"\n");}
%%


int yywrap(){}
int main(int argc, char*argv[]) { 
    extern FILE *yyin, *yyout;
    yyin=fopen("Q1_input.c","r"); 
    yyout=fopen("Q1_output.c","w");
    printf("Processing. . .\n"); 
    yylex();
    printf("Done!\n");
} 