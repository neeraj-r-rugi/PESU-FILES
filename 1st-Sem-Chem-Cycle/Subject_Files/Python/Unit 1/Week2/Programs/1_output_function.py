#The execution starts from the first statement itself.
#A program in python has number of statements. 
#These statements are followed by the computer one after another in a sequence. We call this “executing a program” or “running a program”( i have used only a single statement to demonstrate the concepts)

print("Welcome to python")   # First program in python

#print is a output function, takes a number of arguments, finds the value of these arguments and  outputs the data to the standard output device (screen).

# python is case sensitive(distinguishes uppercase and lowercase characters)

Print("hello world")# gives error, name 'Print' is not defined

# Comments in Python start with the hash character, #, and extend to the end of the physical line. 
#A comment may appear at the start of a line or following whitespace or code, Since comments are to clarify code and are not interpreted, they may be omitted when typing in examples.

# learning a language is all about learning its syntax and its semantics ,If the syntax is violated, the Python translator gives an error.

#A sequence of symbols(characters) in quotes is called a string. 
#A string which does not change is referred to as a string constant or string literal. It has to be surrounded by quotes – single or double – should be same in the beginning as well as the end. If quotes are missed at one end or not properly matched, then the translator gives an error.

print("python")#valid 
print('python')#valid
print("python')# error ,SyntaxError: EOL while scanning string literal
print('python")# error ,SyntaxError: EOL while scanning string literal

 print("python")# error,IndentationError: unexpected indent
#all statements should start from first column other than the special constructs.

print("rama", "bheema","shyama")













