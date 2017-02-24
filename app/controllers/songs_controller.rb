require "rack-flash"

class SongsController < ApplicationController

  enable :sessions
  use Rack::Flash
  
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  post '/songs' do
    # @songs = Song.find_or_create_by(params["song"])
    @songs = Song.create(name: params["song"]["name"])
    @songs.artist = Artist.find_or_create_by(params["artist"])

    @genres = params["song"]["genre"]
    @genres.each do |d|
      genre = Genre.find(d)
      genre.songs << @songs
    end

    @songs.save
    flash[:message] = "Successfully created song."
    redirect "songs/#{@songs.slug}"
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @songs = Song.find_by_slug(params[:slug])
    @slug = @songs.artist.slug

    # @songs.artist = Artist.find_by_id(@songs.artist_id)
    #@genreslug = @songs.genres.each do .slug
    # @songs.genre = Genre.find(SongGenre.find(@songs.id).genre_id).name
    # binding.pry
    erb :'/songs/show'
  end

end
