#include <stdlib.h>
#include <time.h>
#include <stdio.h>
#include <stdbool.h>
int RandInt(int i,int j)
{
	int tmp;
	if(i>j)
	{
		tmp=i;
		i=j;
		j=tmp;
	}
	srand((unsigned int)time(0));
	return rand()%(j-i+1)+i;
}
void Swap(int *p,int *q)
{
	int tmp;
	tmp=*p;
	*p=*q;
	*q=tmp;
}
void Substitution(int A[],int N)	//打乱数组的函数
{
	int i;
	for(i=1;i<N;i++)
		Swap(&A[i],&A[RandInt(0,i)]);
}
int main(void)
{
	char ch;
	int i,j;
	int A[]={4,5,6,7,8};	//为了方便
	Substitution(A,5);
	puts("Verify the array?y/n:");
	if((ch=getchar())=='y')
	{	
		for(i=0,j=0;i<5;i++,j++)
		{
			if(j%5==0)
				printf("\n");
			printf("%d	",A[i]);
		}
	}
	printf("\n");	
	return 0;
}
