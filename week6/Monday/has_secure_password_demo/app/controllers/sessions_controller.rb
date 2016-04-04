class SessionsController < ApplicationController

  before_action :disallow_user, :only => [:new, :create]
  before_action :require_user, :only => [:destroy]

  def new
  end

  def create
    if @user = User.find_by_email(params[:session][:email]).try(:authenticate, params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "#{@user.username} successfully logged in! Go you!"
      redirect_to :root
    else
      flash[:warning] = "That email and password combo is not correct"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Hey! You've logged out. _sadface_"
    redirect_to :root
  end

end
