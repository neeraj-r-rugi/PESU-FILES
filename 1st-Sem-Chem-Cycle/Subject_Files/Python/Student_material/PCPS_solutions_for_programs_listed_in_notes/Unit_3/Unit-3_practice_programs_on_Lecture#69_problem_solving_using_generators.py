#1. 
"""def cube_generator(n):
    for i in range(1, n + 1):
        yield i ** 3
n = int(input("Input a number: "))
result = cube_generator(n)
print("Cubes of numbers from 1 to", n,"are:")
for num in result:
    print(num)
"""
    
    
#2.     
"""import math
def roots_generator(n):
    for i in range(1, n+1):
        yield math.sqrt(i), i**(1/3)
n = int(input("Input a number: "))
roots_gen = roots_generator(n)
print("Square roots and cube roots of numbers from 1 to", n)
for i in roots_gen:
    print(i)"""
    
#3.    
"""def is_palindrome(n):
    return str(n) == str(n)[::-1]

def next_palindrome(start):
    num = start + 1
    while True:
        if is_palindrome(num):
            yield num
        num += 1
        
n = int(input("Input a number: "))
palindrome_gen = next_palindrome(n)
next_palindrome_num = next(palindrome_gen)
print("The next palindrome number after", n, "is:", next_palindrome_num) """   
           

#4.
"""def is_prime(n):
    if n <= 1:
        return False
    for i in range(2, int(n**0.5) + 1):
        if n % i == 0:
            return False
    return True

def prime_generator():
    n = 2
    while True:
        if is_prime(n):
            yield n
        n += 1
primes = prime_generator()

n=int(input("enter the number"))
print("First",n,"Prime numbers:")
for i in range(n):
    print(next(primes))
"""



#5.
'''
def running_average(sequence):
    total = 0
    count = 0
    for number in sequence:
        total += number
        count += 1
        yield total / count

numbers = [10, 20, 30, 40]
avg_gen = running_average(numbers)
for avg in avg_gen:
    print(avg)
'''

#6.
"""
def list_permutations(elements):
    if len(elements) <= 1:
        yield elements
    else:
        for p in list_permutations(elements[1:]):
            for i in range(len(elements)):
                yield p[:i] + elements[0:1] + p[i:]

#nums = [1,2,3,4]
n = int(input("Enter number of elements : "))
nums=[]
for i in range(0, n):
    ele = int(input())
    nums.append(ele)  
 
print("Original list of elements:",nums)
print("All permutations:")
for p in list_permutations(nums):
    print(p)
"""
    
#7.
'''
def list_combinations(elements, r):
    if r == 0:
        yield []
    elif r > len(elements):
        return
    else:
        for i in range(len(elements)):
            current_element = elements[i]
            remaining_elements = elements[i+1:]
            for combination in list_combinations(remaining_elements, r-1):
                yield [current_element] + combination

nums = [1, 2, 3, 4]
print("Original list of elements:",nums)
r = int(input("Input length of each combination: "))
print("All combinations:")
for combination in list_combinations(nums, r):
    print(combination)
'''



#8.
'''
def is_palindrome(n):
    return str(n) == str(n)[::-1]
def next_palindrome(start):
    num = start + 1
    while True:
        if is_palindrome(num):
            yield num
        num += 1
n = int(input("Input a number: "))
palindrome_gen = next_palindrome(n)
next_palindrome_num = next(palindrome_gen)
print("Next palindrome number after", n, "is:", next_palindrome_num)
'''