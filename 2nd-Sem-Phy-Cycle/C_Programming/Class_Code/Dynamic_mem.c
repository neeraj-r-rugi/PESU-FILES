// Online C compiler to run C program online
#include <stdio.h>
#include <stdlib.h>
int* get_array(int n){
    int *ptr = (int*) calloc(n, sizeof(int));
    if(ptr == NULL){
        printf("Failed to allocate memory.\n");
        return ptr;
    }
}


int* extend_array(int** ptr, int n){
    int* new_arr = (int*) realloc(*ptr, n * sizeof(int));
    if(new_arr == NULL){
        printf("Failed to reallocate memomry\n");
        free(*ptr);
        return new_arr;
    }
    return new_arr;
}

//Another way of doing it:
void extend_array_2(int** ptr, int n){
    int* new_arr = (int*) realloc(*ptr, n * sizeof(int));
    if(new_arr == NULL){
        printf("Failed to reallocate memomry\n");
        free(*ptr);
    }
    *ptr = new_arr;
}



int main() {
    // Write C code here
    printf("How many elements do you want intially?\n");
    int n;
    scanf("%d", &n);
    int *ptr = (int*) get_array(n);
    if(ptr == NULL){
        printf("Program Ending\n");
        free(ptr);
        return -1;
    }
    for(short unsigned int i = 0; i<n; i++){
        printf("%d ", *(ptr + i));
    }
    printf("\nHow many elements do you want to add to the array?\n");
    int* p = malloc(1 * sizeof(short int));
    scanf("%d", p);
    n += *p;
    free(p); p = NULL;

    //! Note: The next two lines do the same thing.
    //ptr = extend_array(&ptr, n);
    extend_array_2(&ptr, n);


    if(ptr != NULL){
        for(short unsigned int i = 0; i<n; i++){
            printf("%d ", *(ptr + i));
        }
    }
    free(ptr); ptr = NULL;
    printf("\nThe program is complete\n");
    

    return 0;
}