#include <stdio.h>

#include <stdio.h>

int main() {
    int x[2] = {10, 20};
    int* ptr = x; // ptr points to x[0] (value: 10)

    printf("%d\n", *ptr++); 
    // Dereferences ptr (x[0] = 10), prints 10, then increments ptr to point to x[1].

    ptr--; 
    // Decrements ptr, so it points back to x[0].

    printf("%d\n", *++ptr); 
    // First increments ptr (now pointing to x[1]), then dereferences it. 
    // Prints x[1] = 20.

    printf("%d\n", *ptr); 
    // ptr is still at x[1], so prints x[1] = 20.

    printf("%d\n", ++*ptr); 
    // First increments the value at ptr (x[1] = 21), then prints it.

    printf("%d\n", (*ptr)++); 
    // Prints the current value of x[1] (21), then increments it (x[1] = 22).

    printf("%d\n", *ptr); 
    // Prints the updated value of x[1], which is now 22.

    return 0;
}