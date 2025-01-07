'''
def f1():		#Leader is processed . means added to symbol table
	print("in f1")
	return "Cool day"
k=f1()     #f1() is function call. Cool day is returned and stored in k
print(k)

'''

'''
f1()			# f1 not available in symbol table. So it is an error
def f1():
	print("in f1")
	return "Cool day"
'''


'''
#function is overridden when duplicate functions are used. No concept of function overloading in python
def f1():			#added to symbol table
	print("in f1")
	return "Cool day"
def f1(x):			# since the functions have same name, the function above is replaced with this in the symbol table with parameters added
	print("f1 is",x)
#f1()		#Error
f1("pes")
'''

'''
def f1():
	print("in f1")
k=f1()
print(f1)		#prints function address. This is not a call
print(k)		#prints None
'''









