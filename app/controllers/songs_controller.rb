class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(song_params)
    # @song.artist = Artist.find_or_create_by(params[:song][:artist_id])
    redirect_to song_path(@song)
  end

  def edit
    @song = Song.find_by(params[:id])
  end

  def update
    @song = Song.find_by(params[:id])
    @song.update(song_params)
    redirect_to song_path(@song)
  end

  private
  def song_params
    params.require(:song).permit(:name, :artist, :genre)
  end
end
