class AuthorsController < ApplicationController

  before_action :forbid_author, only: [:new, :create]
  before_action :set_new_comment, only: [:show]


  def show
    @author = Author.friendly.find(params[:id])
    @posts = @author.posts.ordered.page(params[:page])
    @post = Post.new(authors: [current_author]) if current_author
  end

  def index
    @authors = Author.order("word_count DESC").page(params[:page])
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(author_params)
    if @author.save
      session[:author_id] = @author.id
      flash[:success] = "You're now signed up. Post away!"
      redirect_to :root
    else
      render :new
    end
  end

  private

  def author_params
    params.require(:author).permit(:name, :bio, :password, :password_confirmation)
  end

end
