require 'uri'
require 'net/http'
require 'openssl'

# id 1583 Movie.create(title: "titanic", actors: ["leo",'lea'], directors: ["john"], synopsis: "genial", rating: 80, year: 2012 ,platforms: ["netflix"],duration: 200, number_of_ratings: 130000,link: ["https://www.google.com/search?q=titanic"],poster: "ok")
#id 1584 Movie.create(title: "hello london", actors: ["chris",'tuk'], directors: ["ta mère"], synopsis: "bouh", rating: 56, year: 2019 ,platforms: ["amazon"],duration: 95, number_of_ratings: 33000,link: ["https://www.google.com/search?q=nul"],poster: "ok")
#id 1585 Movie.create(title: "James B", actors: ["Daniel",'monica'], directors: ["ton père"], synopsis: "my name is bond", rating: 72, year: 2023 ,platforms: ["netflix","amazon"],duration: 123, number_of_ratings: 38000,link: ["https://www.google.com/search?q=james"],poster: "ok")

#Movies Netflix

def scrapping_method(page_number)
  url = URI("https://streaming-availability.p.rapidapi.com/search/basic?country=fr&service=netflix&type=movie&page=#{page_number}")
  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Get.new(url)
  request["x-rapidapi-host"] = 'streaming-availability.p.rapidapi.com'
  request["x-rapidapi-key"] = ENV['RAPID_API']
  http.request(request)
end

page_number = 201
#page_number = 201
response = scrapping_method(page_number)
while JSON.parse(response.read_body)["total_pages"] > page_number
  JSON.parse(response.read_body)["results"].each do |movie|
    if Movie.find_by(title: movie["title"])
      db_movie = Movie.find_by(title: movie["title"])
      db_movie.link << movie["streamingInfo"].first[1].first[1]["link"].split unless db_movie.link.include? movie["streamingInfo"].first[1].first[1]["link"]
      db_movie.platforms << movie["streamingInfo"].first[0].split unless db_movie.platforms.include? movie["streamingInfo"].first[0]
    else
      new_movie = Movie.create!(title: movie["title"], actors: movie["cast"], directors: movie["significants"], synopsis: movie["overview"], rating: movie["imdbRating"], year: movie["year"],platforms: movie["streamingInfo"].first[0].split,duration: movie["runtime"], number_of_ratings: movie["imdbVoteCount"],link: movie["streamingInfo"].first[1].first[1]["link"].split,poster: movie["posterURLs"]["original"])
      movie["genres"].each do |genre|
        MovieGenre.create!(movie_id: new_movie.id, genre_id: Genre.find_by(api_genre_id: genre).id)
      end
    end
  end
  page_number += 1
  response = scrapping_method(page_number)
  puts page_number
end




#Genre
#seed already done

# Genre.create(name: "Biography", api_genre_id: 1)
# Genre.create(name: "Film Noir", api_genre_id: 2)
# Genre.create(name: "Game Show", api_genre_id: 3)
# Genre.create(name: "Musical", api_genre_id: 4)
# Genre.create(name: "Sport", api_genre_id: 5)
# Genre.create(name: "Short", api_genre_id: 6)
# Genre.create(name: "Adult", api_genre_id: 7)
# Genre.create(name: "Adventure", api_genre_id: 12)
# Genre.create(name: "Fantasy", api_genre_id: 14)
# Genre.create(name: "Animation", api_genre_id: 16)
# Genre.create(name: "Drama", api_genre_id: 18)
# Genre.create(name: "Horror", api_genre_id: 27)
# Genre.create(name: "Action", api_genre_id: 28)
# Genre.create(name: "Comedy", api_genre_id: 35)
# Genre.create(name: "History", api_genre_id: 36)
# Genre.create(name: "Western", api_genre_id: 37)
# Genre.create(name: "Thriller", api_genre_id: 53)
# Genre.create(name: "Crime", api_genre_id: 80)
# Genre.create(name: "Documentary", api_genre_id: 99)
# Genre.create(name: "Science Fiction", api_genre_id: 878)
# Genre.create(name: "Mystery", api_genre_id: 9648)
# Genre.create(name: "Music", api_genre_id: 10402)
# Genre.create(name: "Romance", api_genre_id: 10749)
# Genre.create(name: "Family", api_genre_id: 10751)
# Genre.create(name: "War", api_genre_id: 10752)
# Genre.create(name: "News", api_genre_id: 10763)
# Genre.create(name: "Reality", api_genre_id: 10764)
# Genre.create(name: "Talk Show", api_genre_id: 10767)

#Moods
#already seed
# Mood.create(name: "Bière & Pizza")
# Mood.create(name: "What's in the box ?")
# Mood.create(name: "Retour vers le passé")
# Mood.create(name: "Kids friendly")
# Mood.create(name: "Ben & Jerry's (& Cry)")
# Mood.create(name: "I'm Going on an Adventure !")
# Mood.create(name: "Cocooning")

#MoodGenre
#already seed

# count = Mood.first.id
# genre_associated_biere_pizza = [28,	35,	12,	14,	878, 16,	27]

# genre_associated_biere_pizza.each do |genre|
#    MoodGenre.create!(genre_id: Genre.find_by(api_genre_id: genre).id, mood_id: count)
# end

# count +=1
# genre_associated_what_inthebox = [53,	80,	27,	2,	9648,	7]

# genre_associated_what_inthebox.each do |genre|
#    MoodGenre.create(genre_id: Genre.find_by(api_genre_id: genre).id, mood_id: count)
# end

# count +=1
# genre_associated_retour_passe = [37,	99,	10752,	10763,	10764,	1,	36]

# genre_associated_retour_passe.each do |genre|
#    MoodGenre.create(genre_id: Genre.find_by(api_genre_id: genre).id, mood_id: count)
# end

# count +=1
# genre_associated_kids = [10751,	14,	10749,	4,	16,	35,	3]

# genre_associated_kids.each do |genre|
#    MoodGenre.create(genre_id: Genre.find_by(api_genre_id: genre).id, mood_id: count)
# end

# count +=1
# genre_associated_ben_jerry = [10749,	18]

# genre_associated_ben_jerry.each do |genre|
#    MoodGenre.create(genre_id: Genre.find_by(api_genre_id: genre).id, mood_id: count)
# end

# count +=1
# genre_associated_adventure = [12,	14,	878,	9648]

# genre_associated_adventure.each do |genre|
#    MoodGenre.create(genre_id: Genre.find_by(api_genre_id: genre).id, mood_id: count)
# end

# count +=1
# genre_associated_cocooning = [35, 10749, 14]

# genre_associated_cocooning.each do |genre|
#    MoodGenre.create(genre_id: Genre.find_by(api_genre_id: genre).id, mood_id: count)
# end
