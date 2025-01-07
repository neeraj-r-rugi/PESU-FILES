import csv
import tkinter as tk

# Initial preferences, all set to '0'
preference = ['0', '0', '0', '0', '0', '0', '0', '0', '0']
result_label = None  # Placeholder for dynamically created result label

# Toggle the preference when a checkbox is clicked
def toggle_preference(index):
    preference[index] = '1' if preference[index] == '0' else '0'

# Generate results based on preferences
def get_results():
    output = []
    candiesFiltered = ''

    with open('candy-data.csv', mode='r') as file:
        candies = list(csv.reader(file))  # read all data into a list

        # Filter candies based on user preferences
        for candy in candies[1:]:
            match = True
            for i in range(9):
                if candy[i + 1] != preference[i]:
                    match = False
                    break
            if match:
                output.append(candy)

        # Sort filtered candies by rating
        output.sort(reverse=True, key=lambda x: float(x[-1]))

        # If no candies match, show top 5 most liked candies
        if not output:
            output = sorted(candies[1:], key=lambda x: float(x[-1]), reverse=True)[:5]
            candiesFiltered = "No candies matched your preferences.\nTop 5 Most Liked Candies:\n"
        else:
            topCandyString = f"Top Candy At Our Store matching your preferences:\n\t{output[0][0]}, Price: $ {round(float(output[0][-2]), 2)}\n\n"
            candiesFiltered = topCandyString + "\nFiltered Candies:\n"

        # Build the output string
        for candy in output:
            candiesFiltered += f"Candy: {candy[0]}, Price: $ {round(float(candy[-2]), 2)}\n"

    return candiesFiltered

# Display results on the GUI
def show_results():
    global result_label
    # Destroy any existing result label before creating a new one
    if result_label:
        result_label.destroy()
    
    result_text = get_results()
    result_label = tk.Label(root, text=result_text, justify='left')
    result_label.pack()

# Clear all filters and reset preferences
def clear_filters():
    global result_label
    for i in range(9):
        preference[i] = '0'
        checkbuttons[i].deselect()
    
    # Destroy the result label to clear results from the display
    if result_label:
        result_label.destroy()
        result_label = None

# Set up the Tkinter GUI
root = tk.Tk()
root.title("PES Candy Store")
root.geometry("400x500")

# title label
titleLabel = tk.Label(root, text="PES Candy Store", font=("Helvetica", 16))
titleLabel.pack()

# Checkbutton labels
labels = ["chocolate", "fruity", "caramel", "peanutyalmondy", "nougat", "crispedricewafer", "hard", "bar", "pluribus"]

# Create checkbuttons
checkbuttons = []
for i, label in enumerate(labels):
    checkbutton = tk.Checkbutton(root, text=label, command=lambda i=i: toggle_preference(i))
    checkbutton.pack(anchor='w')
    checkbuttons.append(checkbutton)

# Show Results and Clear Filters buttons
tk.Button(root, text="Show Results", command=show_results).pack()
tk.Button(root, text="Clear Filters", command=clear_filters).pack()

root.mainloop()
