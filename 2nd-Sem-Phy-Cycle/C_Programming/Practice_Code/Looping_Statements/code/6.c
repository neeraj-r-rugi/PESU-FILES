
#include <stdio.h>

int main() {
    int num;
    printf("Enter a number\n");
    scanf("%d %d", &num);
    int sum = 0;
    for(int i = 1; i <= num; i++){
        if(i % 2 != 0)
            sum += i;
        else
            sum -=i;
    }
    printf("%d", sum);
    return 0;
}
