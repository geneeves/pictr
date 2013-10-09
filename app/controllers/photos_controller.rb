class PhotosController < ApplicationController
  def new
    @photo = Photo.new(photo_params)
  end

  def create
    @photo = Photo.new(photo_params)

    if @photo.save!
      flash[:notice] = "Your photo has been added."
      redirect_to @photo.album
    else
      flash[:alert] = "Something went wrong!"
      render :new
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

private
  def photo_params
    params.require(:photo).permit(:name, :image, :album_id)
  end
end