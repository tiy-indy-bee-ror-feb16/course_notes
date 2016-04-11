class FollowsController < ApplicationController
  before_action :require_user

  def create
    user = User.find_by(username: params[:followed])
    current_user.toggle_follow(user)
    redirect_with_message("You're now following #{user.username}")
  end
end
