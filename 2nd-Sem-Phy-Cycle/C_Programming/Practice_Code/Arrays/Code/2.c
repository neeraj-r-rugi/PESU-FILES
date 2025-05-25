#include <stdio.h>
int main(){
	printf("How many runners do you have\n");
	int runner = 0;
	scanf("%d", &runner);
	int arr[runner];
	printf("Enter the time for each runner");
	for(int i =0; i < runner; i++) scanf("%d", &arr[i]);
	int max = arr[0];
	for(int i = 0; i < runner; i++) max = (max>arr[i])? arr[i]:max;
	printf("The lowest time is: %d", max);
	return 0;
}
