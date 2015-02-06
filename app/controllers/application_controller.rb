class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  
  def current_admin_user
    if session[:user_id]
      @current_user = User.find session[:user_id]
    else
      return false
    end
  end

  def authenticate_admin_user
    unless current_admin_user
      access_denied
    end
  end
  
  def access_denied
    redirect_to '/', flash: {error: "Access Denied"}
  end

  
end
