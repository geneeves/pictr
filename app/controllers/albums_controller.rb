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

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(params[:album].permit(:name))
      flash[:notice] = "Album name updated."
      redirect_to @album
    else
      render :edit
    end
  end
  
  def destroy
    @album = Album.find(params[:id])
    @name = @album.name
    @album.destroy
    flash[:notice] = "Your album #{@name} has been destroyed."
    redirect_to root_path
  end

private
  def album_params
    params.require(:album).permit(:name, :photos_attributes => [:album_id, :name, :image])
  end
end