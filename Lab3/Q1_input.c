#include <stdio.h> 
  
int main() 
{ 
    int i=0, j = 10;
      
    for(i=1; i<=10; i++) 
	{ 
        printf("HelloWorld");
        for(j=9; j>0; j--)
        {
            printf("%d",j);
        } 
	}
	i=5;
	i=9;
    return 0; 
} 