class GifsController < ApplicationController
  before_action :set_scope, only: [:index]
  before_action :require_user, only: [:create, :new]


  def index
    @gifs = @scope.page(params[:page])
    respond_to do |format|
      format.html {}
      format.js {}
      format.json {}
    end
  end

  def show
    @gif = Gif.find(params[:id])
  end

  def create
    @gif = current_user.gifs.new(gif_params)
    unless @gif.save
      render 'new'
    end
  end

  def new
    @gif = Gif.new
  end

  private

  def gif_params
    params.require(:gif).permit(:image_url, :tag_names)
  end

  def set_scope
    case
    when params[:user]
      @scope = User.find_by(username: params[:user]).gifs
    when params[:tag]
      @scope = Tag.find_by(name: params[:tag]).gifs
    else
      @scope = Gif
    end
  end

end
