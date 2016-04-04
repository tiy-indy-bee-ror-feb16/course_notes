class LinksController < ApplicationController

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)
    if @link.save
      redirect_to :root
    else
      render :new
    end
  end

  def click
    @link = Link.find(params[:id])
    @link.votes.create
    redirect_to @link.url
  end

  private

  def link_params
    params.require(:link).permit(:title, :url, :summary)
  end

end
