#1.
'''
inp_str = input("Enter the string")
for i in range(len(inp_str)-1):
    ch1 = inp_str[i]
    ch2 = inp_str[i+1]
    if ch1.isdigit():
        print(int(ch1)*int(ch1), end = " ")
    if ch1.isdigit() and ch2.isdigit():
        num = int(ch1+ch2)
        print(num*num, end = " ")
'''


#2.
'''
str1 = input()
str2 = input()
set1 = set(str1)
set2 = set(str2)
cartesian = set()
for ch1 in set1:
    for ch2 in set2:
        cartesian.add((ch1,ch2))
          
for i,j in cartesian:
    print(i,j,sep = ",", end = "\t")
        
'''

#3.
'''
n = input("Enter the number")
s = 0
list1 = []
for i in n:
    list1.append(i)
print(list1)
for i in range(len(n)):
    list1.append(n[:i+1])
    list1.append(n[i:i+2])
    list1.append(n[i:i+3])
    
set1 = set(list1)
for i in set1:
    s += int(i)
print(s)
'''


#4.
'''
str1 = input()
str2 = ""
def modify(str1):
    global str2
    for i in range(0,len(str1)-1,2):
        str2 = str2+str1[i+1]+str1[i]
    return str2
print(modify(str1))
'''


#5.
'''
str1 = input()
print(str1.replace("YOU", "I"))
'''

#6.
'''
s1 = input()
s2 = input()
final = ""
for i in range(min(len(s1),len(s2))):
    final += s1[i]+s2[i]
print(final)
'''

#7.
'''
s1 = input("Enter the string")
ch = input("Enter the character to be checked inthe string")
got_it = False
for i in s1:
    if i == ch and not got_it:
        got_it = True
if got_it:
    print(ch,"is available in",s1)
else:
    print(ch,'not there in',s1)
'''

#8.
'''
s1 = input()
print("reversed string is",s1[::-1])
'''

#9.
'''
s1 = input()
s2 = input()
set1 = set(s1)
set2 = set(s2)
set3 = set1 - set2
output = ""
for i in s1:
    if i in set3:
        output += i
print(output)
'''

#10.
'''
s1 = input()
s2 = input()
set1 = set(s1)
set2 = set(s2)
dict1 = {}
dict2 = {}
for i in set1:
    dict1[i] = s1.count(i)
for i in set2:
    dict2[i] = s2.count(i)
if (dict2 == dict1):
    print("It is an anagram")
else:
    print("It is not an anagram")
'''








