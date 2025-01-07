#1.
'''
li = [12,44,77,"cse",34,12,76.5,"pes","python", "hackathons"]#given list
for ele in li:
    print(ele)
'''

#2.
'''
n = int(input("How  many elements you want to add to a list?"))
li = []  #creating the empty list
#now the loop must run n times to take n elements from the user and append to li list
print("Initial", li)
for i in range(n):
    li.append(input("Enter the element you want to append to the list:"))
print("Later",li)  # all these elements are str types
'''

#3.
'''
li = [9,4,2,7,1]
new_li = []
import math
print("Initial list is:", li)
for i in li:
    new_li.append(i*i)
    #new_li.append(i**2)
    #new_li.append(math.pow(i,2)) # pow returns float value.check help(math.pow)
print("New list is:",new_li)
'''

#4.
'''
li = [9,4,1000000,25,100, 8]
new_li = []
import math
print("Initial list is:", li)
for i in li:
    new_li.append(math.sqrt(i)) #math.sqrt returns boolean
print("New list is:",new_li)
'''

#5.
'''
li = [9,4,10,25,1000, 81]
#li = [91,41,101,25,1001, 81]
got_even = False
for i in li:
    if(i % 2 == 0 and not got_even):
        print("Left most even number is",i)
        got_even = True
if not got_even:
    print("No even number is existing in the list")
'''


#6.
'''
li = [9,4,10,25,1000, 81]  #given list
print("Initial list is", li)
n = int(input("Enter the number which you want to add to all elements of the given list."))
for i in range(len(li)):
    li[i] = li[i] + n
print("Final list is", li)
'''

#7.
'''
li = [9,4,10,25,33,3,21]
diff_list = []   # list() also fine
print("Original list is:",li)
for i in range(0,len(li)-1):
        diff = li[i+1] - li[i]
        diff_list.append(abs(diff))  #abs() available in builtins which returns the absolute value of a number
print("new list is:", diff_list)
'''

#8.	Given a list of heterogenous elements, create different lists based on the type of elements in the list.
'''
list1 = [23,44,1+3j,12,12.7,True,66.5,99,"pes","abc",2+5j, True, False,123]
#before creating these different lists, iterate through the given list and u can find its types and based on that creates these lists
list_ints = []
list_floats = []
list_strs = []
list_complex = []
list_bools = []
for item in list1:
    if type(item) == int:
        list_ints.append(item)
    elif type(item) == float:
        list_floats.append(item)
    elif type(item) == bool:
        list_bools.append(item)
    elif type(item) == complex:
        list_complex.append(item)
    elif type(item) == str:
        list_strs.append(item)    
print(list_ints)
print(list_floats)
print(list_complex)
print(list_bools)
print(list_strs)
'''



#9.
'''
even_list = []
print("initial list", even_list)
for i in range(1,20):
    if (i % 4 != 0):
        even_list.append(i)
print("final list", even_list)
'''


#10.
'''
#If the order of elements in the new list doesnt matter, then we can convert the list to set to get unique elements and then convert the set back to list.
li = [23,55,23,23,"pes", "python", "pesu", "pes"]
print("list with unique elements are:",list(set(li)))
'''
'''
#if the order of elements matter, then use the traditional way
li = [23,55,23,23,"pes", "python", "pesu", "pes"]
li_unique = []
for i in li:
    if i not in li_unique:
        li_unique.append(i)
print("List with unique elements:",li_unique)
'''


#11.
'''
li = [23,55,23,23.7,23,10,190,67,88,59]
print("Initial list",li)
li_sorted = sorted(li)
print("Sorted list is:",    li_sorted)
#if you use li.sort(), this sorts the given list itself.
'''

#12.
'''
list1 = [22,33,12,56,3,4,60]
got_greater = False
n = int(input("enter the element"))
for item in list1:
    if(item > n and got_greater == False):
        got_greater = True
        ele = item
if got_greater:
    print(ele,"is the left most element greater than", n)
else:
    print("No element in the list is greater than the given element",n)
'''


#13. 
'''
n = int(input("Enter the value of n"))
li = list(range(1, n//2))+list(range((n//2)+1, n+1)) # Concatenation of lists.
#but range object doesnt support +
print(li)
'''

#14.
'''
n = int(input("Enter the value of n"))
li = list(range(n, 1,-1))+list(range(1, n+1)) # Concatenation of lists.
#but range object doesnt support +
print(li)
'''


#15.
'''
list1 = []
list2 = []
list3 = []
nest_list = []
n = int(input("Enter the number of elements in each list"))
for i in range(n):
    num = int(input("enter the integer"))
    list1.append(num)
    list2.append(num*num)
    list3.append(num * num * num)
#print(list1, list2, list3)
nest_list.extend([list1,list2,list3])
print(nest_list)
'''

#16.
'''
n = int(input("Enter the upper limit"))
list1 = []
for i in range(1,n+1):
    val = (i,i+1)
    list1.append(val)
#print(list1)
s = 0
c = 0
for item in list1:
    if( c != (len(list1)-1)):
        print(item[0],"*",item[1],end = " + ")
    else:
        print(item[0],"*",item[1],end = " ")
    s += item[0] * item[1]
    c += 1
print("=",s)
'''

#17.Program to print the count of all numbers which are divisible by 3 in a given list.
'''
li = [12,55,33,17,3,14,27,90]
c = 0
for ele in li:
    if ele % 3 == 0:
        c += 1
print("count of numbers divisible by 3 are", c)
'''



#18. 
'''
li = [12,55,33,17,3,14,27,90]
list_even = []
list_odd = []
for item in li:
    if item % 2 == 0:
        list_even.append(item)
    else:
        list_odd.append(item)
print("Given list is", li)
print("List with even numbers is", list_even)
print("List with odd numbers is", list_odd)
'''


#19.
#if you create separate lists for even and odd elements, you can just use sum() on both lists separately to get the sum of even and odd.
#Here in this solution, separate lists not created.
'''
list1 = []
n = int(input("enter the number of elements"))
for i in range(n):
    list1.append(int(input("Enter the integer")))
sum_odd = 0
sum_even = 0
for num in list1:
    if num % 2 == 0:
        sum_even += num
    else:
        sum_odd += num
print("sum of odd integers", sum_odd)
print("sum of even integers", sum_even)
'''


#20.
'''
n = int(input("How many subjects marks you want to add")) 
print("Enter marks of",n,"subjects")
subject_marks = []
for i in range(n):
    subject_marks.append(int(input()))
print("sum of all marks", sum(subject_marks))
print("Average of marks",sum(subject_marks)/n)
'''

#21.
'''
n = int(input("Enter the number"))
li = []
for num in range(n):
    if num %2 == 0 and num % 3 != 0:
        li.append(num)
print(li)
'''



#22
#	Merge two lists such that new list contains one from first and the other from second. once the list is complete, append all from the longer list to the new list.
#Example: m = [23,45,67]    n = [12,65,98,23,55]
 #          Output_list = [23,12,45,65,67,98,23,55]
'''
m = [23,45,67]
n = [12,65,98,23,55]
output_list = []
for i in range(min(len(m),len(n))):
    output_list.extend([m[i],n[i]])
if len(m) < len(n):
    output_list.extend(n[i+1:])
elif len(m) > len(n):
    output_list.extend(m[i+1:])
print(output_list)
'''

#23.
'''
Three lists given
l1 = [11,22,14]
l2 = [45,77,88]
l3 = [90,99,55,10] 
Expected output_list = [[11,45,90],[22,77,99],[14,88,55]]
'''
'''
l1 = [11,22,14]
l2 = [45,77,88]
l3 = [90,99,55,10] 
output_list = []
for i in range(min(len(l1),len(l2), len(l3))):
    output_list.append([l1[i],l2[i],l3[i]])
print(output_list)
'''

#24.
'''
l1 = [11,22,14]
l2 = [45,77,88]
l3 = [90,99,55,10] 
output_list = []
for i in range(min(len(l1),len(l2), len(l3))):
    output_list.append(sum([l1[i],l2[i],l3[i]]))
print(output_list)
'''    

#25.
'''
l1 = [11,22,14]
l2 = [45,77,88]
l3 = [90,99,55,10] 
output_list = []
for i in range(min(len(l1),len(l2), len(l3))):
    output_list.append([l1[i]%10,l2[i]%10,l3[i]%10])
print(output_list)
'''









