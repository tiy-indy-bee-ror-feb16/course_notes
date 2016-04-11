class BlockersController < ApplicationController
  before_action :require_user

  def create
    @user = User.find_by(username: params[:blocked])
    current_user.toggle_block(@user)
    redirect_with_message("#{@user.username} is now #{block_label(@user)}", :success)
  end

  private

  def block_label(user)
    user.blocked_by?(current_user) ? "blocked" : "unblocked"
  end
end
