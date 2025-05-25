#Constants: literals
#entities which do not change. They are considered as they are. 
#They are said to be constants or literals.
'''
Examples:
2.222   : floating point constant
"python" : string constant
1947 : integer constant.
'''
#Identifiers
#Sequence of characters or symbols used to name the program element.
#This cannot start with a digit. using underscore(_) in the beginning is not a good practice(will discuss in 5th unit)
#Keywords
#variables

#Keywords:
	#Which has special meaning or pre-defined meaning in the programming language. cannot be used to identify something else.
	#To see all keywords in python, help()->press enter key, then type keywords->press enter key
	#Note that function names are not keywords in python
#Variables:
'''
Name given to a value. Always associated with a value.
Variables have values which can be changed.
Any given value also is classified into some type. 
We use the concept of type to classify information. 
'''

#Significance of data types:
	#1. Range of values that can be stored
	#2. Operations that can be performed on it
	#3. Memory allocated for it
#Type of a variable depends on what is stored in it at that moment
#About every type mentioned here, we will see in detail in coming classes
a=23
print("a=",a,sep="");print(type(a));a="facebook"
print(type(a))
a=23.8
print(type(a))
a=2+3j
print(type(a))
a=2+3
print(type(a))
a=[12,45]
print(type(a))
a={23,23,12}
print(type(a))
a={12:56,23:34}
print(type(a))
a=True
print(type(a))