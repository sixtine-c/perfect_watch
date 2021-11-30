class MoviesController < ApplicationController

  include Searchable

  def index
    params["search"]["platform"].delete_at(0)
     @platforms = params["search"]["platform"].map do |platform|
      if platform == "prime video"
        "prime"
      else
        platform
      end
    end
    # @platforms = params["search"]["platform"]
    params["search"]["duration"] == "true" ? @duration = 119 : @duration = 121
    params["search"]["famous"] == "true" ? @type = "blockbuster" : @type = "pépite"
    @mood = params["search"]["random_mood"].present? ? Mood.find_by(name: moodname(params["search"]["random_mood"])) : Mood.find_by(name: params["search"]["mood"])
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


    @movie = filter_1_movie(movies_by_type)

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'tenmovies.html', locals: { movies: @movies } }
    end

  end


  def moodclass(mood)
    return "beer-party" if mood.name == "Beer & Pizza"
    return "history" if mood.name == "Time flies"
    return "thriller" if mood.name == "Cold Blood"
    return "kids" if mood.name == "Kids friendly"
    return "adventure" if mood.name == "I'm Going on an Adventure !"
    return "cocooning" if mood.name == "Cocooning"
    return "icecream" if mood.name == "Ben & Jerry's (& Cry)"
    return "horror" if mood.name == "Not ready to sleep"
    return "random" if mood.name == "Random"
  end

  def moodname(mood_class)
    return "Beer & Pizza" if mood_class == "beer-party"
    return "Time flies" if mood_class == "history"
    return "Cold Blood" if mood_class == "thriller"
    return "Kids friendly" if mood_class == "kids"
    return "I'm Going on an Adventure !" if mood_class == "adventure"
    return "Cocooning" if mood_class == "cocooning"
    return "Ben & Jerry's (& Cry)" if mood_class == "icecream"
    return "Not ready to sleep" if mood_class == "horror"
  end
end
