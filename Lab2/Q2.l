%{ 
	int positiveno=0; 
	int negativeno =0;
	int positivefractions = 0;
	int negativefractions = 0; 
%} 

DIGIT [0-9] 
%% 
  
\+?{DIGIT}+             positiveno++; 
-{DIGIT}+               negativeno++; 
  
\+?{DIGIT}*\.{DIGIT}+   positivefractions++; 
-{DIGIT}*\.{DIGIT}+     negativefractions++; 
. ;    

"\n" {
		printf("Number of Positive Integers = %d and Negative Integers = %d\n", positiveno, negativeno);
		printf("Number of Positive Fractions = %d and Negative Fractions = %d\n", positivefractions, negativefractions);
		positiveno=0; 
		negativeno =0;
		positivefractions = 0;
		negativefractions = 0;
	}
%% 

int yywrap(void){}

int main() 
{ 
	printf("Enter the string conataining only numbers:"); 
	yylex(); 
	
	return 0; 
} 
