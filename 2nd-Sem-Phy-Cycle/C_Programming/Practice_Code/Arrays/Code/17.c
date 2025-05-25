#include <stdio.h>

int main() {
    int n;
    scanf("%d", &n);
    int size = 2 * n;
    int arr[size], freq[100001] = {0};
    
    for (int i = 0; i < size; i++) {
        scanf("%d", &arr[i]);
        freq[arr[i]]++;
    }

    int distinct1 = 0, distinct2 = 0;
    for (int i = 0; i < 100001; i++) {
        if (freq[i] > 2) {
            printf("NO\n");
            return 0;
        }
        if (freq[i] == 2) {
            distinct1++;
            distinct2++;
        }
        if (freq[i] == 1) {
            if (distinct1 < size / 2) {
                distinct1++;
            } else if (distinct2 < size / 2) {
                distinct2++;
            } else {
                printf("NO\n");
                return 0;
            }
        }
    }
    
    if (distinct1 == size / 2 && distinct2 == size / 2) printf("YES\n");
    else printf("NO\n");
    
    return 0;
}
