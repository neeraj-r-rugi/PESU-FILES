#include <stdio.h>

// Function for recursive binary search


void bubbleSort(int arr[], int n) {
	int temp = 0;
    for(int i = 0; i < n-1; i++){
        for(int j = 0;j < n-i-1; j++)
            if(arr[j]>arr[j+1]){
            temp = arr[j];
        	arr[j] = arr[j + 1];
        	arr[j + 1] = temp;
        }
        
    }
}

void selectionSort(int arr[], int n) {
    int min_indx = 0;
    for(int i = 0; i < n-1; i++){
        min_indx = i;
        for(int j = i;j < n; j++)
            if(arr[min_indx]>arr[j]){
                min_indx = j;
            }
        int temp = 0;
        temp = arr[i];
        arr[i] = arr[min_indx];
        arr[min_indx] = temp;
    }
}

// Function to print an array
void printArray(int arr[], int size) {
    for (int i = 0; i < size; i++)
        printf("%d ", arr[i]);
    printf("\n");
}


int binarySearch(int arr[], int left, int right, int target) {
	if (left > right)
			return -1; // Element not found

		int mid = left + (right - left) / 2;

		if (arr[mid] == target)
				return mid; // Element found

			if (arr[mid] > target)
			return binarySearch(arr, left, mid - 1, target); // Search in the left half

	return binarySearch(arr, mid + 1, right, target); // Search in the right half
}

int main() {
	int arr[] = {2, 3, 4, 10, 15, 20, 25};
	int size = sizeof(arr) / sizeof(arr[0]);
	int target = 10;

	int result = binarySearch(arr, 0, size - 1, target);

	if (result != -1)
		printf("Element found at index %d\n", result);
	else
		printf("Element not found\n");
		    
	int arr[] = {64, 25, 12, 22, 11};
	int n = sizeof(arr) / sizeof(arr[0]);

	printf("Original array:\n");
	printArray(arr, n);

	selectionSort(arr, n);

	printf("Sorted array:\n");
	printArray(arr, n);
	return 0;
}

