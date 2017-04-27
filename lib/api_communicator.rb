require 'rest-client'
require 'json'
require 'pry'

# iterate over the character hash to find the collection of `films` for the given
#   `character`
# collect those film API urls, make a web request to each URL to get the info
#  for that film
# return value of this method should be collection of info about each film.
#  i.e. an array of hashes in which each hash reps a given film
# this collection will be the argument given to `parse_character_movies`
#  and that method will do some nice presentation stuff: puts out a list
#  of movies by title. play around with puts out other info about a given film.

def get_character_movies_from_api(character)
 #make the web request
 all_characters = RestClient.get('http://www.swapi.co/api/people/') # web request
 character_hash = JSON.parse(all_characters)

 arr = nil
 character_hash["results"].each do |key|
   if key["name"] == character
   arr = key["films"]
   end
 end
arr
end

def parse_character_movies(character)
    movie_list = get_character_movies_from_api(character)
    movies = []

    movie_list.each do |url|
      movies << JSON.parse(RestClient.get(url))
    end
  movies
end


def show_character_movies(character)
   movie_list = parse_character_movies(character)
   show_me_the_money = []
   movie_list.each do |k, v|
     k.each do |key, value|
       if key == "title"
         show_me_the_money << value
       end
    end
  end
  puts show_me_the_money
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
