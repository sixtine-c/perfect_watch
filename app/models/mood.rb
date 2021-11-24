class Mood < ApplicationRecord
  has_many :mood_genres, dependent: :destroy


  has_one_attached :photo
end
