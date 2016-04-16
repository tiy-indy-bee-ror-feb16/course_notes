class FollowsController < ApplicationController
  before_action :require_user

  def create
    user = User.find_by(username: params[:followed])
    current_user.toggle_follow(user)
    respond_to do |format|
      format.html { redirect_with_message("You're now following #{user.username}") }
      format.js { render locals: {user: user} }
    end
  end
end
