class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @posts = Post.all
    @post = @posts.detect{ |p| p.id == params[:id].to_i }
    @tags = @posts.flat_map { |p| p.tags }.uniq
  end
  
end
