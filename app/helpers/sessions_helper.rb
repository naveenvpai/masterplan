'''
This is a 'util'-like module which provides validation functionality to the various controller classes. 
'''
module SessionsHelper
  def log_in(user)
    #Note that this cookie is automatically destroyed upond browser close
    session[:user_id] = user.id
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def current_user?(user)
    return user == current_user
  end

  def logged_in?
    !current_user.nil?
  end

  #This is called by app/controllers/sessions_controller.rb when user clicks "Log out"
  def log_out 
    session.delete(:user_id)
    current_user = nil
  end
end
