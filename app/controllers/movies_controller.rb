class MoviesController < ApplicationController

  def index

    # filter on genres via mood
    @mood = Mood.find(22) #to change later
    array_genres_id = MoodGenre.where(mood_id: @mood).pluck(:genre_id)
    movie_ids = MovieGenre.where(genre_id: array_genres_id).pluck(:movie_id)
    @movies_global = Movie.where(id: movie_ids)
    #filter on platforms
    @platforms = ["netflix"] #to change later
    movies_by_platform = @movies_global.select { |movie| (movie.platforms & @platforms).any? }

    #fiter on duration
    @duration = 121 #to change later
    if @duration > 120
      movies_by_duration = movies_by_platform.select { |movie| movie.duration >= 120  }
    else
      movies_by_duration = movies_by_platform.select { |movie| movie.duration < 120 }
    end
    #movies_by_duration = movies_by_platform.select { |movie| @duration > 120 ? movie.duration >= 120 : movie.duration <= 120 }

    #filter on blockbuster 35000
    @type = "blockbuster" #to change later


    @movies_top = @movies_global.where("rating > ?", 70).sample(7)
    @movies_bof = @movies_global.sample(3)
    @movies = @movies_top + @movies_bof
    @movies = @movies.sample(10)

  end

end
