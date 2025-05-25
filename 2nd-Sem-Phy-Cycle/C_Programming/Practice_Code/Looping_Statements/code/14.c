#include <stdio.h>

int main() {
    int n;
    int temp;
    printf("Enter a positive integer: ");
    scanf("%d", &n);
    int min = n, max = -n;
    while(n){
        temp = n % 10;
        if(temp > max)
            max = temp;
        else
            if(temp < min)
                min = temp;
        n /= 10;
    }
    
    return 0;
}