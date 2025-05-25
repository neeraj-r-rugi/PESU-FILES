
#include <stdio.h>

int main() {
    int num, f;
    int count;
    printf("Enter a number and the number to be found: \n");
    scanf("%d %d", &num, &f);
    while(num){
    	if(num % 10 == f)
    		count++;
    	num /= 10;
    }
    printf("Occurs: %d times", count);
    return 0;
}
