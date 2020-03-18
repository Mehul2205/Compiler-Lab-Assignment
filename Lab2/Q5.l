%{ 
%} 

%% 
[a-z,A-Z]{3,5} {printf("Accepted : %s\n", yytext);} 
[a-z,A-Z]{0,2} {printf("Rejected: %s\n", yytext);}
[a-z,A-Z]{5,} {printf("Rejected: %s\n", yytext);}

\n {return 0;} 
%% 


int yywrap(){} 

int main() 
{ 
	printf("Enter any string:"); 
	yylex(); 
	
	return 0; 
}
