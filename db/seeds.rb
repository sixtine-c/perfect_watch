# sixtom 29c61d4aa3msh407fb303d51c6c3p174007jsnd233e6568de4
# six ff8764a8abmsh44ba9d0a973d4e8p166054jsn4cfba7d3235d
# nico 052bfc2d15mshbb71bb1352ba53ap1dd95bjsn478b8aa1888a
# brice e252da852cmshf59f72eb56d0fdap1358dcjsnae23afd90969

require 'uri'
require 'net/http'
require 'openssl'

# title: "Arrival", actors: ["Amy Adams", "Jeremy Renner", "Forest Whitaker", "Michael Stuhlbarg", "Tzi Ma", "Mark O'Brien", "Julia Scarlett Dan"], directors: ["Denis Villeneuve"],synopsis:"Taking place after alien crafts land around the world, an expert linguist is recruited by the military to determine whether they come in peace or are a threat.",rating: 79.0,year: 2016,platforms: ["prime"],duration: 116,number_of_ratings: 647439,link: ["https://www.amazon.com/title/80117799/"],poster: "https://image.tmdb.org/t/p/original/x2FJsf1ElAgr63Y3PNPtJrcmpoe.jpg">


# def scrapping_method(platform, page_number)
#   url = URI("https://streaming-availability.p.rapidapi.com/search/basic?country=fr&service=#{platform}&type=movie&page=#{page_number}")
#   http = Net::HTTP.new(url.host, url.port)
#   http.use_ssl = true
#   http.verify_mode = OpenSSL::SSL::VERIFY_NONE

#   request = Net::HTTP::Get.new(url)
#   request["x-rapidapi-host"] = 'streaming-availability.p.rapidapi.com'
#   request["x-rapidapi-key"] = ENV['RAPID_API']
#   http.request(request)
# end

# platform = 'netflix'
# page_number = 201
# #page_number = 201
# response = scrapping_method(platform, page_number)
# while JSON.parse(response.read_body)["total_pages"] > page_number
#   JSON.parse(response.read_body)["results"].each do |movie|
#     if Movie.find_by(title: movie["title"])
    #   db_movie = Movie.find_by(title: movie["title"])
    #   puts movie["streamingInfo"][platform].first[1]["link"] unless db_movie.link.include? movie["streamingInfo"][platform].first[1]["link"]
    #   db_movie.update(link: db_movie.link << movie["streamingInfo"][platform].first[1]["link"]) unless db_movie.link.include? movie["streamingInfo"][platform].first[1]["link"]
    #   db_movie.update(platforms: db_movie.platform << "netflix") unless db_movie.platforms.include? "netflix"
    # else
    #   new_movie = Movie.create!(title: movie["title"], actors: movie["cast"], directors: movie["significants"], synopsis: movie["overview"], rating: movie["imdbRating"], year: movie["year"],platforms: movie["streamingInfo"].first[0].split,duration: movie["runtime"], number_of_ratings: movie["imdbVoteCount"],link: movie["streamingInfo"].first[1].first[1]["link"].split,poster: movie["posterURLs"]["original"])
    #   movie["genres"].each do |genre|
    #     MovieGenre.create!(movie_id: new_movie.id, genre_id: Genre.find_by(api_genre_id: genre).id)
    #   end
#     end
#   end
#   page_number += 1
#   response = scrapping_method(platform, page_number)
#   puts page_number
# end

# Movies Prime
# puts 'starting seed'
# platform = 'prime'
# page_number = 35
# response = scrapping_method(platform, page_number)
# while JSON.parse(response.read_body)["total_pages"] > page_number
#   JSON.parse(response.read_body)["results"].each do |movie|
#     if Movie.find_by(title: movie["title"])
#       db_movie = Movie.find_by(title: movie["title"])
#       puts movie["streamingInfo"][platform].first[1]["link"] unless db_movie.link.include? movie["streamingInfo"][platform].first[1]["link"]
#       db_movie.update(link: db_movie.link << movie["streamingInfo"][platform].first[1]["link"]) unless db_movie.link.include? movie["streamingInfo"][platform].first[1]["link"]
#       db_movie.update(platforms: db_movie.platforms << "prime") unless db_movie.platforms.include? "prime"
#     else
#       new_movie = Movie.create!(title: movie["title"], actors: movie["cast"], directors: movie["significants"], synopsis: movie["overview"], rating: movie["imdbRating"], year: movie["year"],platforms: movie["streamingInfo"].first[0].split,duration: movie["runtime"], number_of_ratings: movie["imdbVoteCount"],link: movie["streamingInfo"].first[1].first[1]["link"].split,poster: movie["posterURLs"]["original"])
#       movie["genres"].each do |genre|
#         MovieGenre.create!(movie_id: new_movie.id, genre_id: Genre.find_by(api_genre_id: genre).id)
#       end
#     end
#   end

#   page_number += 1
#   response = scrapping_method(platform, page_number)
#   puts page_number
# end
# puts 'done'


# Genre
# seed already done

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

# Moods
# already seeded
Mood.create(name: "Beer & Pizza")
Mood.create(name: "Cold Blood ?")
Mood.create(name: "Time flies")
Mood.create(name: "Kids friendly")
Mood.create(name: "Ben & Jerry's (& Cry)")
Mood.create(name: "I'm Going on an Adventure !")
Mood.create(name: "Cocooning")
Mood.create(name: "Not ready to sleep")

# MoodGenre
# already seeded

count = Mood.first.id
genre_associated_biere_pizza = [28,	35,	12,	14,	878, 16]

genre_associated_biere_pizza.each do |genre|
   MoodGenre.create!(genre_id: Genre.find_by(api_genre_id: genre).id, mood_id: count)
end

count +=1
genre_associated_cold_blood = [53,	80,	2,	9648,	7]

genre_associated_cold_blood.each do |genre|
   MoodGenre.create(genre_id: Genre.find_by(api_genre_id: genre).id, mood_id: count)
end

count +=1
genre_associated_time_flies = [37,	99,	10752,	10763,	10764,	1,	36]

genre_associated_time_flies.each do |genre|
   MoodGenre.create(genre_id: Genre.find_by(api_genre_id: genre).id, mood_id: count)
end

count +=1
genre_associated_kids = [10751,	14,	10749,	4,	16,	35,	3]

genre_associated_kids.each do |genre|
   MoodGenre.create(genre_id: Genre.find_by(api_genre_id: genre).id, mood_id: count)
end

count +=1
genre_associated_ben_jerry = [10749,	18]

genre_associated_ben_jerry.each do |genre|
   MoodGenre.create(genre_id: Genre.find_by(api_genre_id: genre).id, mood_id: count)
end

count +=1
genre_associated_adventure = [12,	14,	878,	9648]

genre_associated_adventure.each do |genre|
   MoodGenre.create(genre_id: Genre.find_by(api_genre_id: genre).id, mood_id: count)
end

count +=1
genre_associated_cocooning = [35, 10749, 14]

genre_associated_cocooning.each do |genre|
   MoodGenre.create(genre_id: Genre.find_by(api_genre_id: genre).id, mood_id: count)
end

count +=1
genre_associated_not_ready_tosleep = [27]

genre_associated_not_ready_tosleep.each do |genre|
   MoodGenre.create(genre_id: Genre.find_by(api_genre_id: genre).id, mood_id: count)
end


# MoodGenreExclusion
# seeded chez sixtine

puts 'starting to seed exclusion genre'

count = Mood.first.id
genre_excluded_biere_pizza = [10_749]

genre_excluded_biere_pizza.each do |genre|
   MoodGenreExclusion.create!(genre_id: Genre.find_by(api_genre_id: genre).id, mood_id: count)
end

count +=1
genre_excluded_cold_blood = [10749, 35]

genre_excluded_cold_blood.each do |genre|
   MoodGenreExclusion.create(genre_id: Genre.find_by(api_genre_id: genre).id, mood_id: count)
end

count +=1
genre_excluded_time_flies = [14, 878]

genre_excluded_time_flies.each do |genre|
   MoodGenreExclusion.create(genre_id: Genre.find_by(api_genre_id: genre).id, mood_id: count)
end

count +=1
genre_excluded_kids = [53,	80,	27,	2,	9648,	28]

genre_excluded_kids.each do |genre|
   MoodGenreExclusion.create(genre_id: Genre.find_by(api_genre_id: genre).id, mood_id: count)
end

count +=1
genre_excluded_ben_jerry = [27,	28]

genre_excluded_ben_jerry.each do |genre|
   MoodGenreExclusion.create(genre_id: Genre.find_by(api_genre_id: genre).id, mood_id: count)
end

count +=1
genre_excluded_adventure = [10764,	1,	36]

genre_excluded_adventure.each do |genre|
   MoodGenreExclusion.create(genre_id: Genre.find_by(api_genre_id: genre).id, mood_id: count)
end

count +=1
genre_excluded_cocooning = [27]

genre_excluded_cocooning.each do |genre|
   MoodGenreExclusion.create(genre_id: Genre.find_by(api_genre_id: genre).id, mood_id: count)
end

count +=1
genre_excluded_not_ready_tosleep = [10749, 35]

genre_excluded_not_ready_tosleep.each do |genre|
   MoodGenreExclusion.create(genre_id: Genre.find_by(api_genre_id: genre).id, mood_id: count)
end

puts 'done'


# platforms_to_search = %w[netflix prime] # par ex
# movie_associations = platforms_to_search.map do |platform|
#   Movie.where("platforms @> ?", "{#{platform}}")
# end
# filtered_results = movie_associations.reduce do |accumulator, element|
#   accumulator & element
# end
