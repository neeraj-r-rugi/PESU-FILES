#include <stdio.h>
#include <stdbool.h>
#include <limits.h>
#include <float.h>


/*
	Name: Neeraj
	Mental Status: Unstable, Implosion Immeinient.

*/

void main(){
	int x = 10;
	char c = 'A';
	float f = 66.6667;
	double float_double = 3.14159265359f;
	bool b = true;//requires stdbool.h
	char string[100];
	
	//format specifier: %[fieldwidth][precesion][format_specifier] -> [precesion is for floats etc..]
	printf("Hello World %s", "from C\n");
	printf("Some Data Types are:\nint: %d\nchar: %c\nfloat: %.2f\ndouble: %7lf\nBoolean(int): %d\n",x,c,f,float_double,b);
	
	printf("%s\t%s\t%s\t%s\n", "Red", "Green", "Blue", "Grey");
	
	int length = printf("I like %i\n", x);
	printf("The lennght of previous output is: %i (new lines is a character, the value format specifer replaces is also considered and added.)\n", length);
	printf("Letter\b 'r' is deleted\n");
	printf("Magic\r\n");//If any character is present after /r then it is replaced completely in GCC
	printf("\"Sound\" Lmao(Wont work only): \a\n");
	
	//Field width and precession:
	printf("%.2f\n", 56.8934);
	printf("%6.3f\n", 78.3456);
	printf("%3f\n", 78.3456);
	printf("%5d\n", 20);
	
	//Hexadecimal Octal etc:
	printf("%d\n",'A');
	printf("%x\n", 256);
	printf("%o\n", 14);
	
	//scanf("%s", string);
	//printf("%d", &x);
	//printf("%s %c\n", string, string[1]);
		
	// scanf string argument must be seperated by string
	// int test_1, test_2;
	// printf("Enter Values: ");
	// scanf("%d,%d", &test_1, &test_2);
	// printf("\n%d %d\n");

	//Taking an entire string as input
	char name[100];
	printf("Enter your Full Name: \n");
	fgets(name, 100, stdin);// length 100: 99 + 1(EOL character)
	printf("Your Name is: %s\n", name);

	//To Show input Buffer:
	printf("Input Buffer: %s", stdin);
	getchar();

	int a, b;
	char ch = 'abcd';
    scanf("%d,%d", &a, &b);//Input try: 70,70
    printf("%d %d, %c\n", a, b, ch);//prints: d

	unsigned int ac = 10; 
	unsigned int b = -10;   // observe this 
	int c = -10;  // change this to -10 and check 
	signed int d = -10; 
	printf("%u %u,%d %d %d\n",ac,b,b,c,d); 
	printf("%d %d %d %d",ac,b,c,d);
}
