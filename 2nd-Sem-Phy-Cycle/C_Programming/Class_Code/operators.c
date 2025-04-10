#include <stdio.h>
#include <stdbool.h>
#include <math.h>

int main(){
	//Arithmetic operator
	printf("Arithmetic Operators: \n");
	printf("%d %f %f %f\n", 2+3, 2.0+3, 2+3.0, 2.0+3.0);
	printf("%d %f %f %f\n", 2-3, 2.0-3, 2-3.0, 2.0-3.0);
	printf("%d %f %f %f\n", 2/3, 2.0/3, 2/3.0, 2.0/3.0);
	printf("%d %f %f %f\n", 22/3, 22.0/3, 22/3.0, 2.0+3.0);
	printf("%d\n", 22%3);
	int a = 22%3;
	printf("Reminder of 22/3: %f\n", (float)a);
	printf("%d\n", (2*3/2+5-3%2));
	printf("-----------------------------------------------------------\n");

	//Unary Operator
	printf("Unary Operators(Increment-Decrement operators): \n");
	int x = 10;
	printf("Pre Increment: %d\n", ++x);
	printf("Pre Decrement: %d\n", --x);
	printf("Post Increment: %d\n", x++);
	printf("Post Decrement: %d\n", x--);
	int b = x++;
	printf("b = x++: %d X: %d\n", b, x);
	b = ++x;
	printf("b = ++x: %d X: %d\n", b, x);
	printf("The Value of x is: %d\n ", x);
	printf("x++ + ++x: %d\n x-- + --x: %d\n",x++ + ++x, x-- + --x);//You might expect 12 + 14; 14 + 12 but it is actually wrong
	/*

		It follows right to left associativity
		and -- has higher precedence than ++
		let x-- + --x = a
		let x++ + ++x = b
		then it follows
		a: 11(-1 to be decremented) + 11(already decremented to 11 from 12)
		x value now is: 10

		b: 11(+1 to be incremented) + 11(already incremented to 11 from 10)
		why a first? Because -- has higher precedence!
		In a why --x got executed first because it associates from right to left!
	*/
	//<var>++ -> First Assign Old Value then increment to new value(continuing executing the expression with old value) and store.
	//++<var> -> First Assign Incremented value(continue executing expression with new value) then store it.
	printf("***********************\n");
	a = 100;
	printf("Before Increment: %d\n", a);
	a++;
	printf("After Increment: %d\n", a);
	printf("Value of a is: %d\n", a++);
	printf("Now it is: %d\n", a);
	printf("-----------------------------------------------------------\n");


	//Logical Operators
	printf("Logical Binary Operators: \n");
	_Bool bool_1 = true;
	_Bool bool_2 = false;
	_Bool bool_3 = false;
	printf("Value of true: %d and false: %d\n", bool_1, bool_2);
	int result_AND = bool_1 && bool_2;
	int result_OR = bool_1 || bool_2;
	int result_NOT = !(bool_1 && bool_2);
	printf("AND operation: %d\n", result_AND);
	printf("OR operation: %d\n", result_OR);
	printf("NOT operation: %d\n", result_NOT);
	printf("Precednce follows NOT-> AND -> OR: %d\n", bool_1&&bool_2||!bool_3);
	//it is: [true AND false OR NOT(false)] -> [true AND false OR true] -> [true AND true] -> [true] -> [1](C represents 1 as true and 0 as false, hence we use %d to print the values)
	printf("-----------------------------------------------------------\n");

	//Relational Operators
	a = 10;
	b = 20;
	int c = 10;
	printf("Relational Operators: \n");
	printf("10 == 10: %d\n10==20: %d\n10<20: %d\n10>=10: %d\n", a==c, a==b, a<b, c>=a);
	printf("-----------------------------------------------------------\n");

	//Bitwise Operators 
	printf("Bitwise operator: \n");
	a = 12;    // 1100 in binary
    b = 5;     // 0101 in binary

    // AND operator (&)
    int and_result = a & b;
    printf("a & b = %d (Binary: %04d)\n", and_result, and_result);

    // OR operator (|)
    int or_result = a | b;
    printf("a | b = %d (Binary: %04d)\n", or_result, or_result);

    // XOR operator (^)
    int xor_result = a ^ b;
    printf("a ^ b = %d (Binary: %04d)\n", xor_result, xor_result);

    // NOT operator (~)
    int not_result = ~a;
    printf("~a = %d\n", not_result);

    // Left shift (<<)
    int left_shift = a << 1;
    printf("a << 1 = %d (Binary: %04d)\n", left_shift, left_shift);
    /*
    Each shift multiplies the number by 2.
	Zeros (0s) are inserted from the right.
	The leftmost bit is discarded.
	process continues for n number of times as specified to shift(var << n)
    */

    // Right shift (>>)
    int right_shift = a >> 1;
    printf("a >> 1 = %d (Binary: %04d)\n", right_shift, right_shift);
    /*
    Each shift divides the number by 2.
	The rightmost bits are discarded.
	Leftmost bits depend on the type of shift:
    	Logical Shift (for unsigned numbers): Inserts 0s on the left.(ex: a = 8; a <<1;)
    	Arithmetic Shift (for signed numbers): Preserves the sign bit (MSB).
    	process continues for n number of times as specified to shift(var >> n)
    */

    // Complex precedence example
    printf("~a & b << 2 | a ^ b = %d\n", ~a & b << 2 | a ^ b);

    //Size of and Cast Operator :
    printf("-----------------------------------------------------------\n");
    printf("Size of Operators and Cast Operators: \n");
    long long int big_int = 10;
    long double big_num = 20.56L;//'L' at the trail end of the value is not necessary but good to have.
    //It Explicitly denotes the Value to be of Long Double. Even if you have 'f' at the end signifying a float value
    //it will still be trearted as long doube but thats bad practice, However compiler invokes implicit conversion and 
    //gets rid of our tomfoolery.
    printf("Size of Long Long Int: %d Bytes\nSize of Long Double: %d Bytes\n", sizeof(big_int), sizeof(big_num));
    printf("As You Can See The number of bytes occupied by a variable is completely dependent on its type and not its Value.\n");

    //Terenary Operator:
    printf("-----------------------------------------------------------\n");
    printf("Terenary Operators: \n");
    a = 10, b = 20;
    int max = (a > b) ? a : b;  // Ternary operator usage
    printf("The maximum value is: %d\n", max);

    //Short Circuting in C
    bool result = a>15 && b++;
    printf("Boolean Value: %d", result);
    printf("b Value: %d", b);

    //This is different
    result = b++ && a>15;
    printf("Boolean Value: %d", result);
    printf("b Value: %d", b);
    /*
    In short circuting if the result of a boolean expression can be detrmined without further execution then further statements are
    ignored. Hence in first case b++ is ignored as a > 15 is false and false AND anything = false 
    */
    //similarly
    a = 10, b = 20;
    result = ++a>10 || b++;//note the ++ -> ++a > 10 evaluates to true as ++a -> 11 and 11 > 10 is true
    //It is not the same as a++>10 -> 10 > 10 which is false and then a -> 11
    printf("Boolean Value: %d", result);
    printf("b Value: %d", b);

    result = b++ && a>15;
    printf("Boolean Value: %d", result);
    printf("b Value: %d", b);

	return 0;
}