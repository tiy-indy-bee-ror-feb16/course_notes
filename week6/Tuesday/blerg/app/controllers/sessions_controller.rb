class SessionsController < ApplicationController

  before_action :forbid_author, except: [:destroy]
  before_action :require_author, only: [:destroy]

  def new
  end

  def create
    if @author = Author.find_by(name: params[:session][:name])
      if @author.authenticate(params[:session][:password])
        session[:author_id] = @author.id
        flash[:success] = "You're logged in. Post away!"
        redirect_to session[:intended_destination] || :root
      else
        flash[:warning] = "That password is not correct."
        render :new
      end
    else
      flash[:warning] = "We couldn't find that author in our system."
      render :new
    end
  end

  def destroy
    session[:author_id] = nil
    flash[:warning] = "You're now logged out."
    redirect_to :root
  end

end
