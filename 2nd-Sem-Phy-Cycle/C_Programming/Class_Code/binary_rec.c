#include <stdio.h>

// Function for recursive binary search
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

				    return 0;
}

