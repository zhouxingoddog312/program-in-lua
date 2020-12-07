#include <stdio.h>
int Queens[9]={0},Count=0;
int isplaceok(int row,int list);
void printsolution(void);
void addqueen(int row);
int main(void)
{
	addqueen(1);
	printf("Count=%d\n",Count);
	return 0;
}
int isplaceok(int row,int list)
{
	for(int index=1;index<row;index++)
	{
		if((Queens[index]==list)||(Queens[index]-index==list-row)||(Queens[index]+index==row+list))
			return 0;
	}
	return 1;
}
void printsolution(void)
{
	for(int i=1;i<9;i++)
	{
		for(int j=1;j<9;j++)
		{
			if(Queens[i]==j)
				printf("X");
			else
				printf("-");
		}
		putchar('\n');
	}
	putchar('\n');
}
void addqueen(int row)
{
	for(int list=1;list<9;list++)
	{
		if(isplaceok(row,list))
		{
			Queens[row]=list;
			if(row==8)
			{
				printsolution();
				Count++;
				return;
			}
			addqueen(row+1);
		}
	}
}
