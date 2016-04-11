class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user(message="You need to be logged in to do that")
    redirect_with_message(message) unless current_user
  end

  def forbid_user(message="You can't be logged in to do that")
    redirect_with_message(message) if current_user
  end

  def redirect_with_message(message, key = :danger)
    redirect_to :back || :root, flash: { key => message}
  end

end
