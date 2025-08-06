

#include <stdio.h>
#include <string.h>

void selectionSort(char *arr[], int n) {
    int i, j, min_idx;
    char * temp;

    for (i = 0; i < n - 1; i++) {
        min_idx = i;

        for (j = i + 1; j < n; j++) {
            if (strcmp(arr[j], arr[min_idx]) < 0) {
                min_idx = j;
            }
        }

        if (min_idx != i){
            temp = arr[i];
            arr[i] = arr[min_idx];
            arr[min_idx] = temp;
        }
            
    }
}

int main() {
    char *arr[5] = {"banana", "apple", "grape", "cherry", "blueberry"};
    int n = sizeof(arr) / sizeof(arr[0]);

    selectionSort(arr, n);

    printf("Sorted strings:\n");
    for (int i = 0; i < n; i++)
        printf("%s\n", arr[i]);

    return 0;
}