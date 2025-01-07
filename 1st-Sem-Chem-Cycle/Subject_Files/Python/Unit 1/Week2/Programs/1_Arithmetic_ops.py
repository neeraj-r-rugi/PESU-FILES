#Operator
#	A symbol to perform some operation on its operand or operands
#	Based on the number of operands, that can be specified for a operator, they are broadly classified into 3 types
			# Unary
			# Binary
			# Ternary
			
#	Based on the type of operation, there are many different operators
			#Arithmetic operators
			#Logical 
			#Relational
			#membership  
			#identity
			#assignment
			#Bitwise 

a = int(input("Enter first number"))
b = int(input("Enter second number"))
c = 10

#Arithmetic Operators   . Others explained in next classes

#Unary operators
o1=-120
o2=-10+20     #unary operator - works on only one operand

#binary operators
d = a + b
print(d)
d = a - b
print(d)
d = a * b
print(d)
d = a / b    #true division operator
print(d)
d= a // b  #Integer Division or floor division  or truncating division operator
print(d)
d = a % b		# % operator gives the remainder of a//b
print(d)
d = a**b		#Power operator
print(d)



# look at the precedence  and associativity to solve this
print(3+2*4)      
print(2*4//5)
print(4//5*2)
print(2**2**3)    # right to left associativity
print((2**2)**3)
print(2*2**8)    # only order of precedence is required to solve this
print(10*4%3**2**2)    #precedence and associativity both required to solve this




