def read_movies(file_name):
    movies = []
    with open(file_name, 'r') as file:
        for line in file:
            genre, director, title = line.strip().split(', ')
            movies.append({'genre': genre, 'director': director, 'title': title})
    return movies

def write_movies(file_name, movies):
    with open(file_name, 'w') as file:
        for movie in movies:
            file.write(f"{movie['genre']}, {movie['director']}, {movie['title']}\n")

def total_movies(movies):
    return len(movies)

def unique_genres(movies):
    #return set(movie['genre'] for movie in movies)
	s1=set()
	for movie in movies:
		s1.add(movie['genre'])
	return s1

def movies_by_genre(movies):
    genre_dict = {}
    for movie in movies:
        genre = movie['genre']
        if genre not in genre_dict:
            genre_dict[genre] = []
        genre_dict[genre].append(movie['title'])
    return genre_dict

def directors_in_genre(movies):
	genre_director_count = {}
	for movie in movies:
		genre = movie['genre']
		director = movie['director']
		if genre not in genre_director_count:
			genre_director_count[genre] = set()
		genre_director_count[genre].add(director)
#return {genre: len(directors) for genre, directors in genre_director_count.items()}
	genre_director_lengths={}
	for genre, directors in genre_director_count.items():
		genre_director_lengths[genre]=len(directors)
	return genre_director_lengths


def directors_by_genre(movies):
	genre_director_dict = {}
	for movie in movies:
		genre = movie['genre']
		director = movie['director']
		if genre not in genre_director_dict:
			genre_director_dict[genre] = set()
		genre_director_dict[genre].add(director)
	#return {genre: list(directors) for genre, directors in genre_director_dict.items()}

	genre_director_lists={}
	for genre, directors in genre_director_dict.items():
		genre_director_lists[genre]=list(directors)

	return(genre_director_lists)


def movies_count_by_director(movies):
    director_count = {}
    for movie in movies:
        director = movie['director']
        if director not in director_count:
            director_count[director] = 0
        director_count[director] += 1
    return director_count

def movies_by_director(movies):
    director_movies = {}
    for movie in movies:
        director = movie['director']
        if director not in director_movies:
            director_movies[director] = []
        director_movies[director].append(movie['title'])
    return director_movies

def movies_count_by_director_genre(movies):
    director_genre_count = {}
    for movie in movies:
        director = movie['director']
        genre = movie['genre']
        if director not in director_genre_count:
            director_genre_count[director] = {}
        if genre not in director_genre_count[director]:
            director_genre_count[director][genre] = 0
        director_genre_count[director][genre] += 1
    return director_genre_count

def movies_by_director_genre(movies):
    director_genre_movies = {}
    for movie in movies:
        director = movie['director']
        genre = movie['genre']
        if director not in director_genre_movies:
            director_genre_movies[director] = {}
        if genre not in director_genre_movies[director]:
            director_genre_movies[director][genre] = []
        director_genre_movies[director][genre].append(movie['title'])
    return director_genre_movies

def add_new_movies(movies, new_movies):
    for movie in new_movies:
        movies.append({'genre': movie[0], 'director': movie[1], 'title': movie[2]})
        
def sort_movies_by_title_ascending(movies):
    # Create a list to hold titles
    titles = []
    for movie in movies:
        titles.append(movie['title'])  # Add the title to the list

    # Sort the titles using a simple bubble sort algorithm
    for i in range(len(titles)):
        for j in range(0, len(titles) - i - 1):
            if titles[j] > titles[j + 1]:
                # Swap if the current title is greater than the next title
                titles[j], titles[j + 1] = titles[j + 1], titles[j]

    # Display the sorted titles along with their genre and director
    for title in titles:
        for movie in movies:
            if movie['title'] == title:
                print(f"{movie['genre']}, {movie['director']}, {title}")        

# Read the movie data from the file
file_name = 'movies.txt'
movies = read_movies(file_name)

# Menu loop
while True:
    print("\nMovie Database Menu")
    print("1. Total Number of Movies")
    print("2. Number of Unique Genres")
    print("3. List of Movies in Each Genre")
    print("4. Number of Directors in Each Genre")
    print("5. List of Directors in Each Genre")
    print("6. Number of Movies Directed by Each Director")
    print("7. List of Movies Directed by Each Director")
    print("8. Number of Movies Directed by Each Director in Each Genre")
    print("9. List of Movies Directed by Each Director in Each Genre")
    print("10. Add Two New Movies")
    print("11. Sort movies based on title")
    print("12. Exit")

    choice = input("Enter your choice: 1 to 11 and 12 to exit")

    if choice == '1':
        print("Total Number of Movies:", total_movies(movies))
    elif choice == '2':
        print("Number of Unique Genres:", len(unique_genres(movies)))
    elif choice == '3':
        genre_movies = movies_by_genre(movies)
        for genre, titles in genre_movies.items():
            print(f"{genre}: {', '.join(titles)}")
    elif choice == '4':
        genre_director_count = directors_in_genre(movies)
        for genre, count in genre_director_count.items():
            print(f"{genre}: {count} directors")
    elif choice == '5':
        genre_directors = directors_by_genre(movies)
        for genre, directors in genre_directors.items():
            print(f"{genre}: {', '.join(directors)}")
    elif choice == '6':
        director_count = movies_count_by_director(movies)
        for director, count in director_count.items():
            print(f"{director}: {count} movies")
    elif choice == '7':
        director_movies = movies_by_director(movies)
        for director, titles in director_movies.items():
            print(f"{director}: {', '.join(titles)}")
    elif choice == '8':
        director_genre_count = movies_count_by_director_genre(movies)
        for director, genres in director_genre_count.items():
            for genre, count in genres.items():
                print(f"{director} - {genre}: {count} movies")
    elif choice == '9':
        director_genre_movies = movies_by_director_genre(movies)
        for director, genres in director_genre_movies.items():
            for genre, titles in genres.items():
                print(f"{director} - {genre}: {', '.join(titles)}")
    elif choice == '10':
        new_movies = [
            ("Sci-Fi", "Ridley Scott", "Blade Runner"),
            ("Action", "Martin Scorsese", "The Departed")
        ]
        add_new_movies(movies, new_movies)
        write_movies(file_name, movies)
        print("New movies added.")
    elif choice == '11':
        print("Sorted Movies by Title (Ascending Order):")
        sort_movies_by_title_ascending(movies)    
    elif choice == '12':	
        print("Exiting...")
        break
    else:
        print("Invalid choice. Please try again.")
