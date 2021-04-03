class ToursController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :set_tour,           only: [:show, :edit, :update, :destroy]
  before_action :move_to_index,      only: [:edit, :update, :destroy]

  def index
    @tours = Tour.includes(:user).order("created_at DESC")
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.create(tour_params)
    if @tour.save
      redirect_to tours_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @tour.update(tour_params)
    if @tour.save
      redirect_to tour_path
    else
      render :edit
    end
  end

  def destroy
    @tour.destroy
    redirect_to tours_path
  end

  private

  def tour_params
    params.require(:tour).permit(:image, :title, :start_on, :end_on, :country_id, :description, :price).merge(user_id: current_user.id)
  end
  def set_tweet
    @tour = Tweet.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @tour.user_id
      redirect_to action: :index
    end
  end
end
