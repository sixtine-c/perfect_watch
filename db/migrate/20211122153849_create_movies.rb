class CreateMovies < ActiveRecord::Migration[6.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :actors, array: true, default: []
      t.text :directors, array: true, default: []
      t.text :synopsis
      t.float :rating
      t.integer :year
      t.text :platforms, array: true, default: []
      t.integer :duration
      t.integer :number_of_ratings

      t.timestamps
    end
  end
end
