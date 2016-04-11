class CheepsController < ApplicationController
  def index
    if current_user
      @cheeps = current_user.timeline.page(params[:page])
    else
      @cheeps = Cheep.page(params[:page])
    end
  end

  def create
    @cheep = current_user.cheeps.new(cheep_params)
    if @cheep.save
      flash[:success] = "Cheep, cheep!"
      redirect_to :back || :root
    else
      flash[:warning] = "Oops. a few things to fix."
      render :new
    end
  end

  def show
    user = User.find_by(username: params[:user_id])
    @cheep = user.cheeps.find(params[:id])
  end

  private

  def cheep_params
    params.require(:cheep).permit(:body)
  end

end
