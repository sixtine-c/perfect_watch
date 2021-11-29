class CreateMoodGenreExclusions < ActiveRecord::Migration[6.0]
  def change
    create_table :mood_genre_exclusions do |t|
      t.references :mood, null: false, foreign_key: true
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
