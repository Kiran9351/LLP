#include<stdio.h>

extern str_len();

int main()
{
  int len = 0;
  len = str_len();

  printf("String length is : %d",len);
  return 0;
}
