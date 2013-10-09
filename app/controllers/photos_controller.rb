class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      flash[:notice] = "Your photo has been added."
      redirect_to @photo.album
    else
      flash[:alert] = "Something went wrong!"
      render :new
    end
  end

private
  def photo_params
    params.require(:photo).permit(:name, :image)
  end
end