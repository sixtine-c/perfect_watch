class AddApiGenreIdToGenre < ActiveRecord::Migration[6.0]
  def change
    add_column :genres, :api_genre_id, :integer
  end
end
