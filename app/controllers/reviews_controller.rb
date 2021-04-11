class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user,           only: [:index, :new, :create]
  before_action :move_to_index,      only: [:new, :create]

  def index
    @reviews = @user.reviewee_reviews
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.create(review_params)
    if @review.save
      redirect_to user_reviews_path(params[:user_id])
    else
      @reviews = @user.reviewee_reviews
      render :index
    end
  end

  def show
    @review = Review.find(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:reviewee_id, :score, :content).merge(reviewer_id: current_user.id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def move_to_index
    if current_user.id == @user.id
      redirect_to user_reviews_path(params[:user_id])
    end
  end
end
