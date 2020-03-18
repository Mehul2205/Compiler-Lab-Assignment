#include <stdio.h> 
  
int main() 
{ 
    int i=0, j = 10;
      
    for(i=1; i<=10; i++) 
	{ 
        printf("HelloWorld");
        do
        {
            printf("%d",j);
            j++;
        } while (j<2);
	}
	i=5;
	i=9;
    return 0; 
} 