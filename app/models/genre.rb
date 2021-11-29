class Genre < ApplicationRecord
  has_many :mood_genres
  has_many :mood_genres_exclusions
end
