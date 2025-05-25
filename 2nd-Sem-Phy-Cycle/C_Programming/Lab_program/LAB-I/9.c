#include <stdio.h>
int main(){
	printf("Enter two numbers: \n");
	int x,y, temp;
	scanf("%d %d", &x, &y);
	temp = x;
	x = y;
	y = temp;
	printf("After Swap: %d %d\n", x,y);
	return 0;
}
