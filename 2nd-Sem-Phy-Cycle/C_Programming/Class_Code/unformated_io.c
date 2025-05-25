#include<stdio.h>
#include<conio.h>
int main(){
	char ch;
	printf("Enter a char: \n");
	ch = getchar();
	printf("The Char you entered is: \n");
	putchar(ch);

	//getc and putc
	//getc(File *fp)
	//putc(char, File *fp)

	getchar();//To prevent pre firing of getc
	printf("\nEnter a char: \n");
	ch = getc(stdin);
	printf("The Char you entered is: \n");
	putc(ch, stdout);

	//To take a full sentence from the user
	//Using getchar
	printf("\n");
	printf("Enter a Sentence: \n");
	getchar();//To prevent pre firing of getc
	while((ch = getchar()) != '\n')
		putchar(ch);
	//Can be done with getc and putc also.
	printf("\n");
	printf("Enter a Sentence: \n");
	while((ch = getc(stdin)) != '\n')
		putc(ch, stdout);

	ch = getch();
	putchar(ch);
	printf("\n");
	getchar();
	ch = getche();
	return 0;
}