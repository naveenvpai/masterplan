class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  //make methods such as logged_in? accessible for controller validation
  include SessionsHelper
end
