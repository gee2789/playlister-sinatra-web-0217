class ArtistsController < ApplicationController

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug' do #shows artists
    @artists = Artist.find_by_slug(params[:slug])
    # @songs.artist = Artist.find_by_id(@songs.artist_id)
    # @songs.genre = Genre.find(SongGenre.find(@songs.id).genre_id).name
    erb :'/artists/show'
  end
end
