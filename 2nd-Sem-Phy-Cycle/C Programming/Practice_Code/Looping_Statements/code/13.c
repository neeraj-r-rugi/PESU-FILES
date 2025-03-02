#include <stdio.h>

int main() {
    int r, spaces;
    printf("Enter a number: \n");
    scanf("%d", &r);
    spaces = r -1;
    int c = 1;
    for(int i = 0; i < r; i++){
        for(int j  = 0; j < spaces; j++)
            printf(" ");
        for(int j = 0; j < c; j++)
            printf("* ");
        c++;
        spaces--;
        printf("\n");
    }
    spaces =  1;
    c = r-1;
    for(int i = 0; i < r-1; i++){
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
