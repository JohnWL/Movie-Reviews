class MoviesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @movies = Movie.all
  end
  
  def show
  end
  
  def new
    @movies = current_user.movies.build
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
      flash[:success] = "Movie Updated!"
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
  
end
