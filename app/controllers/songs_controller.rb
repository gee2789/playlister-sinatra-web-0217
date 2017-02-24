class SongsController < ApplicationController

  get '/songs' do
  @songs = Song.all
  erb :'/songs/index'
  end

  post '/songs' do

    # binding.pry
    @songs = Song.create(name: params["song"]["name"])
    @artist = Artist.create(name: params["artist"]["name"])
    binding.pry
    erb :'/songs/show'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @songs = Song.find_by_slug(params[:slug])
    @slug = @songs.artist.slug # @songs.artist = Artist.find_by_id(@songs.artist_id)
  #@genreslug = @songs.genres.each do .slug
    # @songs.genre = Genre.find(SongGenre.find(@songs.id).genre_id).name
    # binding.pry
    erb :'/songs/show'
  end

end
