# scope:
#	where we can access; visibility
# life:
#	existence of the variable
#	When the variable is created and when it will die
a = 100
e = 600
f = 700

h = 1111
def check() :
	print(a) # 100 # global variable
	print(b) # 200
	c = 30 # local variable
	if c == 30 :
		d = 40
	else:
		d = 50
	print(d) # ok; d is local to the function; no concept of local to a suite of 
	# a control structure
	e = 60 # local variable
	# cannot directly modify a global variable
	# to access the global variable, for its value, nothing is required
	# to modify a global variable, we should declare that it is global
	global f
	f = f+30
	print(f) #730
	


b = 200
check()
#print(c) # not defined
print(e) # 600
print(f) # 730










