class MoviesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_movie, only: [:show, :edit, :update, :destroy]
  
  def index
    @movies = Movie.all
  end
  
  def show
    @movie
  end
  
  def new
    @movie = current_user.movies.build
  end
  
  def edit
  end
  
  def create
    @movie = current_user.movies.build(movie_params)
    if @movie.save
      flash[:success] = "Movie Saved!"
      redirect_to @movie
    else
      redirect_to 'new'
    end
  end
  
  def update
    if @movie.update(movie_params)
      flash[:warning] = "Movie Updated!"
      redirect_to @movie
    else
      render 'edit'
    end
  end
  
  def destroy
    @movie.destroy
    flash[:danger] = "Movie Removed!"
    redirect_to root_path
  end
  
  private
  
    def movie_params
      params.require(:movie).permit(:title, :description, :movie_length,
                             :director, :rating, :image)
    end
    
    def find_movie
      @movie = Movie.find(params[:id])
    end
  
end
