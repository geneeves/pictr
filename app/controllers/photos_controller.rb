class PhotosController < ApplicationController
  def index
    if params[:search]
      @query = params[:search]
      @results = Photo.basic_search(@query)
      render :search_results
    else
      @photos = Photo.all
      render :index
    end

  end

  def new
    respond_to do |format|
      format.html { @photo = Photo.new(photo_params) }
      format.js { @photo = Photo.new(photo_params) }
    end  
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

  def edit
    @photo = Photo.find(params[:id])
    authorize! :manage, @photo
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(params[:photo].permit(:image, :name, :album_id))
      flash[:notice] = "Photo updated."
      redirect_to @photo.album
    else
      render :edit
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def destroy
    @photo = Photo.find(params[:id])
    authorize! :manage, @photo
    @name = @photo.name
    @album = @photo.album
    @photo.destroy
    flash[:notice] = "Your photo #{@name} has been destroyed." 
    redirect_to @album
  end

private
  def photo_params
    params.require(:photo).permit(:name, :image, :album_id)
  end
end