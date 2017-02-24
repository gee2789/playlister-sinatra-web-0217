class DeleteColumnFromGenres < ActiveRecord::Migration
  def change
    remove_column :genres, :artist
    remove_column :genres, :song
  end
end
