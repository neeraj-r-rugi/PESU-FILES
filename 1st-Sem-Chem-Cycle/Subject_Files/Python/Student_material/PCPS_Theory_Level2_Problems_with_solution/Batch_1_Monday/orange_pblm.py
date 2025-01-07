import tkinter as tk
from tkinter import ttk, messagebox
import csv

# Load movie data from the CSV file
data_file = "movie_ticket_data.csv"

def load_movies():
    movies = []
    with open(data_file, mode="r") as file:
        reader = csv.DictReader(file)
        for row in reader:
            movies.append(row)
    return movies

movies_data = load_movies()

# Helper functions
def get_movies_by_date(date):
    movies = []
    for movie in movies_data:
        if movie["Date"] == date and movie["Movie_Name"] not in movies:
            movies.append(movie["Movie_Name"])
    return movies

def get_showtimes(movie, date):
    showtimes = []
    for m in movies_data:
        if m["Movie_Name"] == movie and m["Date"] == date:
            showtimes.append(m["Time"])
    return showtimes

def get_ticket_price(movie, date, time):
    for m in movies_data:
        if m["Movie_Name"] == movie and m["Date"] == date and m["Time"] == time:
            return m["Ticket_Price"]
    return None

def book_tickets():
    selected_movie = movie_var.get()
    selected_date = date_var.get()
    selected_time = time_var.get()
    requested_tickets = ticket_var.get()

    if selected_movie == "" or selected_date == "" or selected_time == "" or requested_tickets == "":
        messagebox.showerror("Error", "Please fill in all fields.")
        return

    if not requested_tickets.isdigit() or int(requested_tickets) <= 0:
        messagebox.showerror("Error", "Please enter a valid number of tickets.")
        return

    requested_tickets = int(requested_tickets)

    # Check availability
    for movie in movies_data:
        if movie["Movie_Name"] == selected_movie and movie["Date"] == selected_date and movie["Time"] == selected_time:
            available_seats = int(movie["Available_Seats"])
            ticket_price = int(movie["Ticket_Price"])

            if available_seats >= requested_tickets:
                total_cost = requested_tickets * ticket_price
                movie["Available_Seats"] = str(available_seats - requested_tickets)
                save_changes()
                messagebox.showinfo(
                    "Booking Confirmation",
                    "Booking Confirmed!\n\n"
                    + "Movie: " + selected_movie + "\n"
                    + "Date: " + selected_date + "\n"
                    + "Time: " + selected_time + "\n"
                    + "Tickets: " + str(requested_tickets) + "\n"
                    + "Total Cost: ₹" + str(total_cost),
                )
                reset_fields()
            else:
                messagebox.showwarning(
                    "Not Enough Seats",
                    "Only " + str(available_seats) + " seats are available. Please adjust your booking.",
                )
            return

    messagebox.showerror("Error", "Selected show is not available.")

def save_changes():
    with open(data_file, mode="w", newline="") as file:
        writer = csv.DictWriter(file, fieldnames=["Movie_Name", "Date", "Time", "Available_Seats", "Ticket_Price"])
        writer.writeheader()
        writer.writerows(movies_data)

def reset_fields():
    movie_var.set("")
    date_var.set("")
    time_var.set("")
    ticket_var.set("")
    ticket_price_label["text"] = "Ticket Price: ₹0"
    time_menu["values"] = []

def update_movies(event):
    selected_date = date_var.get()
    movies = get_movies_by_date(selected_date)
    movie_menu["values"] = movies
    movie_var.set("")
    time_menu["values"] = []
    time_var.set("")
    ticket_price_label["text"] = "Ticket Price: ₹0"

def update_times(event):
    selected_movie = movie_var.get()
    selected_date = date_var.get()
    showtimes = get_showtimes(selected_movie, selected_date)
    time_menu["values"] = showtimes
    time_var.set("")
    ticket_price_label["text"] = "Ticket Price: ₹0"

def update_price(event):
    selected_movie = movie_var.get()
    selected_date = date_var.get()
    selected_time = time_var.get()
    if selected_movie != "" and selected_date != "" and selected_time != "":
        ticket_price = get_ticket_price(selected_movie, selected_date, selected_time)
        if ticket_price is not None:
            ticket_price_label["text"] = "Ticket Price: ₹" + ticket_price

# GUI Setup
root = tk.Tk()
root.title("Movie Ticket Booking System")

# Variables
movie_var = tk.StringVar()
date_var = tk.StringVar()
time_var = tk.StringVar()
ticket_var = tk.StringVar()

# Layout
tk.Label(root, text="Movie Ticket Booking System", font=("Arial", 16)).grid(row=0, column=0, columnspan=2, pady=10)

tk.Label(root, text="Select Date:").grid(row=1, column=0, sticky="w", padx=10, pady=5)
dates = []
for movie in movies_data:
    if movie["Date"] not in dates:
        dates.append(movie["Date"])
dates.sort()
date_menu = ttk.Combobox(root, textvariable=date_var, values=dates, state="readonly")
date_menu.grid(row=1, column=1, padx=10, pady=5)
date_menu.bind("<<ComboboxSelected>>", update_movies)

tk.Label(root, text="Select Movie:").grid(row=2, column=0, sticky="w", padx=10, pady=5)
movie_menu = ttk.Combobox(root, textvariable=movie_var, state="readonly")
movie_menu.grid(row=2, column=1, padx=10, pady=5)
movie_menu.bind("<<ComboboxSelected>>", update_times)

tk.Label(root, text="Select Time:").grid(row=3, column=0, sticky="w", padx=10, pady=5)
time_menu = ttk.Combobox(root, textvariable=time_var, state="readonly")
time_menu.grid(row=3, column=1, padx=10, pady=5)
time_menu.bind("<<ComboboxSelected>>", update_price)

ticket_price_label = tk.Label(root, text="Ticket Price: ₹0", font=("Arial", 12))
ticket_price_label.grid(row=4, column=0, columnspan=2, pady=5)

tk.Label(root, text="Number of Tickets:").grid(row=5, column=0, sticky="w", padx=10, pady=5)
tk.Entry(root, textvariable=ticket_var).grid(row=5, column=1, padx=10, pady=5)

# Buttons
tk.Button(root, text="Book Tickets", command=book_tickets).grid(row=6, column=0, pady=10)
tk.Button(root, text="Reset", command=reset_fields).grid(row=6, column=1, pady=10)

root.mainloop()