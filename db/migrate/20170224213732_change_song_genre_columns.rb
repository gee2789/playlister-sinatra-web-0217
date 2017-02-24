class ChangeSongGenreColumns < ActiveRecord::Migration
  def change
    change_column :song_genres, :song_id, :integer
    change_column :song_genres, :genre_id, :integer
  end
end
