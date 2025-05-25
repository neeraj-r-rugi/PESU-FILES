#include <stdio.h>
#include <math.h>
int main(){
	printf("Enter Principal, Rate, and no. Years: \n");
	float p =0.0, r=0.0, t=0.0;
	
	scanf("%f %f %f", &p, &r, &t);
	float exp = 1 + (r/100);
	double val = pow(exp, t);
	float ci = (p*val) - p;
	printf("The CI is: %.3f\n", ci);
	
	return 0;
}
