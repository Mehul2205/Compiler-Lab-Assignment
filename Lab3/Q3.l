
%{ 

#include <stdio.h>
#include <string.h>
#include<stdlib.h>

int ind=0; 

char array[50][50];
int h;
int p;
void define();
void output();
void table();

%} 


LETTER      [A-Za-z]
DIGIT       [0-9]
UNDERSCORE  [_] 
ID       ({LETTER}|{UNDERSCORE})({LETTER}|{DIGIT}|{UNDERSCORE})*
FUNCTION {ID}[(]({ID}|{DIGIT})*[)]

DEFINE      ^[ ]*#[ ]*define[ ]+{ID}[(]{ID}[)][ ]+(({ID}[*+/%^-|&!?.]{ID})|{FUNCTION}[ ]*[*+/%^-|&!?.]*[ ]*{ID}*)



%%

{DEFINE} {define(yytext);ind++;}
{FUNCTION} {output();}
%%


void output()
{

//printf("function detected: %s",yytext);
//fprintf(yyout,"%s",yytext);

int r,de;
for(de=0;de<=ind;de++)
	{
		char arr[50];
		char arr_e[50];
		for(r=0;r<h;r++)
		{
			if (array[de][r]!=' ')
			{
				arr[r]=array[de][r];
			}
			else
			{
				break;
			}
		}

		

		/*int itr=0;
		while(arr[itr]!=' ')
		{
			printf("%d",itr);
			itr++;
		}*/

		int y;
		int j = 0;
		int u=0;
		for(y=r+1;y<h;y++)
		{
			if (array[de][y]!=' ')
			{
				arr_e[u]=array[de][y];
				u=u+1;
			}
			else
			{
				break;
			}
			
		}
		char arr_e2[100];
		int s;
		for(s=0;s<u;s++)
		{
			arr_e2[s]=arr_e[s];
		}
		

		for (j=0;j<=ind;j++)
		{
			//printf("arr_e: %c %c\n",arr_e[0],arr_e[1]);
			//printf("array: %c\n",array[j][0]);
			//int itr=0;
			//int itr2=0;
			if(arr_e[0]==array[j][0])
			{
				/*arr_e2[itr]=arr_e[itr2];
				itr++;
				itr2++;*/
				int flag=0;
				int v;
				int g= 0;
				int p = 0;
				for( v=1;v<h;v++ )
				{
					if(array[j][v]==' ')
					{
						flag=1;
						break;
					}
					if(arr_e[v]!=array[j][v])
					{
						break;
					}
					/*else
					{
						arr_e2[itr]=arr_e[itr2];
						itr++;
						itr2++;
					}*/
				}
				if(flag==1)
				{
					int itr=0;
					for(g=v+1;array[j][g]!='\0';g++)
					{
						arr_e2[itr]=array[j][g];
						itr++;
					}
					/*for(g=0;g<u;g++)
					{
						printf("arr_e: %c\n",arr_e[g]);
					}
					printf("itr2: %d\n",v);
						*/
					for(g=v;g<u;g++)
					{
						
						arr_e2[itr]=arr_e[g];
						itr++;
					}
					if (itr<s)
					{
						for(p=itr;arr_e2[p]!='\0';p++)
						{
							arr_e2[p]='\0';
						}
					}
					
				}
				//printf("ping \n");
			

			}
		}

		int b1=0;
		if (yytext[2]>=48 && yytext[2]<=57)
		{
			int digit=yytext[2]-48;
			for (b1=3;yytext[b1]!=')';b1++)
			{
				digit=(digit*10)+(yytext[b1]-48);
			}
			char charac;
			int b;
		for (b=0;arr[b]!='\0';b++)
		{
			if (arr[b]=='(')
			{
				charac=arr[b+1];
				break;
			}
		}
		//printf("|||%c\n",charac);
		char arr_e3[200];
		int b2=0;

			for(b1=0;arr_e2[b1]!='\0';b1++)
			{
				if(arr_e2[b1]==charac)
				{
					arr_e2[b1]=yytext[2];
				}
			}
			arr[b+1]=yytext[2];
			//printf("----%c\n",arr[b+1]);
		}
		char* t;
		t=arr;
		char* e;
		e=arr_e2;
		//printf("t= %s \n",t);
		//printf("yytext= %s \n",yytext);
		//printf("arr_e2= %s \n",e);
		if (strcmp(yytext,t)==0)
			{
				//printf("ping \n");
				fprintf(yyout,"%s",e);
				break;
			}
	}
	if(de>ind)
	{
		fprintf(yyout,"%s",yytext);
	}

}

void define(char *s){
	// fprintf(o, "{\n");
	//printf("FUNCTION = %s \n",s);
	fprintf(yyout,"%s",s);	
	int i=1;
	int q = 0;
	int j = 0;
	while(s[i]==' ')
	{
		i++;
	}
	i=i+6;
		while(s[i]==' ')
	{
		i++;
	}
	//printf("AT: %c",s[i]);
	char func[20];
	int k=0;
	while(s[i]!=' ')
	{
		func[k]=s[i];
		k++;
		//printf("I: %d",i);
		i=i+1;
	}
	for(j=0; j<k; j++)
	{
		//printf("%c",func[j]);
	}
	while(s[i]==' ')
	{
		i++;
	}

	//printf("AT: %c",s[i]);

	char expr[20];
	p=0;
	while(s[i]!='\n')
	{
		expr[p]=s[i];
		p++;
		i=i+1;
	}
	//printf("Expression:");
	for(q=0; q<p; q++)
	{
		//printf("%c",expr[q]);
	}


	
	int r= 0;
	int g = 0;
	for (h=0;h<k;h++)
	{
		array[ind][h]=func[h];
	}
	array[ind][h]=' ';
	h++;

	for (g=0;g<p;g++)
	{
		array[ind][h]=expr[g];
		h++;
	}
	int de;
	for( de=0;de<=ind;de++)
	{
		for(r=0;r<h;r++)
		{
			//printf("%c",array[de][r]);
		}
	//	printf("-------- \n");
	}
	//printf("%d",de);
}

void table()
{
	FILE *o;
	printf("\n\n\n\n\n");
	o=fopen("Q3_symbol.txt","w");
	int de;
	for( de=0;de<=ind;de++)
	{
		fprintf(o,"%s",array[de]);
		fprintf(o,"\n");
		printf("%s\n", array[de]);
	}

}

int yywrap(){};
int main()
    {
    yyin = fopen("Q3_input.txt","r");
    yyout = fopen("Q3_output.txt","w");

    yylex();
    table();
    }