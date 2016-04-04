class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  private

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def require_user
    unless current_user
      flash[:danger] = "You need to be logged in to do that"
      redirect_to :root
    end
  end

  def disallow_user
    if current_user
      flash[:warning] = "You're already logged in"
      redirect_to :root
    end
  end

end
