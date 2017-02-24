class DeleteColumnsFromSongs < ActiveRecord::Migration
  def change
    remove_column :songs, :artist
    remove_column :songs, :genre

  end
end
