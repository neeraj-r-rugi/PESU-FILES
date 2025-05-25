#include <stdio.h>
int main(){
	printf("Enter the number till where you want to find sum: \n");
	int x;
	scanf("%d", &x);
	int sum = x*(x+1)/2;
	printf("Sum of first %d natural numbers is: %d\n", x, sum);
	return 0;
}
