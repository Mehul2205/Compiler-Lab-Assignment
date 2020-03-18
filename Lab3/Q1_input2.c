#include <stdio.h> 
  
int main() 
{ 

    int i=0;
    do
    {
        printf("HelloWorld");
        int j=0;
        do
        {
            printf("%d",j);

            j++;
        } while (j<2);
        i++;
        printf("%d",j);

    } while (i<2);
}