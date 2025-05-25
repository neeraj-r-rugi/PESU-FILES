#include <stdio.h>
#include <math.h>
int main(){
	printf("Enter two numbers to divide(X/Y): \n");
	int x,y;
	scanf("%d %d", &x, &y);
	float rem = x%y;
	float quo = x/y;
	printf("Reminder is: %.2f\nQutionent is: %.2f\n", rem, quo); 	
	return 0;
}
