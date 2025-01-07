#Variable number of arguments:   *arg
#Variable number of keyword arguments:   **kwarg
#any identifier can be used here for arg and kwarg


#   *arg
'''
def f1(*arg):
	print(arg, type(arg))    #arg is of type tuple
	for i in arg:
		print(i)	
f1(2,1,6,4,9,7)
'''

'''
def f1(a,b,*arg):		#a and b positional and *arg is variable number of arguments. 2 is passed to a and 1 is passed to b
	print(a,b)
	print(arg, type(arg))    #arg contains(6,4,9,7)
	for i in arg:
		print(i)	
f1(2,1,6,4,9,7)
'''

#   **kwarg
'''
def f1(**kwarg):
	print(kwarg, type(kwarg))     #kwarg is of type dict
	for i in kwarg:
		print(i,end="")
	print()
	for i in kwarg.keys():
		print(i,end="")
	print()
	for i in kwarg.values():
		print(i,end="")		
f1(a=2,b=1,c=6)
f1(a=2,b=1,c=6,a=23)	#error
'''

#Keyword arguments should follow positional arguments
'''
def f1(x,**kwarg):
	print(kwarg)     #kwarg is of type dict
	for i in kwarg:
		print(i,end=" ")
	print()
	for i in kwarg.keys():
		print(i,end=" ")
	print()
	for i in kwarg.values():
		print(i,end=" ")		
f1(56,a=21,b=31,c=61)
#f1(a=21,b=31,c=61,56)  #Error
f1(x = 2, b=31,c=61,56)
'''


'''
def f1(x,y,*arg,**kwarg):
	print(x,y)
	print(arg)
	print(kwarg)		
f1(56,33,34,4,6,a=21,b=31,c=61)
#f1(56,33,34,4,6,a=21,b=31,c=61,x=45) #error
'''

'''
def f1(*arg):
	print(arg)
	print(type(arg))	#tuple
	print(*arg)	#pass starred argument to any function, it does unpacking.
				#see below code too.
	#print(type(*arg))	#  *arg becomes 1 2 3 4 , type cannot take more than 1 argument
f1(1,2,3,4)
f1({1:11,2:22},{3:33,4:44})
f1({1:11,2:22,3:33,4:44})

'''











