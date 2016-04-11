class SearchController < ApplicationController
  def index
    if params[:type] == "cheeps"
      @cheeps = Cheep.search_by_body(params[:q]).page(params[:page])
      @title = "Cheeps matching '#{params[:q]}'"
      render 'cheeps/index'
    elsif params[:type] == "users"
      @users = User.search_by_username(params[:q]).page(params[:page])
      @title = "Users matching '#{params[:q]}'"
      render 'users/index'
    end
  end
end
