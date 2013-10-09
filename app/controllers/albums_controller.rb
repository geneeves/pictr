class AlbumsController < ApplicationController
  def new
    @album = Album.new
  end

  def create
    @album = current_user.albums.new(album_params)
    if @album.save
      flash[:notice] = "Your album has been created."
      redirect_to current_user
    else 
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  def show
    @album = Album.find(params[:id])
  end

private
  def album_params
    params.require(:album).permit(:name, :photos_attributes => [:album_id, :name, :image])
  end
end