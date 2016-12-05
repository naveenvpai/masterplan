class PhotosController < ApplicationController
  def index
    @photos = Photo.order('created_at')
  end

  def new
    if logged_in?
      @photo = Photo.new
    else
      redirect_to root_path
    end
  end

  def create
    @photo = current_user.photos.build(photo_params)
    if @photo.save
      flash[:success] = "The photo was added!"
      redirect_to current_user
    else
      render 'new'
    end
  end

  def destroy
    Photo.find(params[:id]).destroy
    flash[:success] = "Photo deleted"
    redirect_to current_user
  end

  private

  def photo_params
    params.require(:photo).permit(:image, :title)
  end

end
