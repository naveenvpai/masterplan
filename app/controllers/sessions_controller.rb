'''
This class facilitates the session info for login/logout which is stored in a global variable, params, representing a client side map.
Flash is globally defined variable representing a page view for displaying temporary messages to users. 
Note that the session cookie is automatically destroyed upon browser quit, which is when the session ends.
More related functionality can be found in app/helpers/sessions_helper.rb
'''

class SessionsController < ApplicationController
  #This method specifies that the Session model requires a 'new' action corresponding to a log in page.
  def new
  end

  #This is called when the user submits the log in form.
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
      flash[:success] = "Logged in successfully!"          
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end 
  end

  #This is called when the user manually logs out
  def destroy 
    log_out
    redirect_to root_url
  end
end
