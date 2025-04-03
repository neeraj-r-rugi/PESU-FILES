#include<stdio.h>
int main(){
	printf("Enter the amount of elements and their values\n");
	int len = 0;
	scanf("%d", &len);
	int arr[len];
	int temp = 0;
	for(int i = 0; i < len; i++) scanf("%d", &arr[i]);

	for(int i = 0; i < len - 1; i++){
		for(int j = 0; j < len - i - 1; j++){
			if(arr[j] > arr[j+1]){
				temp = arr[j];
				arr[j] = arr[j+1];
				arr[j+1] = temp;
			}
		}	
	}
	printf("The largest and second largest elements are: %d %d\n", arr[len-1], arr[len -2]);	
	return 0;
}
