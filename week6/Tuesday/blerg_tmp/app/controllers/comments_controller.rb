class CommentsController < ApplicationController

  before_action :require_author, except: [:show]
  before_action :set_up_comment, only: [:create]
  before_action :set_new_comment, only: [:show]

  def create
    @comment.author = current_author
    if @comment.save
      flash[:success] = "You commented. You rebel."
      redirect_to :back
    else
      flash[:danger] = "Fill out a damn comment body, jackass."
      redirect_to :back
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.on? current_author
      @comment.destroy
      flash[:success] = "That jackass' comment is deleted."
    else
      flash[:danger] = "That's not your place, jackass."
    end
    redirect_to :back
  end

  def show
    @this_comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def set_up_comment
    if params[:post_id]
      @object = Post.find(params[:post_id])
      @comment = @object.comments.new(comment_params)
      @post = @object
    elsif params[:author_id]
      @object = Author.find(params[:author_id])
      @comment = @object.reps.new(comment_params)
      @author = @object
    elsif params[:comment_id]
      @object = Comment.find(params[:comment_id])
      @comment = @object.comments.new(comment_params)
    end
  end

end
