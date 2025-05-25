#include<stdio.h>

int main(){
	int x,y,z;
	printf("Enter 3 numbers seperated by spaces: \n");
	scanf("%d %d %d", &x, &y,&z);
	float average = 0.0f;
	average = (x+y+z)/3.0;
	printf("The average is: %.2f\n", average);
	return 0;
	
}

