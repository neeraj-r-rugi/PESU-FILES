# whatever u want as it is on the terminal, put it inside quotes on print
# if u want the value to be printed using the variable, do not quote it.
# we use "", '', """ """, ''' ''' to specify the string constant
# ''' and """ has special meaning. We will discuss in 4th unit.
# as of now, we will use them as multi line comments in our program.
'''
print("""Hello Everyone!!""")
#mentioning just a constant is not an error in Python.
"""Hello All"""		
2.35
6.7
7
"pes"
'''



'''
print() can take any number of arguments
print(1, 2, 3, 4)
1 2 3 4
'''
'''
each argument is evaluated as an expression
print(2 + 2, 3 * 4)
'''
#In the display, we observe a space between the output fields. 
#By default, output field separator is a space.
#It can be changed by specifying sep = <val> in print.

#After each print, we get a newline. This is called the output record separator.
#This can be changed by specifying end = <val> in print.

#Please run and check the output of the following program. Some of this code is tricky!

# output
#	output field separator : appears between fields in the output
#		default :  space
#		use sep to change this 
#	output record seperator : appears at the end of each print
#		default : newline
#		use end to change this
"""
print("one", "two", "three")
print("four", "five")

print("one", "two", "three", sep = "-----", end = "\n*************\n")
print("four", "five", sep = "^^^^^^^^")
"""

"""
print("to", end = "")
print("get", end = "")
print("her")
"""

"""
sep = "*"
print("rama", "krishna")
print("apple", "banana", sep = "@") # does not create a variable called sep
print(sep)  # * not @
"""
'''
sep = "----"
# value of variable sep is substituted and nothing special
print("rama", "krishna", "parama ", "hamsa ", " not ", sep)  # sep refers to the variable in the program
'''