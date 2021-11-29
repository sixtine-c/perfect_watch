module Searchable
  def filter_movie_by_genre_through_mood(mood)
    array_genres_id = MoodGenre.where(mood_id: @mood).pluck(:genre_id)
    array_excluded_genres_id = MoodGenreExclusion.where(mood_id: @mood).pluck(:genre_id)

    movie_ids_without_filter = MovieGenre.where(genre_id: array_genres_id).pluck(:movie_id)
    movie_ids_exclusion_filter = MovieGenre.where(genre_id: array_excluded_genres_id).pluck(:movie_id)
    movie_ids_filtered = movie_ids_without_filter.difference(movie_ids_exclusion_filter)

    Movie.where(id: movie_ids_filtered)
  end

  def filter_movies_by_platforms(platforms)
    @movies_global.select { |movie| (movie.platforms & platforms).any? }
  end

  def filter_movies_by_duration(duration)
    duration > 120 ? @movies_by_platform.select { |movie| movie.duration >= 120  } : @movies_by_platform.select { |movie| movie.duration < 120 }
  end

  def filter_movies_by_type(type)
    type == "blockbuster" ? @movies_by_duration.select { |movie| movie.number_of_ratings >= 35000 } : @movies_by_duration.select { |movie| movie.number_of_ratings < 35000 }
  end

   def filter_10_movies_with_7_top(movies)
    movies_top = movies.select{|movie| movie.rating >= 70}.sample(7)
    movies_bof = movies.select{|movie| movie.rating < 70}.sample(3)
    (movies_top + movies_bof).sample(10)
  end


end
