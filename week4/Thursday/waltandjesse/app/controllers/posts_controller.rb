class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.all.detect{ |p| p.id == params[:id].to_i }
  end

end
