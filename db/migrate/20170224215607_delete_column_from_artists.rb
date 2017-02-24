class DeleteColumnFromArtists < ActiveRecord::Migration
  def change
    remove_column :artists, :song
    remove_column :artists, :genre
  end
end
