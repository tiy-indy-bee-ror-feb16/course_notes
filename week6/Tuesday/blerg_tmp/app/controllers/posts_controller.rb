class PostsController < ApplicationController

  before_action :require_author, only: [:create, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :check_authorship, only: [:edit, :update, :destroy]

  before_action only: [:new] do |controller|
    controller.send(:require_author, "You can't create a post without being logged in, jackass.")
  end

  def index
    @posts = Post.ordered.page(params[:page])
  end

  def new
    @this_post = Post.new
  end

  def create
    @this_post = Post.new(post_params)
    if @this_post.save
      @this_post.authors << current_author unless current_author.wrote?(@this_post)
      redirect_to @this_post
    else
      render :new
    end
  end

  def edit
    @this_post = @post
  end

  def update
    @this_post = @post
    if @this_post.update(post_params)
      @this_post.authors << current_author unless current_author.wrote?(@this_post)
      flash[:success] = "Your post is updated, jackass."
      redirect_to [current_author, @this_post]
    else
      render :edit
    end
  end

  def show
    @comment = Comment.new
  end

  def destroy
    @post.destroy
    flash[:success] = "That post is deleted ... jackass."
    redirect_to :root
  end

  private

  def post_params
    params.require(:post).permit(:title, :tag_list, :body, :author_ids => [])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def check_authorship
    unless current_author.wrote?(@post)
      flash[:danger] = "That's not your post, jackass."
      redirect_to :root
    end
  end

end
