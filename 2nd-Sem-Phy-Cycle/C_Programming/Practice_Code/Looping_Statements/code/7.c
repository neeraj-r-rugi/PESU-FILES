#include <stdio.h>

int main() {
    int num, steps = 0;
    scanf("%d", &num);
    while (num >= 10) {
        int product = 1;
        while (num > 0) {
            product *= num % 10;
            num /= 10;
        }
        num = product;
        steps++;
    }
    printf("%d", steps);
    return 0;
}