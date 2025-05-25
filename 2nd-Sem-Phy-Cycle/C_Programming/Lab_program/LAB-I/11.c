#include <stdio.h>
int main(){
	printf("Enter a number: \n");
	int x;
	scanf("%d", &x);
	printf("Multiplying by 8: %d\n", x << 3);
	return 0;
}
