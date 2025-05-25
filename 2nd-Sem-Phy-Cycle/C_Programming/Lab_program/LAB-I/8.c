#include <stdio.h>
#include <math.h>
int main(){
	printf("Enter number of seconds: \n");
	int x;
	scanf("%d", &x);
	printf("H: %d\n", x/3600);
	printf("M: %d\n", (x%3600)/60);
	printf("S: %d\n", x%60);	
	return 0;
}
