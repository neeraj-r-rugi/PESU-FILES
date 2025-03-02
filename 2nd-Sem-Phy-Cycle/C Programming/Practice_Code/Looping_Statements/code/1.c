#include<stdio.h>
#include<stdbool.h>
int main(){
	printf("Enter a number\n");
	int n,x,y, temp;
	scanf("%d",&n);
	if(n <0){
		printf("Number invalid\n"); 
		return 1;
	}
	x =0, y = 1;
	for(int i = 1; i<= n; i++){
		printf("%d\n", x);
		x += y;
		y = x;
	}
	return  0;
}