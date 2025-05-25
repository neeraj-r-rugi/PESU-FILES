#include<stdio.h>
int main(){
	printf("Enter the no. of elements and the values\n");
	int len = 0;
	scanf("%d", &len);
	for(int i = 0; i < len; i++) scanf("%d", &arr[i]);
	int out[len];
	if(arr[0] > arr[1]) out[0] = out[0] = arr[0];
	int ele = 1;
	for(int i = 1; i < len - 1; i++){
		if(arr[i] > arr[i+1] && arr[i] > arr[i-1]){
				out[ele] = arr[i];
				ele++;
			}
	}
	if(arr[len - 1] > arr[len - 2])
		out[ele] = arr[len - 1];
	printf("The Peaks are: \n");
	for(int i = 0; i <= ele; i++) printf("%d\n", out[i]);
	return 0;
}
