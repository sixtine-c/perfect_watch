class MoviesController < ApplicationController

  def index

    # @movies = Movie.all
    @mood = Mood.find(22) #to change later
    array_genres_id = MoodGenre.where(mood_id: @mood).pluck(:genre_id)
    movie_ids = MovieGenre.where(genre_id: array_genres_id).pluck(:movie_id)
    @movies_global = Movie.where(id: movie_ids)
    @movies_top = @movies_global.where("rating > ?", 70).sample(7)
    @movies_bof = @movies_global.sample(3)
    @movies = @movies_top + @movies_bof
    @movies = @movies.sample(10)

  end



end
