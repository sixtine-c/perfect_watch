class MoviesController < ApplicationController

  include Searchable

  def index
    params["search"]["platform"].delete_at(0)
    @platforms = params["search"]["platform"]
    params["search"]["duration"] ? @duration = 119 : @duration = 121
    params["search"]["famous"] ? @type = "blockbuster" : @type = "pépite"
    @mood = Mood.find_by(name: params["search"]["mood"])

    # filter on genres via mood
    @movies_global = filter_movie_by_genre_through_mood(@mood)
    # filter on platforms
    @movies_by_platform = filter_movies_by_platforms(@platforms)

    # filter on duration
    @movies_by_duration = filter_movies_by_duration(@duration)

    # filter on type (blockbuster / pépite)
    movies_by_type =filter_movies_by_type(@type)
    # mini algorithm

    @movies = filter_10_movies_with_7_top(movies_by_type)
  end

end
