#1.
'''
file1 = open("python_programming.txt","r")
contents = file1.read()
count_python = contents.count("python")
print("python is repeated",count_python,"times")
file1.close()
'''


#2.
'''
file1 = open("python_programming.txt","r")
file2 = open("p_count.txt","w")
contents = file1.read()
words_list = contents.split()
c = 0
for word in words_list:
    if word.startswith("p"):
        c = c + 1
print("count is",c, file = file2)
file1.close()
file2.close()
'''

#3.
'''
file1 = open("data.txt","r")
file2 = open("p_count.txt","w")
contents = file1.read()
words_list = contents.split()
print("count of characters:",len(contents), file = file2)
print("count of words:",len(words_list), file = file2)
file1.close()
file2.close()
'''

#4.
'''
file1 = open("data.txt","r")
file2 = open("data_new.txt","w")
contents = file1.read()
print(contents,file = file2)
file1.close()
file2.close()
file3 = open("data_new.txt","r")
contents = file3.read()
print(contents)
'''

#Can also use with for above codes to avoid closing of file everytime

#5.
'''
with open("matches.csv") as f1:
    all_data = f1.read()
    all_lines = all_data.splitlines()
    c = 0
    for line in all_lines:
   # print(type(line), line)
   #print(line.split(",")[0], line.split(",")[1])
        data = line.split(",")
        if str(data[1]) == "2009":
            c = c+1     
print(c)
#print(f1.closed)
'''


#6.
'''
file1=open("input.txt",'w')
file1.write("keep apple and orange in the basket")
file1.close()
file=open("input.txt","r")
file2=open("vowels.txt","w")
vowel=set()
vowel={'a','e','i','o','u'}
data=file.read().split()
for i in data:
            if i[0] in vowel:   #vowel can be just string "aeiou"
                        file2.write(i+" ")
#print(file2)
file.close()
file2.close()
'''


#7.
'''
with open("data.txt", 'r') as infile:
    words = infile.read().split()              
    max_len = len(words[0])
    for i in words:
        if len(i) >= max_len:
            max_len=len(i)
            max_word = i
print("The length of the longest word is",max_len)
print("The longest word is",max_word)
'''


#8.
'''
outfile = open('myfile.txt','w')
line = input('Enter line: ')
while line != "stop":
        line += "\n"
        outfile.write(line)
        line = input('Enter line: ')
outfile.close()
infile = open("myfile.txt","r")
contents = infile.read()
print("Contents of the file are:",contents)
print("Number of words =",len(contents.split()))
print("Number of lines =",len(contents.splitlines()))
infile.close()
'''