from tkinter import *
from CSVFileOps import *

from PIL import Image, ImageTk

# Program which analyzes employee attrition data and gives out different
# views

root = None
uframe2 = None
uframe1 = None
var_hr = None
var_randd = None
var_sales = None
showLabel1 = None
showLabel2 = None
showLabel3 = None
gender = None
choose_sales = None
choose_randd = None
choose_hr = None
varGender = None

def cancel_action():
   global uframe2
   uframe2.destroy()

def show_rresult ():
   global gender, choose_sales, choose_randd, choose_hr
   global uframe2
   global varGender

   gender = varGender.get()
   uframe2.destroy()
   sales_count,randd_count, hr_count = getCount ('Yes', gender, choose_sales, choose_randd, choose_hr)
   uframe2 = Frame (root, height=500, width=1200)
   uframe2.place (x=450, y=300)
   hLabel = "Total attrition:" + gender
   Label(uframe2, text=hLabel, font='Arial 16 bold').grid(row=0, column=0, ipady=20)
   if choose_sales:
      salesCount = "Sales: " + str (sales_count)
      Label(uframe2, text=salesCount, font='Arial 16').grid(row=1, column=0, ipady=20)
   if choose_randd:
      r_and_d_Count = "Research&Development: " + str (randd_count)
      Label(uframe2, text=r_and_d_Count, font='Arial 16').grid(row=2, column=0, ipady=20)
   if choose_hr:
      HRCount = "Human Resources: " + str (hr_count)
      Label(uframe2, text=HRCount, font='Arial 16').grid(row=3, column=0, ipady=20)
   button2=Button (uframe2, text="OK", font='Arial 16', command=cancel_action)
   button2.grid (row=8, column=0)

def show_result():
   global uframe2
   global gender, var_hr, var_randd, var_sales
   global choose_sales, choose_randd, choose_hr
   
   uframe2.destroy()
   choose_sales = var_sales.get()
   choose_randd = var_randd.get()
   choose_hr = var_hr.get()
   sales_count,randd_count, hr_count = getCount ('No', gender, choose_sales, choose_randd, choose_hr)
   uframe2 = Frame (root, height=500, width=1200)
   uframe2.place (x=450, y=300)
   hLabel = "Current headcount:" + gender
   Label(uframe2, text=hLabel, font='Arial 16 bold').grid(row=0, column=0, ipady=20)
   if choose_sales:
      salesCount = "Sales: " + str (sales_count)
      Label(uframe2, text=salesCount, font='Arial 16').grid(row=1, column=0, ipady=20)
   if choose_randd:
      r_and_d_Count = "Research&Development: " + str (randd_count)
      Label(uframe2, text=r_and_d_Count, font='Arial 16').grid(row=2, column=0, ipady=20)
   if choose_hr:
      HRCount = "Human Resources: " + str (hr_count)
      Label(uframe2, text=HRCount, font='Arial 16').grid(row=3, column=0, ipady=20)
   button2=Button (uframe2, text="OK", font='Arial 16', command=cancel_action)
   button2.grid (row=8, column=0)

# Function creates check boxes
def CreateCButtons ():
   global uframe2
   global var_sales
   global var_randd
   global var_hr

   var_sales = IntVar()
   var_randd = IntVar ()
   var_hr = IntVar ()
   
   uframe2 = Frame (root, height=500, width=1200)
   uframe2.place (x=450, y=300)
   
   Label(uframe2, text="Choose Department:", font='Arial 16').grid(row=0, column=1, ipadx=20)
   Checkbutton(uframe2, text="Research & Development", font='Arial 16', variable=var_randd).grid(row=3, column =0, ipadx=20)
   Checkbutton(uframe2, text="Sales", font='Arial 16', variable=var_sales).grid(row=3, column=1, ipadx=20)
   Checkbutton(uframe2, text="Human Resources", font='Arial 16', variable=var_hr).grid(row=3, column=2, ipadx=20)
   button1=Button (uframe2, text="Proceed", font='Arial 16', command=show_result)
   button1.grid (row=8, column=1, ipadx=20)

   button2=Button (uframe2, text="Cancel", font='Arial 16', command=cancel_action)
   button2.grid (row=8, column=2)
   
def male_hc():
   global gender
   gender = 'Male'
   CreateCButtons ()   


def female_hc():
   global gender
   gender = 'Female'
   CreateCButtons ()

def getMData ():
   pass

def getFData ():
   pass

# Function creates Radio Buttons
def CreateRButtons ():
   global uframe2
   global varGender
   
   uframe2 = Frame (root, height=500, width=1200)
   uframe2.place (x=450, y=300)
   
   Label(uframe2, text="Select gender: ", font='Arial 24').grid (row=0, column=0, ipadx = 10)

   varGender = StringVar(uframe2, "Female")
   Radiobutton(uframe2, text="Male", font='Arial 20', variable=varGender, value="Male", command=getMData).grid(row=2, column=0, ipadx=50)
   Radiobutton(uframe2, text="Female", font='Arial 20',variable=varGender, value="Female", command=getFData).grid (row=2, column=1, ipadx=50)
   button1=Button (uframe2, text="Proceed", font='Arial 16', command=show_rresult)
   button1.grid (row=8, column=1, ipadx=20)

   button2=Button (uframe2, text="Cancel", font='Arial 16', command=cancel_action)
   button2.grid (row=8, column=2)
   
def getRandDHC():
   # Display Radio buttons to choose either male or female
   global choose_sales
   global choose_hr
   global choose_randd
   choose_randd = 1
   choose_sales = 0
   choose_hr = 0
   CreateRButtons()

def getSalesHC():
   global choose_sales
   global choose_hr
   global choose_randd
   choose_sales = 1
   choose_hr = 0
   choose_randd = 0
   # Display Radio buttons to choose either male or female
   CreateRButtons()

def getHRHC ():
   global choose_sales
   global choose_hr
   global choose_randd
   choose_hr = 1
   choose_sales = 0
   choose_randd = 0
   CreateRButtons()

def attrition_summary ():
   global uframe2
   uframe2 = Frame (root, height=500, width=1200)
   uframe2.place (x=450, y=300)
   hLabel = "Attrition Summary"
   Label(uframe2, text=hLabel, font='Arial 24 bold').grid(row=0, column=0, ipady=20)
   res = get_attr_summary ()
   result = "Male: " + str (res['Male']) + " Female: " + str (res ['Female'])
   Label(uframe2, text=result, font='Arial 20 bold').grid(row=1, column=0, ipady=20)
   button2=Button (uframe2, text="OK", font='Arial 16', command=cancel_action)
   button2.grid (row=8, column=0)

def selective_attrition ():
   pass

def quit_app ():
   root.destroy()

def dest_frame ():
   global uframe2
   uframe2.destroy()
   
def about_app ():
    global uframe2
    uframe2 = Frame (root, height=10, width=20)
    uframe2.place (x=1020, y=280)
    text_widget = Text(uframe2, wrap='word', height=5, width=15, font='Arial 20', bg='black', fg='yellow')
    #text_widget.pack(padx=10, pady=10)
    text_widget.pack()

    # Insert some text into the Text widget
    sample_text = """One of the best apps in the market. Sit back, relax, understand
Enjoy !!!!
              """
    text_widget.insert(END, sample_text)

    # Make the Text widget read-only
    text_widget.config(state=DISABLED)
    button2 = Button(uframe2, text="Back", font='Arial 10', command=dest_frame)
    button2.pack()
  
def main ():
   global root
   global uframe1
   #create top level window 
   root = Tk()
   
   #set window size 
   root.geometry("1920x1080")

   # Prevent resizing of the root window
   root.resizable (0, 0)

   canvas = Canvas(root, width=1920, height=1080)

   canvas.place(x=0, y=0)

   # Load the image
   image = Image.open("scenery.jpg")

   # Resize the image to fit the canvas
   image = image.resize((1920, 1080))

   # Convert the image to a PhotoImage object
   photo_image = ImageTk.PhotoImage(image)

   # Display the image on the canvas
   canvas.create_image(0, 0, anchor=NW, image=photo_image)

   Label(root, text = "Employee Attrition Data Analyzer", font='Calibri 32 italic',bg='black', fg='white').place(x = 450, y = 60)
   uframe1 = Frame (root, height=1200, width=1200)
   uframe1.place (x=300, y=230)

   # Current headcount related menubutton
   mbtn_curhc = Menubutton(uframe1, text="Current headcount", font='Arial 24 bold', fg = 'orange', relief=RAISED)
   mbtn_curhc.grid(row=0, column=0, ipadx=5)

   mbtn_curhc.menu = Menu(mbtn_curhc, tearoff = 0)
   mbtn_curhc["menu"] = mbtn_curhc.menu

   mbtn_curhc.menu.add_command(label="Male", font = 'Arial 20', command=male_hc)
   mbtn_curhc.menu.add_command(label="Female", font = 'Arial 20',command=female_hc)

   # Total attrition related menubutton
   mbtn_attrition = Menubutton(uframe1, text="Total Attrition", font='Arial 24 bold', fg = 'orange', relief=RAISED)
   mbtn_attrition.grid(row=0, column=1, ipadx=10)
   mbtn_attrition.menu = Menu(mbtn_attrition, tearoff = 0)
   mbtn_attrition["menu"] = mbtn_attrition.menu

   mbtn_attrition.menu.add_command(label="Research&Development", font = 'Arial 20',command=getRandDHC)
   mbtn_attrition.menu.add_command(label="Sales", font = 'Arial 20',command=getSalesHC)
   mbtn_attrition.menu.add_command(label="Human Resources", font = 'Arial 20',command=getHRHC)

   # All detailed analysis related
   mbtn_analysis = Menubutton(uframe1, text="Detailed Analysis", font='Arial 24 bold', fg = 'orange', relief=RAISED)
   mbtn_analysis.grid(row=0, column=2, ipadx=10)
   mbtn_analysis.menu = Menu(mbtn_analysis, tearoff = 0)
   mbtn_analysis["menu"] = mbtn_analysis.menu
   mbtn_analysis.menu.add_command(label="Attrition summary", font = 'Arial 20',command=attrition_summary)
   mbtn_analysis.menu.add_command(label="Selective attrition", font = 'Arial 20',command=selective_attrition)

   # Help and quit related    
   mbtn_exit = Menubutton(uframe1, text="Help", font='Arial 24 bold', fg = 'orange', relief=RAISED)
   mbtn_exit.grid(row=0, column=3, ipadx=10)
   mbtn_exit.menu = Menu(mbtn_exit, tearoff = 0)
   mbtn_exit["menu"] = mbtn_exit.menu

   mbtn_exit.menu.add_command(label="About", font='Arial 20', command=about_app)
   mbtn_exit.menu.add_command(label="Quit", font = 'Arial 20', command=quit_app)
   
   #ReadCSVFile ("Employee_attrition at IBM.csv")
   root.mainloop()

if __name__ == '__main__':
   main ()













   
