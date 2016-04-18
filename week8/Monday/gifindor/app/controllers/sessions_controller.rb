class SessionsController < ApplicationController
  before_action :require_user, only: [:destroy]
  before_action :forbid_user, only: [:new, :create]

  def new
  end

  def create
    if @user = User.find_for_login(params[:session][:identifier]).try(:authenticate, params[:session][:password])
      session[:user_id] = @user.id
      respond_to do |format|
        format.html { redirect_to :root, flash: {success: "You're logged in. Chirp."} }
        format.js { render 'navbar_swap' }
      end
    else
      flash[:warning] = "That login combination is not correct. Please try again."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    respond_to do |format|
      format.html {
        redirect_to :root, flash: {success: "You're logged out" }
      }
      format.js {
        render 'navbar_swap'
      }
    end
  end
end
