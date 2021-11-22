class MoodGenre < ApplicationRecord
  belongs_to :mood
  belongs_to :genre
end
