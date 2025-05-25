#changing the simple type doesn't affect the other
#changing the reference type doesn't affect the other
#changing the reference type through the reference changes the other

'''
x=[23,45,89]
def f1(y):
	y=[22,33]
	print("inside function",y)
print("beginning outside",x)
f1(x)
print("Later outside",x)
'''

'''
x=[23,45,89]
def f1(y):
	print(id(y))
	y=y+[22,33]		# changes the id of y
	print(id(y))
	print("inside function",y)
print("beginning outside",x)
f1(x)		
print("Later outside",x)	#x is not changed
'''

'''
x=[23,45,89]
def f1(y):
	print(id(y))
	y+=[22,33]
	print(id(y))	#no change in id of y. same as y above and x outside
	print("inside function",y)
print("beginning outside",x)
f1(x)
print("Later outside",x) #x is affected
'''

'''
#default parameter: It is always a part of symbol table which is 
added during leader processing
'''

'''
x=12
def f1(a,b=x):		#at the time of leader processing, whatever the value at x is fixed
	print(a,b)
x=15
f1(4)
'''


'''
#write the diagram for symbol table and activation record creation and deletion
def f1(a,b=[]):
	b.append(a)
	print(b)
f1(2)
f1(22)
f1(33)
f1(12,[3,4])
f1(25)

'''






