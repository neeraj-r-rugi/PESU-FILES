#identity operators
	#used to check the id of operands equal or not
	#is
	#is not
	# Returns boolean

	
a=1
print(a is 1)   #True

a=1000
print(a is 1000)   # True in scripting mode
# in interactive mode, it is False. Because id(a) and id(1000) not same in interactive mode. Here it is same.
		
a=1
b=1
print(a is b)    #True. It checks for the id(a) and id(b)
print(id(a))
print(id(b))


a=1000
b=1000
print(id(a))
print(id(b))
print(a is b)     #True


print(id(a) is id(a))     #False   
print(id(a) is id(b))      #False

# Any doubts, please get back to me

'''
In Python, integers are immutable and are typically managed using an internal caching mechanism, especially for small integers (usually in the range of -5 to 256). This means that small integers will return the same memory address when you reference them multiple times.

However, larger integers (those outside of the cached range) are created dynamically when you use them, which can result in different memory addresses for each instance. Here's a brief explanation:

Integer Caching: Python caches small integers for efficiency. When you create an integer within the cached range, Python reuses the same object, so multiple references to the same integer return the same memory address.

Larger Integers: When you create integers that exceed the cached range, Python allocates new memory for each instance. Thus, even if the values are the same, they will have different addresses.
'''





