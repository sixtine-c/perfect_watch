class Movie < ApplicationRecord
  has_many :movie_genres, dependent: :destroy
  PLATFORMS = [['netflix', 'Netflix'], ['prime video', 'Prime Video'], ['apple tv', 'Apple TV'], ['disney +', 'Disney +'] ]
end
