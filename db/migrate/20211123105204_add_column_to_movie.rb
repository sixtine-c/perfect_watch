class AddColumnToMovie < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :link, :text, array: true, default: []
  end
end
