#include <stdio.h>
#include <stdlib.h>

int main() {
    int num, temp, digits[4], i, j, large, small, result, iter = 0;
    
    printf("Enter a 4-digit number with at least two different digits: ");
    scanf("%d", &num);
    
    if (num < 1000 || num > 9999) {
        printf("Invalid input.\n");
        return 1;
    }
    
    result = num;
    
    while (result != 6174) {
        temp = result;
        for (i = 0; i < 4; i++) {
            digits[i] = temp % 10;
            temp /= 10;
        }
        
        for (i = 0; i < 4; i++) {
            for (j = i + 1; j < 4; j++) {
                if (digits[i] > digits[j]) {
                    temp = digits[i];
                    digits[i] = digits[j];
                    digits[j] = temp;
                }
            }
        }
        
        small = digits[0] + digits[1] * 10 + digits[2] * 100 + digits[3] * 1000;
        large = digits[3] + digits[2] * 10 + digits[1] * 100 + digits[0] * 1000;
        result = large - small;
        iter++;
        printf("Iteration %d: %d - %d = %d\n", iter, large, small, result);
    }
    
    return 0;
}
