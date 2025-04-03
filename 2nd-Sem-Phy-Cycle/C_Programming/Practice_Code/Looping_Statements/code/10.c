#include<stdio.h>
#include<math.h>
int main(){
	printf("Enter binary number: \n");
	int bin;
	scanf("%d", bin);
	int i = 0, sum = 0;
	while(bin){
		sum += (bin % 10) * (pow(2, i));
		bin /= 10;
	}
	return 0;
}