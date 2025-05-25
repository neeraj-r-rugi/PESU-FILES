#include <stdio.h>
int main(){
	float l,b;
	printf("Enter the length and breadth: \n");
	scanf("%f %f", &l, &b);
	printf("The perimeter is: %.2f\n", 2*(l+b));
	return 0;
}
