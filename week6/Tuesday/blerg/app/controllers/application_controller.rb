class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :reset_intended_destination_if_current_author

  helper_method :current_author

  private

  def current_author
    @current_author ||= Author.find(session[:author_id]) if session[:author_id]
  end

  def require_author(default_flash="You must be logged in to do that.")
    unless current_author
      session[:intended_destination] = request.original_url
      flash[:danger] = default_flash
      redirect_to login_path
    end
  end

  def forbid_author
    if current_author
      flash[:warning] = "You're already logged in."
      redirect_to :back
    end
  end

  def reset_intended_destination_if_current_author
    session[:intended_destination] = nil if current_author && session[:intended_destination]
  end

  def set_new_comment
    @comment = Comment.new
  end

end
