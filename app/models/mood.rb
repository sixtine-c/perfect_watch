class Mood < ApplicationRecord
  has_many :mood_genres

  has_one_attached :photo
end
