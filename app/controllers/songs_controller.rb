class SongsController < ApplicationController

  def show
    @artist = Song.find(params[:id])
  end

  def new
    @artist = Song.new
  end

  def edit
    @artist = Song.find(params[:id])
  end

  def create
    @artist = Song.new(song_params)
    @artist.save
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
