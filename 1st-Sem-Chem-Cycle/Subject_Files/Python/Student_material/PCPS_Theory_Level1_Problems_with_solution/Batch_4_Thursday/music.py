
def load_data(filename):
    data = []
    with open(filename, 'r') as file:
        for line in file:
            genre, artist, album = line.strip().split(", ")
            data.append({'genre': genre, 'artist': artist, 'album': album})
    return data

def count_albums(data):
    return len(data)

def add_album(file_name, albums):
    with open(file_name, mode='a') as file:
        file.write("\n" + ", ".join(albums))
        file.close()
    print(f"{albums} album(s) added successfully.")

def remove_duplicates(file_name):
    with open(file_name, 'r') as file:
        lines = file.readlines()
    unique_entries = []
    for line in lines:
        line = line.strip() 
        if line not in unique_entries:
            unique_entries.append(line)
    with open(file_name, 'w') as file:
        for entry in unique_entries:
            file.write(entry + "\n")

    print("Duplicates removed successfully.")

def count_albums_by_artist_and_genre(filename):
    data = load_data(filename)
    artist_genre_count = {}
    for entry in data:
        artist = entry['artist']
        genre = entry['genre']
        if artist not in artist_genre_count:
            artist_genre_count[artist] = {} 
        if genre not in artist_genre_count[artist]:
            artist_genre_count[artist][genre] = 0 
        artist_genre_count[artist][genre] += 1
    for artist in artist_genre_count:
        print(f"Artist: {artist}")
        for genre in artist_genre_count[artist]:
            print(f"  Genre: {genre}, Albums: {artist_genre_count[artist][genre]}")

def remove_artist_albums(file_name, artist_name):
    data = load_data(file_name)
    updated_entries = []
    artist_found = False
    for entry in data:
        if entry['artist'].lower() == artist_name.lower():  
            artist_found =True
        else:
            updated_entries.append(entry) 
    if(artist_found):
        with open(file_name, 'w') as file:
            for entry in updated_entries:
                if(updated_entries.index(entry) != len(updated_entries)-1):
                    file.write(f"{entry['genre']}, {entry['artist']}, {entry['album']}\n")
                else:
                    file.write(f"{entry['genre']}, {entry['artist']}, {entry['album']}")
        print(f"All albums by '{artist_name}' have been removed successfully.")
    else:
         print("Artist is not there in the data set!")

def get_album_title(entry):
    return entry['album']
def sort_albums(filename):
    data = load_data(filename)
    data.sort(key=get_album_title)
    return data

def delete_albums_by_genre(file_name, genre_to_delete):
    albums = load_data(file_name)
    updated_albums = []
    genre_found = False
    for album in albums:
        if album['genre'].lower() == genre_to_delete.lower(): 
            genre_found = True
        else:
            updated_albums.append(album)
    if(genre_found):
        with open(file_name, 'w') as file:
            for album in updated_albums:
                if(updated_albums.index(album) != len(updated_albums)-1):
                    file.write(f"{album['genre']}, {album['artist']}, {album['album']}\n")
                else:
                    file.write(f"{album['genre']}, {album['artist']}, {album['album']}")
        print(f"All albums from genre '{genre_to_delete}' have been removed successfully.")
    else:
        print("Genre is not there in the data set!")
def display_albums_by_artist(file_name, artist_name):
    albums = load_data(file_name)
    artist_found = False
    print(f"Albums by {artist_name}:")
    for album in albums:
        if album['artist'].lower() == artist_name.lower():
            print(f"{album['album']} ({album['genre']})")
            artist_found = True
    if not artist_found:
        print(f"No albums found for the artist '{artist_name}'.")
    
while True:
    print("\nMenu:")
    print("1. Count total albums")
    print("2. Add a new album")
    print("3. Remove duplicate entries")
    print("4. Count albums by each artist in each genre")
    print("5. Remove a specific artist's album")
    print("6. Sort albums by title")
    print("7. Delete all albums from a particular genre")
    print("8. Display albums by artist")
    print("9. Exit")
        
    choice = input("Enter your choice: ")
    filename="albums.txt"
    
    if(choice == '1'):
        data = load_data(filename)
        print(count_albums(data))
    elif(choice == '2'):
        genre = input("Enter genre: ")
        artist = input("Enter artist: ")
        album = input("Enter album title: ")
        add_album(filename, [genre, artist, album])
    elif(choice == '3'):
        remove_duplicates(filename)
    elif(choice == '4'):
        count_albums_by_artist_and_genre(filename)
    elif(choice == '5'):
        artist_name = input("Enter artist name: ")
        remove_artist_albums(filename, artist_name)
    elif(choice == '6'):
        albums = sort_albums(filename)
        print(albums)
    elif(choice == '7'):
        genre = input("Enter genere: ")
        delete_albums_by_genre(filename, genre)
    elif(choice == '8'):
        artist_name = input("Enter artist name: ")
        display_albums_by_artist(filename, artist_name)
    elif(choice == '9'):
        break
    else:
        print("Invalid choice. Please try again.")

        

