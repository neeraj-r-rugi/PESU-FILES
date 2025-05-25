#include <stdio.h>
#include <math.h>
int main(){
	printf("Enter a number: \n");
	int x;
	scanf("%d", &x);
	int num = x % 10;
	int out = num*10 + (x/10);
	printf("Reversed: %d\n", out);
	
	return 0;
}
