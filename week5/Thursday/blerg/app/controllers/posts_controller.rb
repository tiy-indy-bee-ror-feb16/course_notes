class PostsController < ApplicationController

  def index
    @posts = Post.order("created_at DESC").page(params[:page]).per(5)
    Rails.logger.info "Hi. This SQL hasn't run"
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :author_id)
  end

end
