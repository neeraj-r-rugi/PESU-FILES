
'''
x=10    # Global variable. Can be used anywhere inside this file/code
def f1():
	print("inside",x)
f1()
print("outside",x)
'''

'''
x=10    
print(x)
def f1():
	x=x+1		#UnboundLocalError. Global variable is readonly inside a function. We cannot modify the value of that variable inside the function directly
	print("inside",x)
f1()
print("outside",x)
'''

'''
#If you want to change or modify the global variable inside a function, use global keyword
x=10    
print("global first outside",x)
def f1():
	global x
	x=x+1
	print("inside",x)
f1()
print("global second outside",x)
'''

'''
x=10    
print("global first outside",x)
def f1():
	x=x+1		#Syntax Warning in 3.5.2
				# Error in 3.6.2
				#Hoisting happens here
	global x
	print("inside",x)
f1()
print("global second outside",x)
'''
