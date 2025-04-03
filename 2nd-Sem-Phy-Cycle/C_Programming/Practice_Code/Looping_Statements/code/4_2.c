#include<stdio.h>
#include<stdbool.h>
int main(){
    printf("The number and the exponent: \n");
    int num, pow;
    scanf("%d %d", &num, &pow);
    if(num < 0 || pow < 0){
        printf("Invalid Input\n");
        return 1;
    }
    int ans = num;
    for(int i = 1; i <= pow; i++)
        ans *= num;
    printf("The answer is: %d\n", ans);
    return 0;
}