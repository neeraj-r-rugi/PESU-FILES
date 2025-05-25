#Logical operators
	#  and 
	#  or  
	#  not
#Give values for a, b and c like 0, positive numbers and negative numbers

#Expression: A combination of symbols that evaluates to a value. An expression can also consist of a single literal or variable
#			example:    4*5+7
#			here 4*5 is one sub-expression   and 7 is one more sub- expression

#and operator
#Last evaluated expression will be printed for and operator if it is non-zero
	#  0 and 4
		# 0 is one expression
		# 4 is one another expression
		# and evaluates the first expression. if it is zero then second expression will not be evaluated.
		# Hence the output is 0
	# 1 and 4
		# 1 is one expression
		# 4 is one another expression
		# and evaluates the first expression.  if it is non-zero then second expression will be evaluated.
		# Hence the output is 4

		
#or operator
#First evaluated expression will be printed for or operator if it is non-zero
	# 0 or 4	
		# 0 is one expression
		# 4 is one another expression
		# or evaluates the first expression. if it is zero then second expression will be evaluated.
		# Hence the output is 4	
	#  1 or 4
		# 1 is one expression
		# 4 is one another expression
		# or evaluates the first expression. if it is non-zero then second expression will not be evaluated.
		# Hence the output is 1	
		
		
#not
# not of any non-zero value is False


'''
precedence of logical operators
		not
		and
		or
'''

a = int(input("Enter the first number"))   # use float() and enter float numbers and check the output
b = int(input("Enter the second number"))
c = int(input("Enter the third number"))

print("a and b:", a and b)
print("a or b:", a or b)
print("not a:", not a)			#any non - zero is true
print("a and b and c:", a and b and c)
print("a or b or c:", a or b or c)
print("a and b or c:", a and b or c)
print("a or b and c:", a or b and c)
print("not a and b:", not a and b)   # see the precedence mentioned above
#print(and a)    #Syntax Error

print( 5 and 2 or 0)
print( 5 or 0 or 2)
print(0 or 1 or 4)
print(1 or 5 or 0)
print(1 and 0 or 7)
#not of any non-zero value is False
#empty string ("") is equivalent to false value
print(not 5.5)    #False
print(not 0.0)   #True
print(not 0)  #True
print (not "facebook") # False
print(not "")   # True


https://www.pesuacademy.com/Academy/
