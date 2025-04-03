nclude <stdio.h>

int main() {
	int n, d, i, j;
	scanf("%d", &n);
	int arr[n];
	for (i = 0; i < n; i++) {
		scanf("%d", &arr[i]);
	}
	scanf("%d", &d);
	int temp[d];
	for (i = 0; i < d; i++) {
		temp[i] = arr[i]
	}
	for (i = 0; i < n - d; i++) {
		arr[i] = arr[i + d];
	}
	for (i = 0; i < d; i++) {
		arr[n - d + i] = temp[i];
	 }
	 for (i = 0; i < n; i++) {
		printf("%d ", arr[i]);
	 }
	 return 0;
}

