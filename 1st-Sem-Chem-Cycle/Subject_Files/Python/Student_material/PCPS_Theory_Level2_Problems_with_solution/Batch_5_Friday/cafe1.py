import tkinter as tk
from tkinter import ttk, messagebox
import csv

# Global variables
menu = []
order = {}
rating_var = None
root = None
menu_tree = None
order_text = None
total_var = None
item_var = None
quantity_var = None

def load_menu(filename):
    """Load menu data from a CSV file."""
    global menu
    try:
        with open(filename, newline='') as file:
            reader = csv.DictReader(file)
            for row in reader:
                menu.append(row)
    except Exception as e:
        messagebox.showerror("Error", f"Failed to load menu: {e}")

def add_to_order():
    """Add selected item and quantity to the order."""
    global order, item_var, quantity_var, menu
    item = item_var.get()
    quantity = quantity_var.get()

    if not item or quantity <= 0:
        messagebox.showwarning("Invalid Input", "Please select an item and enter a valid quantity.")
        return

    # Find item price
    price = next((float(i["Price"]) for i in menu if i["Item"] == item), 0)
    if item in order:
        order[item]["quantity"] += quantity
    else:
        order[item] = {"price": price, "quantity": quantity}

    update_order_summary()

def update_order_summary():
    """Update the order summary display."""
    global order, order_text, total_var
    order_text.delete(1.0, tk.END)
    total = 0
    total_items = 0  # Total number of items ordered

    for item, details in order.items():
        subtotal = details["price"] * details["quantity"]
        total += subtotal
        total_items += details["quantity"]  # Add to total item count
        order_text.insert(tk.END, f"{item}: {details['quantity']} x ${details['price']} = ${subtotal:.2f}\n")

    # Show totals
    order_text.insert(tk.END, f"\nTotal Items: {total_items}\n")
    order_text.insert(tk.END, f"Total Cost: ${total:.2f}")
    total_var.set(f"Total: ${total:.2f}")

def checkout():
    """Handle checkout process."""
    global order
    if not order:
        messagebox.showinfo("No Items", "No items in the order.")
        return
    messagebox.showinfo("Checkout", "Thank you for your order!")
    order = {}
    update_order_summary()
def submit_rating():
    save_rating(rating_window)



def open_rating_window():
    """Open a window to allow the user to give a rating."""
    global root, rating_var
    rating_window = tk.Toplevel(root)
    rating_window.title("Rate Us")

    tk.Label(rating_window, text="Please rate us (1-5):", font=("Arial", 12)).pack(pady=10)

    rating_var = tk.IntVar()
    rating_scale = tk.Scale(rating_window, from_=1, to=5, orient=tk.HORIZONTAL, variable=rating_var)
    rating_scale.pack(pady=10)

    submit_button = tk.Button(rating_window, text="Submit", command=lambda: save_rating(rating_window))
    submit_button.pack(pady=10)

def save_rating(window):
    """Save the given rating to a file."""
    global rating_var
    rating = rating_var.get()
    if rating < 1 or rating > 5:
        messagebox.showwarning("Invalid Rating", "Please select a rating between 1 and 5.")
        return

    try:
        with open("ratings.txt", "a") as file:
            file.write(f"Rating: {rating}\n")
        messagebox.showinfo("Thank You", "Thank you for your feedback!")
        window.destroy()
    except Exception as e:
        messagebox.showerror("Error", f"Failed to save rating: {e}")

def create_widgets():
    """Create application widgets."""
    global root, menu_tree, order_text, total_var, item_var, quantity_var

    # Menu Section
    menu_label = tk.Label(root, text="Menu", font=("Arial", 14, "bold"))
    menu_label.grid(row=0, column=0, padx=10, pady=10)

    menu_tree = ttk.Treeview(root, columns=("Item", "Price"), show="headings")
    menu_tree.heading("Item", text="Item")
    menu_tree.heading("Price", text="Price")
    menu_tree.grid(row=1, column=0, padx=10, pady=10)

    for item in menu:
        menu_tree.insert("", tk.END, values=(item["Item"], item["Price"]))

    # Add to Order Section
    add_order_frame = tk.Frame(root)
    add_order_frame.grid(row=2, column=0, padx=10, pady=10)

    tk.Label(add_order_frame, text="Select Item:").grid(row=0, column=0, padx=5, pady=5)
    item_var = tk.StringVar()
    item_combobox = ttk.Combobox(add_order_frame, textvariable=item_var, state="readonly")
    item_combobox["values"] = [item["Item"] for item in menu]
    item_combobox.grid(row=0, column=1, padx=5, pady=5)

    tk.Label(add_order_frame, text="Quantity:").grid(row=1, column=0, padx=5, pady=5)
    quantity_var = tk.IntVar(value=1)
    tk.Entry(add_order_frame, textvariable=quantity_var).grid(row=1, column=1, padx=5, pady=5)

    add_button = tk.Button(add_order_frame, text="Add to Order", command=add_to_order)
    add_button.grid(row=2, column=0, columnspan=2, pady=10)

    # Order Summary Section
    order_label = tk.Label(root, text="Order Summary", font=("Arial", 14, "bold"))
    order_label.grid(row=0, column=1, padx=10, pady=10)

    order_text = tk.Text(root, width=40, height=15)
    order_text.grid(row=1, column=1, rowspan=2, padx=10, pady=10)

    # Total and Checkout Section
    total_var = tk.StringVar(value="Total: $0.00")
    total_label = tk.Label(root, textvariable=total_var, font=("Arial", 12))
    total_label.grid(row=3, column=1, padx=10, pady=10)

    checkout_button = tk.Button(root, text="Checkout", command=checkout)
    checkout_button.grid(row=4, column=1, pady=10)

    # Rate Us Section
    rate_button = tk.Button(root, text="Rate Us", command=open_rating_window)
    rate_button.grid(row=5, column=1, pady=10)

if __name__ == "__main__":
    root = tk.Tk()
    root.title("Cafe Management Application")
    load_menu("menu.csv")
    create_widgets()
    root.mainloop()
