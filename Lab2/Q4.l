
%{ 

#include<string.h> 

void identifier();

void keyword();

%} 

IF          [i][f]
ELSE        [e][l][s][e]
WHILE       [w][h][i][l][e]
FOR         [f][o][r]
DO          [d][o]
INT         [i][n][t]
FLOAT       [f][l][o][a][t]
CHAR        [c][h][a][r]
DOUBLE      [d][o][u][b][l][e]
LETTER      [A-Za-z]
DIGIT       [0-9]
UNDERSCORE  [_] 
KEYWORD     ({IF}|{ELSE}|{WHILE}|{FOR}|{DO}|{INT}|{FLOAT}|{CHAR}|{DOUBLE})
ID          ({LETTER}|{UNDERSCORE})({LETTER}|{DIGIT}|{UNDERSCORE})*

%%
{KEYWORD} keyword();
{ID}   identifier();     
. ;
%%

void keyword(){

    printf("KEYWORD = %s \n",yytext);
}

void identifier(){
    printf("identifier = %s \n",yytext);
}

int yywrap(){}

int main() 
{ 
	printf("Enter any string:"); 
	yylex(); 
	
	return 0; 
}