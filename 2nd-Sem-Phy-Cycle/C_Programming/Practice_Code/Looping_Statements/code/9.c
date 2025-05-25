
#include <stdio.h>
#include<stdbool.h>
int main() {
    int sum;
    printf("Enter 0 to stop average\n");
    int temp, count =0;
    while(true){
        temp = 0;
        scanf("%d", &temp);
        sum += temp;
        if(temp == 0)
            break;
        count++;
    }
    printf("\nThe Average is: %.2f\n",(float)sum/count);
}
