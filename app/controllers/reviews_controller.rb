class ReviewsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @reviews = @user.reviewee_reviews
  end

  def new
    @review = Review.new
    @user = User.find(params[:user_id])
    @reviews = @user.reviewee_reviews
  end

  def create
    @review = Review.create(review_params)
    if @review.save
      redirect_to user_reviews_path(params[:user_id])
    else
      @user = User.find(params[:user_id])
      @reviews = @user.reviewee_reviews
      render :index
    end
  end

  private

  def review_params
    params.require(:review).permit(:reviewee_id, :score, :content).merge(reviewer_id: current_user.id)
  end
end
