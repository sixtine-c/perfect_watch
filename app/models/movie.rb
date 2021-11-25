class Movie < ApplicationRecord
  has_many :movie_genres, dependent: :destroy
  PLATFORMS = ['netflix','prime video','apple tv','disney +']
end
