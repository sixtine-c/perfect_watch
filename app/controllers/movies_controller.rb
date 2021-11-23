class MoviesController < ApplicationController

  def index
    @movies = Movie.all.limit(10)
  end
end
