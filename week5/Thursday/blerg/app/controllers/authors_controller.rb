class AuthorsController < ApplicationController

  def show
    @author = Author.find(params[:id])
    @posts = @author.posts.page(params[:page]).per(5)
  end

  def index
    @authors = Author.order("word_count DESC").page(params[:page])
  end

end
