class MoviesController < ApplicationController

  include Searchable

  def index
    params["search"]["platform"].delete_at(0)
    @platforms = params["search"]["platform"]
    params["search"]["duration"] ? @duration = 119 : @duration = 121
    params["search"]["famous"] ? @famous = "blockbuster" : @famous = "pépite"
    @mega_test = Mood.find_by(name: params["search"]["mood"])
    raise

    # filter on genres via mood
    @mood = Mood.find(22) # to change later
    @movies_global = filter_movie_by_genre_through_mood(@mood)
    # filter on platforms
    platforms = ["netflix"] # to change later
    @movies_by_platform = filter_movies_by_platforms(platforms)

    # filter on duration
    duration = 121 # to change later
    @movies_by_duration = filter_movies_by_duration(duration)

    # filter on type (blockbuster / pépite)
    type = "blockbuster" # to change later
    movies_by_type =filter_movies_by_type(type)
    # mini algorithm

    @movies = filter_10_movies_with_7_top(movies_by_type)
  end

end
