def load_data(filename):
    data = []
    with open(filename, 'r') as file:
        for line in file:
            stud, cour, grad, scor = line.strip().split(", ")
            data.append({'student': stud, 'course': cour, 'grade': grad, 'score': scor})
    return data
#1
def total_stud_unique_courses(filename):
    data = load_data(filename)
    studentset=set()
    courseset=set()
    for entry in data:
        studentset.add(entry['student'])
        courseset.add(entry['course'])
    return len(studentset),courseset
#2
def list_of_students_in_each_course(filename):
    data = load_data(filename)
    courseset=set()
    for entry in data:
        courseset.add(entry['course'])
    for course in courseset:
        print(f"Students enrolled in {course} course")
        for entry in data:
            if entry['course'] == course:
                print(f"\t{entry['student']}")

#3
def count_courses_by_student(filename):
    data = load_data(filename)
    student_course_count = {}
    for entry in data:
        student = entry['student']
        course = entry['course']
        if student not in student_course_count:
            student_course_count[student] = {}
        if course not in student_course_count[student]:
            student_course_count[student][course] = 1
    for student in student_course_count:
        print(f"Student: {student}")
        print(f"Total number of courses: {len(student_course_count[student])}")
        list_of_courses = student_course_count[student].keys()
        print("List of courses taken: ")
        print(list(list_of_courses))
#4
def calc_average_score_for_each_course(filename):
    data = load_data(filename)
    courseset = set()
    for entry in data:
        courseset.add(entry['course'])
    for course in courseset:
        sum=0;
        n=0;
        for entry in data:
            if entry['course'] == course:
                sum+=float(entry['score'])
                n+=1
        avgscore=sum/n
        print(f"Average score in {course} course is: {avgscore:.2f}")
#5
def add_student(file_name, details):
    with open(file_name, mode='a') as file:
        file.write("\n" + ", ".join(details))
        #file.close()
    print(f"{details} Student entry added successfully.")
#6
def remove_student_details(file_name, student_name):
    data = load_data(file_name)
    updated_entries = []
    student_found = False
    for entry in data:
        if entry['student'].lower() == student_name.lower():
            student_found =True
        else:
            updated_entries.append(entry)
    if(student_found):
        with open(file_name, 'w') as file:
            firstline=True
            for entry in updated_entries:
                if firstline==True:
                    file.write(f"{entry['student']}, {entry['course']}, {entry['grade']}, {entry['score']}")
                    firstline=False
                else:
                    file.write(f"\n{entry['student']}, {entry['course']}, {entry['grade']}, {entry['score']}")

                #file.close()
        print(f"All student entries by '{student_name}' have been removed successfully.")
    else:
         print("Student is not there in the data set!")
#7
def for_each_course_student_maxscore(filename):
    data = load_data(filename)
    courseset = set()
    for entry in data:
        courseset.add(entry['course'])
    for course in courseset:
        students_score_in_courselist=[];

        for entry in data:
            if entry['course'] == course:
                students_score_in_courselist.append(float(entry['score']))

        max_score=max(students_score_in_courselist)
        print(f"Max score in the {course} is {max_score:.2f}")
#8
def calc_average_score_of_each_student(filename):
    data = load_data(filename)
    studentset = set()
    for entry in data:
        studentset.add(entry['student'])
    for student in studentset:
        sum= 0;
        n= 0;
        for entry in data:
            if entry['student'] == student:
                sum+= float(entry['score'])
                n+= 1
        avgscore = sum/n
        print(f"Average score of {student} is: {avgscore:.2f}")
print("\nMenu:")
print("1. Find the total number of students enrolled and unique courses offered")
print("2. Display the list of students enrolled in each course")
print("3. For each student, count and list the courses they have enrolled in")
print("4. Determine the average score for each course ")
print("5. Add new student enrollment to the existing data with all required details")
print("6. Remove all entries of a specified student from the dataset")
print("7. For each course, determine the maximum score among all students")
print("8. Find the average score of each student across all courses")
print("9. Exit")

while True:
    choice = input("Enter your choice: ")
    filename="enrollments.txt"
    
    if(choice == '1'):
       total_student, uniquecourses=total_stud_unique_courses(filename)
       print(f"Total number of students: {total_student}")
       print(f"Unique courses: {uniquecourses}")
    elif(choice == '2'):
       list_of_students_in_each_course(filename)
    elif(choice == '3'):
        count_courses_by_student(filename)
    elif(choice == '4'):
        calc_average_score_for_each_course(filename)
    elif(choice == '5'):
        stdname = input("Enter student name: ")
        scname = input("Enter course name: ")
        sgrade = input("Enter the grade: ")
        sscore = input("Enter the score: ")
        add_student(filename, [stdname, scname, sgrade, sscore])
    elif(choice == '6'):
        student_name = input("Enter the student name: ")
        remove_student_details(filename, student_name)
    elif (choice == '7'):
        for_each_course_student_maxscore(filename)
    elif (choice == '8'):
        calc_average_score_of_each_student(filename)
    elif(choice == '9'):
        break
    else:
        print("Invalid choice. Please try again.")

        

