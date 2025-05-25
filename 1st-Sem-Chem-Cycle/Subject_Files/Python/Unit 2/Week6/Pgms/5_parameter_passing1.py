'''
Arguments:
	fields used in the call---> arguments . 
	It can be any expression in python
Parameters:
	fields used in the function leader in the function definition
	It should be a variable
Always parameter passing is by value in python. 
The Number of arguments and number of parameters must be same if no default parameters.
'''
def f1(a,b):		# a and b, both are local variables and positional parameters
	print(a+b)
"""
On the function call, the activation record of f1 is 
created with a and b as the parameter. The parameter a gets
a copy of argument which is 2 and b gets a copy of 3. 
The parameter is a local variable of the function f1. 
When the end of the function is reached, 
the parameter is never copied to the corresponding argument. 
So, the variable used at the caller side remains unchanged.
"""
f1(2,3)
#f1(2)		#Error
#f1(2,3,4)		#Error
'''

'''
def f1(a,b):		
	print(a+b)

f1(2,3)
f1([2,3,4],[5,8,2])
'''

'''
#All keyword arguments must follow positional arguments
def f1(a,b):
	print(a,b)
	print(a+b)

f1(b=2,a=3)  #Keyword arguments
'''

'''
def f1(a,b):	
	print(a+b)

#f1(2,b=3,a=7)   #TypeError
f1(2,b=7)		# a is positional argument, b is keyword argument
#f1(2,a=7)    #TypeError
f1(a=7,2)   #SyntaxError: positional argument follows keyword argument
'''

'''
#Default parameters
def f1(a,b=10):   #default value for b is 10	
	print(a+b)
f1(2,3)
f1(2)
f1(a=2)
f1(b=13,a=9)
#f1(b=20,11)		#Error
'''

'''
def f1(a,b=10):   #default value for b is 10	
	b=a+b
	print(b)
f1(2,3)
f1(2)
f1(a=2)
f1(b=13,a=9)
#f1(b=20,11)		#Error
'''









