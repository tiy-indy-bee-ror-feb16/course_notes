class UsersController < ApplicationController
  before_action :profile_username, only: [:show]
  before_action :require_user, only: [:edit, :update]

  def index
    if current_user && params[:function] == 'following'
      @users = current_user.followeds.page(params[:page])
    else
      @users = User.page(params[:page])
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome aboard!"
      redirect_to :root
    else
      flash[:danger] = "Oops. A few things to fix."
      render :new
    end
  end

  def show
    @user = User.find_by(username: @lookup)
    if current_user && current_user.blocked_by?(@user)
      redirect_with_message("This user has blocked you. Sorry")
    else
      if params[:followers]
        @users = @user.followers.page(params[:page])
        @title = "#{@user.username} is followed by ..."
        render :index
      elsif params[:following]
        @users = @user.followeds.page(params[:page])
        @title = "#{@user.username} is following ..."
        render :index
      else
        @cheeps = @user.cheeps.page(params[:page])
      end
    end
  end

  def edit
    @user = current_user
  end

  def update
    if current_user.try(:authenticate, params[:user][:old_password])
      our_params = user_params
    else
      our_params = user_update_params
    end
    if current_user.update(our_params)
      flash[:success] = "Your profile is all updated!"
      redirect_to current_user
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :bio)
  end

  def user_update_params
    params.require(:user).permit(:username, :email, :bio)
  end

  def profile_username
    if params[:id] == 'self' && current_user
      @lookup = current_user.username
    elsif params[:id] == 'self'
      redirect_with_message("You need be logged in to do that")
    else
      @lookup = params[:id]
    end
  end

end
