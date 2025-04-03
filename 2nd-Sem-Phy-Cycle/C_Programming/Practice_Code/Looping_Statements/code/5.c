
#include <stdio.h>

int main() {
    int num, f;
    int count, sum;
    printf("Enter a number and the number to be found: \n");
    scanf("%d %d", &num, &f);
    while(num){
        sum += (num % 10);
    	num /= 10;
    }
    if(num % sum == 0)
        printf("It is Harshad Number");
    else
        printf("It is not Harshad Number");
    return 0;
}
