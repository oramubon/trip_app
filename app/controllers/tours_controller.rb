class ToursController < ApplicationController
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
    @tour = Tour.find(params[:id])
  end

  private

  def tour_params
    params.require(:tour).permit(:image, :title, :start_on, :end_on, :country_id, :description, :price).merge(user_id: current_user.id)
  end
end
