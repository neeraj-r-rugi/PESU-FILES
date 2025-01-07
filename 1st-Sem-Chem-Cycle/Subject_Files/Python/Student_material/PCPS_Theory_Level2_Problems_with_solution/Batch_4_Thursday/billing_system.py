from tkinter import *
from tkinter import ttk, messagebox
import csv
import datetime

# Load Menu data from the CSV file
data_file = "Menu_Price.csv"


def load_menu_price(file):
    FoodPrice = []
    with open(data_file, mode="r") as file:
        reader = csv.DictReader(file)
        for row in reader:
            if row["Item"]=="":
                break
            FoodPrice.append(row)
    return FoodPrice

menu_data = load_menu_price(data_file)
#print(menu_data)

win=Tk()
win.title("Indian Breakfast Billing System")
win.geometry("1200x700+0+0")
customer_name = StringVar()
customer_phone = StringVar()
global billno
billno=1
customer_bill_no= str(billno)
def total():
    total=0
    for item in menu_data:
        if globals()[item["Item"].replace(" ", "_")].get()!=0:
            print(f"{item['Item']}:{globals()[item["Item"].replace(" ", "_")].get()}X{item['Price']}")
            total+=int(item["Price"])*int(globals()[item["Item"].replace(" ", "_")].get())
    print("Total amount=",total)
    tot_val.config(text= str(total)+" Rs.")
def bill_area():
    total = 0
    if not customer_name.get():
        messagebox.showerror("Error", "Please enter customer name")
        txt.delete('1.0', END)
    else:
        txt.insert(END, f"Customer Name: {customer_name.get()}\n")
        if not customer_phone.get():
            messagebox.showerror("Error", "Please enter customer phone number")
            txt.delete('1.0', END)
        # Check if the phone number contains only digits and is exactly 10 characters long
        elif not customer_phone.get().isdigit() or len(customer_phone.get()) != 10:
            messagebox.showerror("Error", "Please enter 10 digits phone number")
            txt.delete('1.0', END)
        else:
            txt.insert(END, f"Phone No.: {customer_phone.get()}\n")
            txt.insert(END, f"Bill No: {customer_bill_no}\n")
            txt.insert(END,f"Date and Time: {datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")}\n")
            for item in menu_data:
                if globals()[item["Item"].replace(" ", "_")].get() != 0:
                    txt.insert(END,f"{item['Item']}:{globals()[item["Item"].replace(" ", "_")].get()}X{item['Price']}\n")
                    total += int(item["Price"]) * int(globals()[item["Item"].replace(" ", "_")].get())
            txt.insert(END, f"Total amount= Rs. {total} ")
            genbill_btn.config(state=DISABLED)
def print_bill():
    billinput=txt.get("1.0",END)
    filename=str(billno)+".txt"
    with open(filename,"w") as file:
        file.write(billinput)
    printbill_btn.config(state=DISABLED)

def clear():
    txt.delete('1.0',END)
    global billno
    billno+=1
    customer_bill_no = str(billno)
    cbill_val.config(text=customer_bill_no)
    for item in menu_data:
        globals()[item["Item"].replace(" ", "_")].set(0)
    customer_name.set("")
    customer_phone.set("")
    tot_val.config(text="")
    genbill_btn.config(state=NORMAL)
    printbill_btn.config(state=NORMAL)


def exitapp():
    win.destroy()


for item in menu_data:
    #print(item["Item"].replace(" ", "_"))
    globals()[item["Item"].replace(" ", "_")]=IntVar()

 #===================================
bg_color = "light blue"
fg_color = "black"
lbl_color = 'black'
#Title of Application
#fill title horizontally X to the widget size
title = Label(win,text = "Indian Breakfast Billing System",bd = 10,relief = GROOVE,fg = fg_color,bg = bg_color,font=("times new roman",18,"bold"),pady = 3).pack(fill=X)

#==========Customers Frame==========#
F1 = LabelFrame(win,text = "Customer Details",font = ("time new roman",15,"bold"),fg = "brown",bg = bg_color,relief = GROOVE,bd = 10)
F1.place(x = 0,y = 50,relwidth = 1)

#===============Customer Name===========#
cname_lbl = Label(F1,text="Customer Name",bg = bg_color,fg = fg_color,font=("times new roman",15,"bold")).grid(row = 0,column = 0,padx = 10,pady = 5)
cname_en = Entry(F1,bd = 8,relief = GROOVE,textvariable = customer_name)
cname_en.grid(row = 0,column = 1,ipady = 4,ipadx = 30,pady = 5)

# =================Customer Phone==============#
cphon_lbl = Label(F1, text="Phone No", bg=bg_color, fg=fg_color, font=("times new roman", 15, "bold")).grid(row=0,column=2,padx=20)
cphon_en = Entry(F1, bd=8, relief=GROOVE, textvariable=customer_phone)
cphon_en.grid(row=0, column=3, ipady=4, ipadx=30, pady=5)

#====================Customer Bill No==================#
cbill_lbl = Label(F1,text = "Bill No.",bg = bg_color,fg = fg_color,font = ("times new roman",15,"bold"))
cbill_lbl.grid(row = 0,column = 4,padx = 20)
cbill_val = Label(F1,text = customer_bill_no,bg = bg_color,fg = fg_color,font = ("times new roman",15,"bold"))
cbill_val.grid(row = 0,column = 5,ipadx = 30,ipady = 4,pady = 5)

# ==================Food Frame=====================#
F2 = LabelFrame(win, text='Food', bd=10, relief=GROOVE, bg=bg_color, fg="brown",
                font=("times new roman", 13, "bold"))
F2.place(x=0, y=125, width=780, height=490)
rcnt=0
ccnt=0
for item in menu_data:
    #Label
    globals()[item["Item"].replace(" ", "_")+"_lbl"] = Label(F2, font=("times new roman", 10, "bold"), fg=lbl_color, bg=bg_color, text=item["Item"]+" (Rs. "+item["Price"]+")")
    globals()[item["Item"].replace(" ", "_")+"_lbl"].grid(row=rcnt, column=ccnt, padx=2, pady=2)
    #Entry box
    globals()[item["Item"].replace(" ", "_")+"_en"] = Entry(F2,width=8, bd=8, relief=GROOVE, textvariable=globals()[item["Item"].replace(" ", "_")])
    globals()[item["Item"].replace(" ", "_")+"_en"].grid(row=rcnt, column=ccnt+1)
    rcnt=rcnt+1
    if rcnt==12:
        rcnt=0
        ccnt=ccnt+2
# ============
tot_lbl = Label(F2, text="Total Amount:", bg=bg_color, fg=fg_color, font=("times new roman", 15, "bold"))
tot_lbl.grid(row=rcnt+5, column=ccnt+5)
tot_val = Label(F2, text="", bg=bg_color, fg=fg_color, font=("times new roman", 15, "bold"))
tot_val.grid(row=rcnt+10, column=ccnt+5)
#===================Bill Aera================#
F3 = Label(win,bd = 10,relief = GROOVE)
F3.place(x = 780,y = 140,width = 425,height = 400)
#===========
bill_title = Label(F3,text = "Bill List",font = ("Lucida",12,"bold"),bd= 7,relief = GROOVE)
bill_title.pack(fill = X)
# ============
scroll_y = Scrollbar(F3, orient=VERTICAL)
txt = Text(F3, yscrollcommand=scroll_y.set)
scroll_y.pack(side=RIGHT, fill=Y)
scroll_y.config(command=txt.yview)
txt.pack(fill=BOTH, expand=1)




#=============
F4 = LabelFrame(win,text = 'Bill Menu',bd = 10,relief = GROOVE,bg = bg_color,fg = "brown",font = ("times new roman",13,"bold"))
F4.place(x = 780,y = 540,width = 425,height = 75)

# ====================
total_btn = Button(F4, text="Total", command=total)
total_btn.grid(row=1, column=1,padx=5)
genbill_btn = Button(F4, text="Generate Bill", command=bill_area)
genbill_btn.grid(row=1, column=2,padx=5)
printbill_btn = Button(F4, text="Print Bill", command=print_bill)
printbill_btn.grid(row=1, column=3,padx=5)
clear_btn = Button(F4, text="Clear", command=clear)
clear_btn.grid(row=1, column=4,padx=5)
exit_btn = Button(F4, text="Exit", command=exitapp)
exit_btn.grid(row=1, column=5,padx=5)
# ========================


win.mainloop()

