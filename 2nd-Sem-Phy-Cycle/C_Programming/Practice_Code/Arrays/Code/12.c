#include<stdio.h>
#include<stdbool.h>
int main(){
	printf("Enter the no. of values you want and the enter each value\n");
	int len = 0;
	scanf("%d",&len);
	int arr[len];
	for(int i = 0; i < len; i++) scanf("%d",&arr[i]);

	bool r_sorted = true, sorted = true;
	for(int i = 0; i < len-1; i++){
		if(arr[i] <= arr[i+1]){
			if(arr[i] == arr[i+1]) r_sorted = false;
		}else{
			sorted = false;
			return 1;
		}
	
	}
	if(r_sorted) printf("It is really sorted\n");
	else printf("It is sorted array\n");	
	return 0;
}
