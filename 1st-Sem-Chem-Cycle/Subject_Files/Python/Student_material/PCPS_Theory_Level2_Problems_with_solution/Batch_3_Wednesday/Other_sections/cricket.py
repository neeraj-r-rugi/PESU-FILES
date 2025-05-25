import tkinter as tk
from tkinter import ttk
import csv

# Function to load player data from the CSV file
def load_player_data(filename='cricket_players.csv'):
    players = []
    with open(filename, mode='r', newline='', encoding='utf-8') as file:
        reader = csv.DictReader(file)
        for row in reader:
            # Manually convert the fields to float if possible and check if the conversion works
            batting_avg = row['Batting Average']
            economy_rate = row['Bowling Economy Rate']
            rating = row['Rating']
            
            # Only add the player if the required fields can be converted to floats
            if batting_avg.replace('.', '', 1).isdigit() and economy_rate.replace('.', '', 1).isdigit() and rating.replace('.', '', 1).isdigit():
                player = {
                    'name': row['Player Name'],
                    'role': row['Role'],
                    'team': row['Team'],
                    'batting_avg': float(batting_avg),
                    'economy_rate': float(economy_rate),
                    'rating': float(rating)
                }
                players.append(player)
            else:
                print(f"Skipping invalid data for player: {row['Player Name']}")
    return players

# Function to filter players based on the selected criteria
def filter_players():
    # Get the filter criteria from the UI
    selected_team = team_var.get()
    min_batting_avg = float(batting_avg_var.get())
    max_bowling_economy = float(bowling_economy_var.get())
    
    filtered_players = []

    # Loop through all players and apply filters
    for player in players:
        if selected_team == "All Teams" or player['team'] == selected_team:
            if player['batting_avg'] >= min_batting_avg and player['economy_rate'] <= max_bowling_economy:
                filtered_players.append(player)

    # If no players match the criteria, show top 5 players by rating
    if len(filtered_players) == 0:
        filtered_players = []
        for player in players:
            filtered_players.append(player)
        
        # Sort filtered players by rating in descending order
        for i in range(len(filtered_players)):
            for j in range(i + 1, len(filtered_players)):
                if filtered_players[i]['rating'] < filtered_players[j]['rating']:
                    # Swap players
                    filtered_players[i], filtered_players[j] = filtered_players[j], filtered_players[i]
        
        # Keep only the top 5
        filtered_players = filtered_players[:5]
    
    # Clear the existing listbox and display filtered players
    player_listbox.delete(0, tk.END)
    for player in filtered_players:
        player_listbox.insert(tk.END, f"{player['name']} - {player['team']} - Rating: {player['rating']}")
    
    # Display the top player if any matches
    if len(filtered_players) > 0:
        top_player = filtered_players[0]
        top_player_label.config(text=f"Top Player: {top_player['name']} (Rating: {top_player['rating']})")
    else:
        top_player_label.config(text="Top Player: None")

# Load the player data from the CSV file
players = load_player_data()

# Create the main window
window = tk.Tk()
window.title("Cricket Player Filter")

# Create a label and dropdown for Team selection
team_label = tk.Label(window, text="Select Team:")
team_label.pack(padx=10, pady=5)

team_var = tk.StringVar()
team_dropdown = ttk.Combobox(window, textvariable=team_var)
team_dropdown['values'] = ['All Teams', 'India', 'Australia', 'South Africa', 'England', 'West Indies', 'Pakistan', 'New Zealand', 'Bangladesh', 'Sri Lanka', 'Afghanistan']
team_dropdown.set('All Teams')  # Default value
team_dropdown.pack(padx=10, pady=5)

# Create a label and entry for Batting Average filter
batting_avg_label = tk.Label(window, text="Min Batting Average:")
batting_avg_label.pack(padx=10, pady=5)

batting_avg_var = tk.StringVar(value="30.0")  # Default value
batting_avg_entry = tk.Entry(window, textvariable=batting_avg_var)
batting_avg_entry.pack(padx=10, pady=5)

# Create a label and entry for Bowling Economy Rate filter
bowling_economy_label = tk.Label(window, text="Max Bowling Economy Rate:")
bowling_economy_label.pack(padx=10, pady=5)

bowling_economy_var = tk.StringVar(value="5.0")  # Default value
bowling_economy_entry = tk.Entry(window, textvariable=bowling_economy_var)
bowling_economy_entry.pack(padx=10, pady=5)

# Create a button to apply the filter
filter_button = tk.Button(window, text="Filter Players", command=filter_players)
filter_button.pack(padx=10, pady=10)

# Create a label to display the top player
top_player_label = tk.Label(window, text="Top Player: None", font=("Helvetica", 12))
top_player_label.pack(padx=10, pady=10)

# Create a listbox to display the filtered players
player_listbox = tk.Listbox(window, width=50, height=15)
player_listbox.pack(padx=10, pady=10)

# Run the GUI application
window.mainloop()

