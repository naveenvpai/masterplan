'''
This class defines the user flow for creating and managing images. 
It accesses params, a map of client side parameters, to access the same photo data across different pages.
It also changes a globally defined page view, flash, to notify the user of changes.
'''
class PhotosController < ApplicationController
  def index
    @photos = Photo.order('created_at')
  end

  #This method is called when the user clicks on 'Add photo'. The create method is called when the form is submitted.
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
