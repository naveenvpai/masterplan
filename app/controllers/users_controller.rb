'''
This class provides functionality for viewing or creating a user profile. 
Its methods are automatically called upon signup (create) and login (show).
'''
class UsersController < ApplicationController
  #This dictates which methods are to be called before a user profile can be loaded 
  #(ensuring a user can't view another user's account).
  before_action :logged_in_user, only: [:show];
  before_action :correct_user, only: [:show];

  #This method is automatically when the user goes to the signup page. 
  #It creates a global variable to be populated by the form in the corresponding view.
  #The data is validated and written to the database in the create method.
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

