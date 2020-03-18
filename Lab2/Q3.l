%{ 
%} 

%% 
[^a-zA-Z]  {printf("%s not an alphabet\n", yytext);} 
[a-zA-Z]   {printf("%s  an alphabet\n", yytext);} 
%% 

int yywrap(void){}

int main() 
{ 
	printf("Enter any string:"); 
	yylex(); 
	
	return 0; 
} 
