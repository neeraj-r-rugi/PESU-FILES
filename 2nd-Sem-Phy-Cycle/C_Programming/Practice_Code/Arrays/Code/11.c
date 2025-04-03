#include <stdio.h>
int main()
{
	printf("How many elements do you have\n");
	int len = 0;
	scanf("%d", &len);
	int arr[len];
	printf("Enter the values\n");
	for(int i =0; i < len; i++) scanf("%d", &arr[i]);
	int out[len];
	for(int i = len - 1, j = 0; i >= 0; i--, j++) out[j] = arr[i];
	for(int i = 0; i < len; i++){
		if(!(out[i] != arr[i])){
			printf("It is not a palindrome\n");
			return 1;
		}
	}
	printf("It is a palindrome array\n");
	return 0;
}
