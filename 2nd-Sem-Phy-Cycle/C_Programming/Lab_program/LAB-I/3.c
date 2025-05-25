#include <stdio.h>
#include <math.h>
int main(){
	printf("Enter Radius: \n");
	float rad = 0.0f;
	scanf("%f", &rad);
	printf("The radius is: %.2f\n", (4.0f/3.0f)*3.14*rad*rad*rad);
	return 0;
}
