#Relational Operators
	#used for comparison purpose
	#Result of these operations is always boolean. -->True or False
	#		==		Determining or checking if two values are equal . Not assignment(=)
	#		!=
	#		<		
	#		>
	#		<=
	#		>=
	#		
a=float(input("enter the number"))
b=float(input("enter the number"))

#Arithmetic Comparison
print(a<b)
print(a>b)
print(a<=b)
print(a>=b)
print(a==b)
print(a!=b)
print(a!=b==a==a==a)    #False
	#Line 20 is interpreted as (a !=b and b==a and a===a and a==a)
print(a!=b and not 1)   # False
print(a!=(b and not 1))   # True








