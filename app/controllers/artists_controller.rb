class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
  end
  
  def edit
    @artist = Artist.find_by(params[:id])
  end

  def update
    @artist = Artist.find_by(params[:id])
    @artist.update(artist_params)
    redirect_to artist_path(@artist)
  end

  def create
    @artist = Artist.create(artist_params)
    redirect_to artist_path(@artist)
    params.inspect
  end

  private
  def artist_params
    params.require(:artist).permit(:name, :bio)
  end
end
