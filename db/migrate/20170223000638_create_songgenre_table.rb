class CreateSonggenreTable < ActiveRecord::Migration
  def change
    create_table :songgenres do |t|
      t.string :song_id
      t.string :genre_id
    end
  end
end
