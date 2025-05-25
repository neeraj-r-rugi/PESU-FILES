#1
def nth_power(exponent):
    def pow_of(base):
        return pow(base,exponent)
    return pow_of
func= nth_power(4) # function object returned by outer function 
print(func(3)) # calling the function object

#2
'''
def make_adder(n):
    def adder(x):
        return x + n
    return adder

adder1 = make_adder(6)
adder2 = make_adder(9)
print(adder1(1))
print(adder2(1))
'''
#3
'''
def calculate():
    num = 1
    def inner_func():
        nonlocal num #it indicates num variable is not local to only inner function
        num += 2
        return num
    return inner_func

# call the outer function
odd = calculate()

# call the inner function
print(odd())#1st time odd is invoked
print(odd())#2nd time odd is invoked
print(odd())
'''

#4
'''
def outer_div(func):
    def inner(x, y):
        if x < y:
            x, y = y, x
        return func(x, y)
    return inner

@outer_div
def divide(x, y):
    print(x / y)

divide(2, 4)
'''

#5.
'''
def convert_to_data_type(data_type):
    def decorator(func):
        def wrapper(*args):
            result = func(*args)
            return data_type(result)
        return wrapper
    return decorator

@convert_to_data_type(str)
def add_numbers(x, y):
    return x + y

a = int(input("Enter the number")) 
b = int(input("Enter another number")) 
result = add_numbers(a,b)
print("Result:", result, type(result))

@convert_to_data_type(str)
def concatenate_strings(x, y):
    return x + y

a = input("Enter first word") 
b = input("Enter second word")
result = concatenate_strings(a, b)
print("Result:", result, type(result))
'''

#6:
'''
def validate_arguments(condition):
    def decorator(func):
        def wrapper(a):
            if condition(a):
                return func(a)
        return wrapper
    return decorator

@validate_arguments(lambda x: x > 0)
def calculate_cube(x):
    return x ** 3

print(calculate_cube(5))  # Output: 125
print(calculate_cube(-2))  #None
'''