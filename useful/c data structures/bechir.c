#include<stdio.h>
#include<string.h>
#include<time.h>
#define n 5//length of the string produced
void increment(int *,int,int);
// int check(char *,int);
int main(void)
{
    clock_t begin = clock();
    int i,j,k[n],test;
    char p[100],s[n];
    p[0]='\0';
    FILE *fp = NULL;
    fp = fopen("combinations.txt", "w");
    for (i=1;i<='Z'-'A'+1;i++)
        p[i]='A'+i-1;
   for (j=0;j<='z'-'a';i++,j++)
     p[i]='a'+j;
    for(int a=0;a<=n-1;a++)
        k[a]=0;
    k[0]=1;
    printf("intitiaion done\n");
    if(fp != NULL)
    {
        do
        {
            for(int a=0;a<=n-1;a++)
            {s[a]=p[k[a]];}
            s[n]='\0';
            fprintf(fp, "%s\n", s);
            k[0]++;
            increment(k,0,i);

        }while(strcmp(s,"zzzzz"));
    }
    else
    {
        printf("Error while loading file\n");
    }
    clock_t end = clock();
double time_spent = (double)(end - begin) / CLOCKS_PER_SEC;

    printf("Task done in %f.\n",time_spent);
    fclose(fp);
    return 0;
}
void increment(int *k,int a,int i)
{
    if(k[a]==i)
    {
        if(a<n)
        {
            k[a]=1;
            k[a+1]++;
            increment(k,a+1,i);
        }
    }
}

