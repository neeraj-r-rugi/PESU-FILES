#include <stdio.h>

int main() {
    int r, spaces;
    printf("Enter a number: \n");
    scanf("%d", &r);
    spaces =  0;
    int c = r;
    for(int i = 0; i < r; i++){
        for(int j  = 0; j < spaces; j++)
            printf(" ");
        for(int j = 0; j < c; j++)
            printf("* ");
        c--;
        spaces++;
        printf("\n");
    }
    return 0;
}
