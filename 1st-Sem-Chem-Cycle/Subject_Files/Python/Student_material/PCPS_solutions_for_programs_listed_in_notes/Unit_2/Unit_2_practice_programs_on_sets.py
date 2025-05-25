#1.
'''
s1 = set()
n = int(input("Enter the number of integers you want in the set: "))
for i in range(n):
    s1.add(int(input()))
print("Integers in the set are", end = " ")
for item in s1:
    print(item, end = " ")
'''


#2.
'''
s1 = set()
n = int(input("Enter the number of tuples you want in the set: "))
for i in range(n):
    t1 = ()
    for i in range(3):
        t1 = t1 + (input("Enter the element"),)
    s1.add(t1)
print(s1)
'''
'''
print("tuples in the set are", end = " ")
for item in s1:
    print(item, end = " ")
'''

#3.
'''
n = int(input("enter the n value"))
s = set()
for i in range(2,n+1):
    s.add(i)
for i in s:
    print(i*i)
'''

#4.
'''
s1 = input("Enter the string")
s1_set = set(s1.split(" "))
print("Unique words are:")
for word in s1_set:
    print(word)
'''


#5.
'''
s1= set()
n = int(input("Enter the number of elements you want in the set"))
for i in range(n):
    s1.add(input("Enter the element"))
#print(s1)
#use len(s1) and check the output
if(any(s1)):
    print("Elements of the set are")
    for e in s1:
        print(e)
elif(not  all(s1)):
    print("User did not enter any elements to add that to a set")   
'''


#6.
'''
s1 = set()
s2 = set()
m,n = input("how many element u want in first and second set? enter those numbers by adding a space in between").split(" ")
m,n = int(m), int(n)
print("enter",m, "elements")
for i in range(m):
    s1.add(int(input()))    
print("enter",n, "elements")
for i in range(n):
    s2.add(int(input()))     
#print(s1,s2, sep = "\n")
cartesian = set()
print("cartesian product of two sets is-->")
for i in s1:
    for j in s2:
        t = (i,j)
        cartesian.add(t)
print(cartesian)
'''

#8.
'''
s1 = input("Enter the first string")
s2 = input("Enter the second string")
set1 = set(s1.split())
set2 = set(s2.split())
set3 = set1 & set2
if (set3):
    print("Common words are")
    for i in set3:
        print(i)
else:
    print("No common words")
'''

#9.
#can also be done using dictionary
'''
li = [23,55,67,66,77,23,44,55,67,44,44]
s1 = set(li)
for ele in s1:
    print(ele, "repeated",li.count(ele), "times")
'''

#10.
'''
n = int(input("Enter the number"))
sieve = set(range(2,n+1))
s = set()  # can use list() or []
while sieve:
	small = min(sieve)
	s.add(small)		#if list , change to append
	sieve -= set(range(small,n+1,small))	#can use functions as well
print("Prime numbers between 2 and", n,":")
for i in s:
	print(i,end = " ")
'''


#11.
'''
set1 = {(),23,34.7,"78"}
if(all(set1)):
    print("set has no empty data structure")
else:
    print("set has empty data structure")
'''



#12.
'''
set1 = {'abc', 'def',"pqr",'xyz'}
set2 = {'abc','bcd','xyz','mno',"lmn"}
only_first = set1 - set2
print("List of students who took part in only first hackathon are as below.")
for name in only_first:
    print(name)
'''