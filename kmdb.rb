# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!

Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all
 

# Generate models and tables, according to the domain model.
# TODO!

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

studio1 = Studio.new
studio1["name"] = "Warner Bros."
studio1.save

warner = Studio.find_by({"name" => "Warner Bros."})

movie1 = Movie.new
movie1["title"] = "Batman Begins"
movie1["year_released"] = "2005"
movie1["rated"] = "PG-13"
movie1["studio_id"] = warner["id"]
movie1.save

movie2 = Movie.new
movie2["title"] = "The Dark Knight"
movie2["year_released"] = "2008"
movie2["rated"] = "PG-13"
movie2["studio_id"] = warner["id"]
movie2.save

movie3 = Movie.new
movie3["title"] = "The Dark Knight Rises"
movie3["year_released"] = "2012"
movie3["rated"] = "PG-13"
movie3["studio_id"] = warner["id"]
movie3.save


actor1 = Actor.new
actor1["name"] = "Christian Bale"
actor1.save

actor2 = Actor.new
actor2["name"] = "Michael Caine"
actor2.save

actor3 = Actor.new
actor3["name"] = "Liam Neeson"
actor3.save

actor4 = Actor.new
actor4["name"] = "Katie Holmes"
actor4.save

actor5 = Actor.new
actor5["name"] = "Gary Oldman"
actor5.save


bale = Actor.find_by({"name" => "Christian Bale"})
caine = Actor.find_by({"name" => "Michael Caine"})
neeson = Actor.find_by({"name" => "Liam Neeson"})
holmes = Actor.find_by({"name" => "Katie Holmes"})
oldman = Actor.find_by({"name" => "Gary Oldman"})


role1 = Role.new
role1["movie_id"] = warner["id"]
role1["actor_id"] = bale["id"]
role1["character_name"] = "Bruce Wayne"
role1.save

role2 = Role.new
role2["movie_id"] = warner["id"]
role2["actor_id"] = caine["id"]
role2["character_name"] = "Alfred"
role2.save

role3 = Role.new
role3["movie_id"] = warner["id"]
role3["actor_id"] = neeson["id"]
role3["character_name"] = "Ra's Al Ghul"
role3.save

role4 = Role.new
role4["movie_id"] = warner["id"]
role4["actor_id"] = holmes["id"]
role4["character_name"] = "Rachel Dawes"
role4.save

role5 = Role.new
role5["movie_id"] = warner["id"]
role5["actor_id"] = oldman["id"]
role5["character_name"] = "Commissioner Gordon"
role5.save




# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!


all_movies = Movie.all
for coffee in all_movies
    title = coffee["title"]
    year_released = coffee["year_released"]
    rated = coffee["rated"]
    studio = coffee["studio_id"]
    puts "#{title} #{year_released} #{rated} #{studio}"
end 


# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

all_roles = Role.all
for cookie in all_roles
    movie = cookie["movie_id"]
    actor = cookie["actor_id"]
    character = cookie["character_name"]
    puts "#{movie} #{actor} #{character}"
end 
