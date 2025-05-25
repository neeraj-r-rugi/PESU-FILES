#include <stdio.h>

int main(){
	float si = 0.0f, principal = 0.0f, rate = 0.0f;
	int years;
	
	printf("Enter Principal Rate and number of years: ");
	scanf("%f %f %d", &principal, &rate, &years);
	si = (principal * rate * years) / 100;
	
	printf("\nThe simple intrest is: %.2f", si);
	
	getchar();
	getchar();
	return 0;
}