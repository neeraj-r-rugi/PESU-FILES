#1.
'''
n = int(input("Enter the integer number"))
for i in range(1,n+1):
    print(i)
'''

#2.
'''
n = int(input("Enter the integer number"))
s = 0
for i in range(1,n+1):
    s += i
print("sum is", s)
'''

#3.
'''
str1 = input("enter the string")
#ord function returns the Unicode code point for a string with one-character. Use help(ord) and help(chr). See the output of ord('a') and chr(97)in python prompt to understand better
for s in str1:
    print(ord(s))
'''


#4.
'''
n = int(input("Enter the number"))
for i in range(1,n+1,2):
    print(i)
'''


#5.
'''
n = int(input("Enter the number"))
for num in range(1,n+1):
    if((num % 3) == 0 and (num % 5) == 0):
        print(num)
#parenthese has the most priority, then relational and then logical and
'''


#6.
'''
n = int(input("Enter the number"))
for num in range(1,n+1):   #num is of type int
    if str(num)[-1] == "9": #str() converts the num from int to str so that index can be used on it.
        print(num)
# you can use any other method like applying the % operator and getting the last digit and them comparing .
# can also be any logic other than these two
'''



#7.
''' 
n = int(input("Enter the number"))
for i in range(1,n+1):
    if i != 5:
        print(i)
'''

#8.
'''
fname = input()
mname = input()
lname = input()
print(fname,mname,lname)
#print(fname+" "+mname+" "+lname)  #also fine
'''



#9.
''' 
v = ""
while v != "stop":
    n = int(input("enter the number"))
    if n%2 == 0:
        print("even")
    else:
        print("odd")
    v = input("If you do not want to continue, say stop, else say something other than stop\n")
'''




#10.
'''
import random  # import is a keyword 
#random is a module which helps in generating the required random numbers using different functions. dir(random) lists all functions. 
n = int(input("Enter the number"))
for i in range(1,n+1):
    print(random.randrange(1,1001))  #see help(random.randrange)
'''


#11.
'''
n = int(input("Enter the integer"))
for num in range(1,n+1):
    length = len(str(num))
    s = 0
    for i in str(num):
        s += int(i)**length
    if(s == num):
        print(num)
'''

#12.
'''
num = int(input("Enter the number"))
length = len(str(num))
s = 0
for i in str(num):
   s += int(i)**length
if(s == num):
       print(num, "is an armstrong number")
else:
       print(num, "is not an armstrong number")
'''

#13.
'''
num = int(input("Enter the number"))
#find all factors and sum it except the number itself.
s = 0
for i in range(1,(num//2)+1):
    if num % i == 0:
        s += i 
print(s)
if num == s:
    print(num, "is a perfect number")
else:
    print(num, "is not a perfect number")
'''


#14. 
'''
num = input("Enter the number")
length = len(num)
print(int(num[-1]+num[1:-1]+num[0])) # str is indexable. negative index also allowed.
#can use any other logic using operators on numbers.
'''


#15.
'''
num = int(input("Enter the number"))
if num < 0:
    print(num,"is a negative number, cant check")
else:
    new_num = str(num)[::-1]  #reversed string
    if(int(new_num) == num):
        print("number is palindrome")
    else:
        print("number is not a palindrome")
'''

#16.
'''
print("Three digit palindrome numbers are")
for num in range(100, 1000):
    if(str(num) == str(num)[::-1]):
        print(num)
#any other traditional logic is also absolutely fine
'''


#17.
'''
num = int(input("Enter the number"))
print("Factors of", num,"are")
for i in range(1,num+1):
    if num % i == 0:
        print(i)
'''

#18.
'''
#factorial of a number in python 3.x and above can be found out using math module
import math
n = int(input("Enter the number"))
print("Strong numbers between 1 to",n,"are")

for num in range(1,n+1):
    s = 0
    for i in str(num):
        s += math.factorial(int(i))
        if s == num:
            print(num)
'''

#19.
'''
#hex() and oct() return the string which represents the number in corresponding formats starting with 0x and 0o. You can also use either format() from str type or format() from builtins
n = int(input("Enter the number"))
print("Hexadecimal number is", hex(n))
print("Octal number is", oct(n))
print("Hex value is", "{0:x}".format(n))
print("tal value is", "{0:o}".format(n))
print(format(n, 'X'))
print(format(n, 'x'))
'''


#20.
'''
n = int(input("Enter the number"))
length = len(str(n))
s = 0
while n>0:
     length = len(str(n))
     r = n % 10
     s = s + r*10**(length-1)
     n = n // 10
print("Reversed number is",s)
#pythonic code also fine like using slice operator
'''

#21.
'''
n = int(input("Enter the number for which you want multiplication table"))
for i in range(1,11):
    print(n,"*",i,"=",(n*i))
'''


#22.
'''
sides_diagonals = input("input 4 sides first and then two diagonals next in the same line").split()
#help(str.split()) gives more details. Returns a list of the substrings in the string, using white space as a delimiter. 
#white space includes tab, space and new line. In detail, we will discuss in Unit2
s1,s2,s3,s4,d1,d2 = sides_diagonals
s1,s2,s3,s4,d1,d2=int(s1),int(s2),int(s3),int(s4),int(d1),int(d2)
if s1==s3==s2==s4 and d1==d2:
	print("It is a square")
elif s1==s3 and s2==s4 and d1==d2:
	print("It is a rectangle")
elif s1==s2==s3==s4 and d1!=d2:
	print("It is a rhombus")
elif s1==s3 and s2==s4 and d1!=d2:
	print("It is a parallelogram")
elif s1==s2 and s3==s4 and d1!=d2:
	print("It is a kite")
else:
	print("It is just a quadrilateral")
'''


#23.
'''
#try this input:  1 -1 2 1 4 5
x1,y1,x2,y2,x3,y3 = input("Enter the coordinates of A,B and C respectively separated a space in between").split()
x1,y1,x2,y2,x3,y3 = int(x1),int(y1),int(x2),int(y2),int(x3),int(y3)
slope_AB = (y2-y1)/(x2-x1)
slope_BC = (y3-y2)/(x3-x2)
slope_AC = (y3-y1)/(x3-x1)
if slope_AB == slope_BC == slope_AC:
    print("Points are Collinear")
else:
    print("Points are Not Collinear")
    centroid_x = (x1+x2+x3)/3
    centroid_y = (y1+y2+y3)/3
    print( (centroid_x,  centroid_y))
'''

#24.
#solution using while
'''
n=int(input("enter the integer"))
i=1
while(i<=n):
	j=0
	while(j<i):
		print(chr(j+ord("a")),end="")
		j+=1
	print()
	i=i+1
'''

#24.
#solution using for
'''
n = int(input("enter the integer"))
for i in range(1,n+1):
    for j in range(i):
        print(chr(ord("a")+j), end = "")
    print()
'''

#25.
#a)
'''
n=int(input("Enter the value of n"))
i=1
while i<=n:
	j=1
	while(j<=n):
		if(i==j):
			print("1",end=" ")
		else:
			print("0",end=" ")
		j+=1
	print()
	i+=1
#can use for too.
'''


#25.
#b) 
'''
n=int(input("Enter the value of n"))
j=1
k=1
while(k<=n):
	while j<=(n*k):
		print(j,end=" ")
		j+=1
	k+=1
	print()
'''

#26.
'''
a,b,c = input("input three sides of a triangle").split()
a,b,c=float(a),float(b),float(c)
if a<b+c and b<a+c and c<a+b:
	print("Triangle can be formed")
	if a==b==c:
		print("Equilateral Triangle")
	elif a==b or b==c or c==a:
		print("Isoceles Triangle")
	elif (a*a==b*b+c*c) or (b*b ==c*c+a*a) or (c*c == a*a+b*b):
		print("Right angled triangle")
	else:
		print("Scalene Triangle")
else:
	print("Triangle cannot be formed")
'''


#27.
'''
str1 = input("Enter the string")
list_words = str1.split()
v = False  #store any value and change it inside loop. Usually boolean
for word in list_words:
    print(len(word), end = "")
    if(v == False):
        print(".",end = "")
        v = True
'''

#28.
'''
import math
#use functions or constants from math using a dot(.) operator
radius = int(input("Enter the radius of a circle"))
diameter = 2 * radius
area = math.pi * radius * radius
perimeter = 2 * math.pi * radius
print("Diameter is", diameter)
print("Area is", area)
print("Perimeter is", perimeter)
'''

#29.
'''
n = int(input("Enter the number"))
print("Corresponding Binary number is", bin(n)[2:])  #pythonic way using the available functions
# can also be done using the traditional manner
'''

#30.
'''
n = int(input("Enter the integer"))
s_odd = 0
s_even = 0
for i in range(1, n+1):
    if (i % 2 == 0):
        s_even += i
    else:
        s_odd += i
print("sum of even numbers is: ", s_even)
print("sum of odd numbers is: ", s_odd)
'''