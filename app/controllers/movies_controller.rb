class MoviesController < ApplicationController

  include Searchable

  def index

    params["search"]["platform"].delete_at(0)
    @platforms = params["search"]["platform"]
    params["search"]["duration"] == "true" ? @duration = 119 : @duration = 121
    params["search"]["famous"] == "true" ? @type = "blockbuster" : @type = "pépite"
    @mood = Mood.find_by(name: params["search"]["mood"])
    # filter on genres via mood

    @mood_class = moodclass(@mood)

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

  def moodclass(mood)
    return "beer-party" if mood.name == "Bière & Pizza"
    return "history" if mood.name == "Retour vers le passé"
    return "thriller" if mood.name == "What's in the box ?"
    return "kids" if mood.name == "Kids friendly"
    return "adventure" if mood.name == "I'm Going on an Adventure !"
    return "cocooning" if mood.name == "Cocooning"
    return "icecream" if mood.name == "Ben & Jerry's (& Cry)"
    # "horror" if mood.name == ""
  end

end
