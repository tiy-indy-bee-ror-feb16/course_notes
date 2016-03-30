class MoviesController < ApplicationController

  before_action :fetch_movie, only: [:show, :edit, :update, :destroy]

  def index
    @movies = Movie.order("created_at DESC").all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to @movie
    else
      render :new
    end
  end

  def destroy
    @movie.destroy
    redirect_to root_path
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :description, :rating, :year_released, :box_office, :director_id)
  end

  def fetch_movie
    @movie = Movie.find(params[:id])
  end

end
