class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      flash[:success] = "Review Saved!"
      redirect_to @review
    else
      render :new
    end
  end

  def update
    if @review.update(review_params)
      flash[:warning] = "Review Updated!"
      redirect_to @review
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    flash[:danger] = "Movie Removed!"
    redirect_to root_path
  end

  private

    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:rating, :comment)
    end
end
