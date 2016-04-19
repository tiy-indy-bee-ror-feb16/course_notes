class BrewsController < ApplicationController

  def new
    @brew = Brew.new
  end

  def create
    @brew = Brew.new(brew_params)
    if @brew.save
      redirect_to @brew
    else
      render :new
    end
  end

  def show
    @brew = Brew.find(params[:id])
  end

  private

  def brew_params
    params.require(:brew).permit(:name, :description, :ibu, :abv, :image)
  end

end
