require 'uri'
require 'net/http'
require 'openssl'

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

page_number = 1
#page_number = 82
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
