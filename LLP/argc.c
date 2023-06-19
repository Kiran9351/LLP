#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>


main(int argc, char **argv, char **envp)
{
	int i = 0;

	if(argc < 2)
	{
		printf("Insufficient parameter/arguments\n");
		exit;
	}
	
	for(i = 0; i <= 12; i++)
	{
		printf("envp[%d] = %s and argv[%d] = %s\n:w",i,envp[i],i,argv[i]);
	}
}
