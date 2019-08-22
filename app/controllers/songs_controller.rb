class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
    @artist = Artist.find(params[:id])
    @genre = Genre.find(params[:id])

  end

  def new
    @song = Song.new
  end

  def edit
    @song = Song.find(params[:id])
  end

# "song"=>{"name"=>"Indre", "artist_id"=>"lulu", "genre_id"=>"house"}

  def create
    @song = Song.new(song_params)
    @song.artist = Artist.find_or_create_by("artist")
    @song.genre = Genre.find_or_create_by("genre")
    @song.save
    redirect_to song_path(@song)
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)
    redirect_to song_path(@song)
  end

  private

  def song_params
    params.require(:song).permit!
  end

end
