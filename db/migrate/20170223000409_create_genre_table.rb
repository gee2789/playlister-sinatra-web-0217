class CreateGenreTable < ActiveRecord::Migration
  def change
    create_table :genres do |t|
      t.string :name
      t.string :song
      t.string :artist
    end
  end
end
