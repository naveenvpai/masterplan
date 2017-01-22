'''
This class provides functionality for viewing or creating a user profile. 
Its methods are automatically called upon signup (create) and login (show).
'''
class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show];
  before_action :correct_user, only: [:show];

  #This method is automatically called to create a global variable to be used by the controller's view. 
  def new
    @user = User.new
  end
  
  def show
    @photos = @user.photos
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
      log_in @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in"
        redirect_to root_url
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to root_url unless current_user?(@user)
    end
end

