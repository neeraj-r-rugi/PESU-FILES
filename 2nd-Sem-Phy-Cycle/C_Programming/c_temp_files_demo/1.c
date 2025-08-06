#include<stdio.h>
#define VALUE 1024
int main(void){
	#ifdef VALUE
		printf("LMAO: %d\n", VALUE);
	#endif
	return 0;
}
	