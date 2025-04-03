#include <stdio.h>

int main() {
    int limit, i, j, is_prime;
    printf("Enter a non-negative integer: ");
    scanf("%d", &limit);
    if (limit < 0) {
        printf("Invalid input! Please enter a non-negative integer.\n");
    } else {
        printf("Prime numbers up to %d are: ", limit);
        for (i = 2; i <= limit; i++) {
            is_prime = 1;
            for (j = 2; j * j <= i; j++) {
                if (i % j == 0) {
                    is_prime = 0;
                    break;
                }
            }
            if (is_prime) {
                printf("%d ", i);
            }
        }
        printf("\n");
    }
    return 0;
}
