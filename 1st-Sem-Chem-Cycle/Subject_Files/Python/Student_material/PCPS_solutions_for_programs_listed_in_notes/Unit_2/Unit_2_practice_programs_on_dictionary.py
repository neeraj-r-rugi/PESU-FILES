#1.
'''
d1 = {}
for i in range(5):
    key = input("enter the key:")
    value = input("enter the value:")
    d1[key] = value
#print(d1)
for k in d1:
    print(k, "-->",d1[k])
'''


#2.
'''
d1 = {}
n = int(input("enter the value of n"))
for i in range(1,n+1):
    d1[i] = i*i
print(d1)
'''




#3.
#Create a dictionary with Student name as the key and marks as value. Find the class average.
'''
student_marks = {}
n = int(input("enter the number of student marks you want to store"))
for i in range(n):
    name = input("Enter the student name")
    marks = int(input("Enter the student marks"))
    student_marks[name] = marks
print("Average is",(sum(student_marks.values())/len(student_marks)))
'''




#4.
'''
d={'roshan': {'math':100,'phy':90,'chem':90}, 'dhruv': {'math':90,'phy':89,'chem':95}, 'alisha': {'math':95,'phy':95,'chem':93}, 'naveen':{'math':98,'phy':91,'chem':92} }
name = input("Enter the name of the student whose marks you want to know")
if name in d:
    for sub in d[name]:
        print("student has scored",d[name][sub], "in",sub)
else:
    print("student data not available")
'''

'''
d={'roshan': {'math':100,'phy':90,'chem':90}, 'dhruv': {'math':90,'phy':89,'chem':95}, 'alisha': {'math':95,'phy':95,'chem':93}, 'naveen':{'math':98,'phy':91,'chem':92} }
math = []
phy = []
chem = []
avg_marks = {}
for name in d:
    math.append(d[name]['math'])
    phy.append(d[name]['phy'])
    chem.append(d[name]['chem'])
avg_marks['math'] = sum(math)/len(math)
avg_marks['phy'] = sum(phy)/len(phy)
avg_marks['chem'] = sum(chem)/len(chem)

for sub in avg_marks:
    print(sub,"--->",avg_marks[sub] )
'''



#5.
'''
n = "how much wood would a wood chuck chuck if a wood chuck could chuck wood"
words = n.split(" ")
set_of_words = set(words)
words_count = {}
for word in set_of_words:
    words_count[word] = words.count(word)
#print(words_count)
print("Count of occurrences of a every word in a sentence")
for word in words_count:
    print(word,"-->", words_count[word])
'''


#6.
'''
sentence = input("enter the sentence")
words = sentence.split(" ")
first_letters = []
dict_words = {}
for word in words:
    first_letters.append(word[0])
for letter in first_letters:
    dict_words[letter] = set()
#print(dict_words) 
for word in words: 
    for key in dict_words:
        if word.startswith(key):
            dict_words[key].add(word)
for letter in dict_words:
    print(letter,"-->",list(dict_words[letter]))
''' 

#7.
'''
n = int(input("Enter the number of employees"))
print("Enter",n,"details - grade:salary having a space in between")
details = {}
for i in range(1,n+1):
    grade,salary = input().split(" ")
    salary = int(salary)
    details[grade] = salary
sa = 0
c = 0
print(details)
for grade in details:
    #print(grade)
    if grade.upper() in ('A', 'B'):
        sa = sa + details[grade]
        c = c+1
#print(sa,c)
if c > 0:
    print("Average of salary for A and B Grade employees is",sa/c) 
'''

#8:
'''
student_marks = {}
n = int(input("Enter the number of student marks you want to store"))
for i in range(n):
    name = input("Enter the student name")
    marks = int(input("Enter the student marks"))
    student_marks[name] = marks
students = []
for name in student_marks:
    if student_marks[name] > 80:
        students.append(name)
print("Sorted students names who scored more than 80 are here")
students.sort()
print(students)
'''

#9.
'''
s1 = input("enter the string")
count_vowels = {}
for ch in  s1:
    if ch in "aeiou":
        count_vowels[ch] = s1.count(ch)
print(count_vowels)
'''


#10.
'''
product_details = {}
n = int(input("Enter the number of products"))
for i in range(n):
    code = input("Enter the code")
    price = int(input("Enter the price"))
    product_details[code] = price
print("Highest price is:", max(product_details.values()))
print("Lowest price is:",min(product_details.values())) 
'''

#11.
"""sanskrit kalidasa shakuntala
english r_k_narayan malgudi_days
kannada kuvempu ramayanadarshanam
sanskrit bhasa swapnavasavadatta
kannada kuvempu malegalalli_madumagalu
english r_k_narayan dateless_diary
kannada karanta chomanadudi
sanskrit baana harshacharita
kannada karanta sarasatammana_Samadhi
sanskrit kalidasa malavikagnimitra
sanskrit kalidasa raghuvamsha
sanskrit baana kadambari
sanskrit bhasa pratijnayogandhararayana
kannada kuvempu ramayanadarshanam"""
#data_books.txt contains all the data related to book as above in separate lines
'''
with open("data_books.txt") as f1:   #refer to file handling notes to solve 
    data = f1.read()
    books = set()
    lines = data.splitlines()
'''
   #1
'''
    print("Number of books is",len(lines))
'''
   #2
'''
    for book in lines:
        books.add(book.split()[1]) 
    print(books)
'''
    #3. 
'''
    books_data = {}
    for line in lines:
        language = line.split(" ")[1]
        book_name = line.split(" ")[2]
        if language not in books_data:
            books_data[language] = set()
        books_data[language].add(book_name)
    #print(books_data)
    for language in books_data:
        print(language,"--->", end = "")
        for book_name in books_data[language]:
            print(book_name, end = " ")
        print()
    #4 to #10 Try it!
'''    
        

#12
'''
#1
states =set()
with open("State_city_place.txt") as f1:
    all_data = f1.read()
    lines = all_data.splitlines()
    for line in lines:
        state = line.split(" ")[0]
        states.add(state)
    print(states)
'''
'''
#2
city_place = {}
with open("State_city_place.txt") as f1:
    all_data = f1.read()
    lines = all_data.splitlines()
    for line in lines:
        city = line.split(" ")[1]
        place = line.split(" ")[2]
        if city not in city_place:
            city_place[city] = set()
        city_place[city].add(place)
    #print(city_place)
    for city in city_place:
        print(city, end = "-->\n")
        for place in city_place[city]:
            print("\t\t",place)
'''
'''
#3
state_city_place = {}
with open("State_city_place.txt") as f1:
    all_data = f1.read()
    lines = all_data.splitlines()
    for line in lines:
        state = line.split(" ")[0]
        city = line.split(" ")[1]
        place = line.split(" ")[2]
        if state not in state_city_place:
            state_city_place[state] = {}
        if city not in state_city_place[state]:
            state_city_place[state][city] = set()
        state_city_place[state][city].add(place)
    #print(state_city_place)
    for state in state_city_place:
        print(state)
        for city in state_city_place[state]:
            print("\t", city)
            for place in state_city_place[state][city]:
                print("\t\t",place)
'''