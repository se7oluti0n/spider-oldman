class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :signed_in?
  def current_user
    return @current_user if @current_user
    if session[:user_id]
      @current_user = User.find session[:user_id]
    end
  end

  def signed_in?
    if session[:user_id]
      true
    else
      false
    end
  end

  def require_user!
    unless current_user
      redirect_to login_path, flash: {error: "Please log in first"}
    end
  end 
end
