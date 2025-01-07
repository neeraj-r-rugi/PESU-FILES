#  CSVFileOps.py

# CSV file has data about a company's employees. There are 24 columns
##0 - Age	
##1 - Attrition	
##2 - Department	
##3 - DistanceFromHome	
##4 - Education	
##5 - EducationField	
##6 - EmployeeNumber	
##7 - EnvironmentSatisfaction	
##8 - Gender	
##9 - JobInvolvement	
##10 - JobLevel	
##11 - JobRole	
##12 - JobSatisfaction	
##13 - MaritalStatus	
##14 - NumCompaniesWorked	
##15 - PercentSalaryHike	
##16 - PerformanceRating	
##17 - RelationshipSatisfaction	
##18 - TotalWorkingYears	
##19 - TrainingTimesLastYear	
##20 - WorkLifeBalance	
##21 - YearsAtCompany	
##22 - YearsInCurrentRole	
##23 - YearsSinceLastPromotion	
##24 - YearsWithCurrManager	

import csv

# Contains methods to work with CSV file
# Returns a dictionary {"Male":count1, "Female":count2}
def get_attr_summary ():
    attr_summary = {'Male': 0, 'Female' : 0}
    # Open the CSV file in read mode
    csvfile = open("Employee_attrition at IBM.csv", 'r')
    # Create a reader object
    csv_reader = csv.reader(csvfile)
    header = next(csv_reader)    # Read the header row
    for rec in csv_reader:
        if (rec[1] == 'Yes'):   # If attrition
            if (rec [8] == 'Male'):
                attr_summary ['Male'] += 1
            if (rec [8] == 'Female'):
                attr_summary ['Female'] += 1
    csvfile.close()
    return attr_summary
    
def getCount (category, gender, varSales, varRandD, varHR):
    sCount = 0      #Number of employees in Sales
    rCount = 0      #Number of employees in R & D
    hCount = 0      #Number of employees in HR
    # Open the CSV file in read mode
    csvfile = open("Employee_attrition at IBM.csv", 'r')
    # Create a reader object
    csv_reader = csv.reader(csvfile)
    header = next(csv_reader)    # Read the header row
    for rec in csv_reader:
        if (rec[8] == gender and rec [1] == category):
            if varSales:
                if (rec[2] == 'Sales'):
                    sCount += 1
            if varRandD:
                if (rec[2] == 'Research_Development'):
                    rCount += 1
            if varHR:
                if (rec[2] == 'Human Resources'):
                    hCount += 1
    csvfile.close()
    return (sCount, rCount, hCount)

     
