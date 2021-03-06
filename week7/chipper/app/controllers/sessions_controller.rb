class SessionsController < ApplicationController
  before_action :require_user, only: [:destroy]
  before_action :forbid_user, only: [:new, :create]

  def new
  end

  def create
    if @user = User.find_for_login(params[:session][:identifier]).try(:authenticate, params[:session][:password])
      session[:user_id] = @user.id
      redirect_to :root, flash: {success: "You're logged in. Chirp."}
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root, flash: {success: "You're logged out" }
  end
end
