require "rack-flash"

class SongsController < ApplicationController
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
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @songs = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end


  patch '/songs/:slug' do
    @songs = Song.find_by_slug(params[:slug])
    @songs.update(params["song"])
    @songs.artist = Artist.find_or_create_by(name: params["artist"]["name"])
    @songs.save
    @slug = @songs.artist.slug

    flash[:message] = "Successfully updated song."

    redirect "songs/#{@songs.slug}"
  end

end
