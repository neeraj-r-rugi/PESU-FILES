'''
x=10    
print("global first outside",x)
def f1():
	x=11		#local variable x. Life and scope is only within this function
	print("inside",x)
f1()
print("global second outside",x)
'''

'''
x=10    
print("global first outside",x)
def f1():
	x=12		#x and y both are local variables, cannot be accessed outside the function
	y=20
	print("inside",x,y)
f1()
#print("outside",y)   #NameError
#print("outside",x,y)	# NameError 
'''

'''
x=10    
def f1():
	y=20		#y and sum both are local variables
	sum=x+y
	return sum
print("sum is",f1())
'''