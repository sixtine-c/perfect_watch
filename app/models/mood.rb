class Mood < ApplicationRecord
  has_many :mood_genres, dependent: :destroy
  has_many :mood_genre_exclusions, dependent: :destroy
  has_one_attached :photo
  MOODS = ["Beer & Pizza", "Cold Blood", "Time flies", "Kids friendly", "Ben & Jerry's (& Cry)", "I'm Going on an Adventure !", "Cocooning", "Not ready to sleep"]
end
