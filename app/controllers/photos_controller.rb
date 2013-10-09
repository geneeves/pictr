class PhotosController < ApplicationController
  def new
    respond_to do |format|
      format.html { @photo = Photo.new(photo_params) }
      format.js { @photo = Photo.new }
    end  
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

  def destroy
    @photo = Photo.find(params[:id])
    @name = @photo.name
    @photo.destroy
    flash[:notice] = "Your photo <% @name %> has been destroyed." 
  end

private
  def photo_params
    params.require(:photo).permit(:name, :image, :album_id)
  end
end