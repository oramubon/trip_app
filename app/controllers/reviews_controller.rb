class ReviewsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @reviews = @user.reviewee_reviews
  end

  def create
    @review = Review.create(review_params)
    if @review.save
      redirect_to user_reviews_path(@review.reviewee_id)
    else
      @user = User.find(params[:id])
      render "users/show"
    end
  end

  private

  def review_params
    params.require(:review).permit(:reviewee_id, :score, :content).merge(reviewer_id: current_user.id)
  end
end
