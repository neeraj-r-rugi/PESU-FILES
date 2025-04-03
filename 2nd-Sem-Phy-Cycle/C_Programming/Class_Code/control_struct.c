#include <stdio.h>

int main(){

	//1. To check weather number is +ve:
	printf("Enter a number: \n");
	int x = 0;
	int y = 0;
	scanf("%d", &x);
	//single line print statement.
	if(x>=0) printf("It is a +ve number\n");
	else 

	printf("It is a negative number\n");
	printf("##################################\n");
	//The stament maybe on the same line or the next line, if you leave more than one line between if/else/else-if and your stament
	//the lines in between being whitespaces are ignored, and the immediate next stament still executes. 

	//2. To check if a +ve number is multiple of 5 or 3 or both
	printf("Enter a number: \n");
	x = 0;
	scanf("%d", &x);
	if(x >= 0){
		if(x % 3 == 0 && x % 5 == 0) printf("Mutiple of 3 and 5\n");
		else if(x % 3 == 0) printf("Mutiple of 3 only\n");
		else if(x % 5 == 0) printf("Mutiple of 5 only\n");
		else printf("Neither a multiple of 3 nor 5.\n");

		//This is different
		printf("\n Also: \n");
		if(x % 3 == 0 && x % 5 == 0) printf("Mutiple of 3 and 5\n");
		if(x % 3 == 0) printf("Mutiple of 3 only\n");
		if(x % 5 == 0) printf("Mutiple of 5 only\n");
		else printf("Neither a multiple of 3 nor 5.\n");
		printf("##################################\n");
		/*
		Reason being that in an "if  else-if else" ladder, one and only one of the statements is executed, they exist as a single entity
		either one of the condition is true and executes or else exeutes.
		if an if else ladder each of the if statements executes and each is a single entity hence why all for x = 15, all 3 print statemnts
		get printed. Also the else block belongs the immediate preceding if statement, but in if else if else ladder, the else
		belongs to and is part of the entire block/entity.   
		*/

	}
	//3. To Check even or odd
	printf("Enter a number to check if it is odd or even\n");
	scanf("%d", &x);
	if(x % 2 == 0) printf("It is Even\n");
	else printf("It is Odd\n");
	printf("##################################\n");

	//4. To Check grades of a student
	printf("Enter your marks out of 100: \n");
	scanf("%d", &x);
	//Note the use of else-if, if only if was used then, then for input 95, all 3 grades would be printed, hence using only if
	//condition expression needs to be altered 
	if(x >=75) printf("Grade: A\n");
	else if(x >=60) printf("Grade: B\n");
	else if(x >=30) printf("Grade: C\n");
	else printf("Fail\n");
	printf("##################################\n");

	//5. To find the days of the week 
	printf("Enter the days of the week from 1-7:\n");
	scanf("%d", &x);
	switch(x){
		case 1:
		printf("Monday\n");
		break; 
		case 2:
		printf("Tuesday\n");
		break; 
		case 3:
		printf("Wednesday\n");
		break; 
		case 4:
		printf("Thursday\n");
		break; 
		case 5:
		printf("Friday\n");
		break;
		case 6:
		printf("Saturday\n");
		break; 
		case 7:
		printf("Sunday\n");
		break;  
		default:
		printf("Wrong num\n");
		break;//Not Required but ehhh why not 
	}
	printf("##################################\n");

	//6. To to check If a Given letter is a vowel
	char c;
	printf("Enter a small letter:\n");
	while(getchar() != '\n');//Ignore this, It is to prevent scanf from accepting '\n' as input from key buffer of previous input.

	scanf("%c", &c);
	//Using Fall through behaviour 
	switch(c){
		case 'a':
		case 'e':
		case 'i':
		case 'o':
		case 'u':
			printf("It is Vowel\n"); 
		break;
		default:
			printf("It is a consonant\n");
		break;//Not Required but ehhh why not 
	}
	// Fall through: If a case matches the control var, then it will keep executing all the statments below it until it encouters a 
	//break of another case, the default statement(It is not executed), or end of switch statement itself
	printf("##################################\n");

	//7. To build a simple calculator
	printf("What operation do you want to perform: (+,-,*,/,&):\n");
	scanf("%c", &c);
	while(getchar() != '\n');
	printf("Enter two Integers:\n");
	scanf("%d %d", &x, &y);
	switch(c){
		case '+':
			printf("Addition: %d", x+y);
			break;
		case '-':
			printf("Subtraction: %d", x-y);
			break;
		case '/':
			printf("Division: %.2f", (float)x/y);
			break;
		case '*':
			printf("Multiplication: %d", x*y);
			break;
		case '%':
			printf("Reminder %d", x%y);
			break;
		default:
			printf("Not a a valid operator\n");
		break;
	}

	// // scope of variables in if statements
	// if(1){
	// 	int scope = 20;
	// 	printf("Scope value: %d", scope);
	// }
	// printf("Scope Value Outside: %d", scope);
	//Above code produces compile time error, variables created in a scope(compound statement) remain in that scope only;
}