#never specify type for a variable in python. Type is decided based on what is stored in that variable
#A function can pass any type of value and can return any type of value
#Activation record stores the following:
	#parameters
	#local variables
	#return value
	#return address
	#temporary variables
#Some of the variations on functions is as below. 
#Might be of some help

'''
def f1():
	print("in f1")
	f2()
def f2():
	print("in f2")
f1()
'''

'''
def f1():
	print("in f1")
	f2()
f1()		#Error
def f2():
	print("in f2")
'''

'''
def f1():
	print("in f1")
	f2()
def f2():
	return "Hello"
f1()
print(f1())
'''


'''
def f1():
	print("in f1")
	return f2()
def f2():
	print("in f2")
print(f1())
'''