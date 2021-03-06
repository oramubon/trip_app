class ToursController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :set_tour,           only: [:show, :edit, :update, :destroy]
  before_action :move_to_index,      only: [:edit, :update, :destroy]

  def index
    @tours = Tour.includes(:user).order("created_at DESC").page(params[:page]).per(5)
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

  def search
    @tours = Tour.where(country_id: params[:country_id]).order("created_at DESC").page(params[:page]).per(5)
  end

  private

  def tour_params
    params.require(:tour).permit(:image, :title, :start_on, :end_on, :country_id, :description, :price).merge(user_id: current_user.id)
  end
  def set_tour
    @tour = Tour.find(params[:id])
  end

  def move_to_index
    unless current_user.id == @tour.user_id && @tour.purchase.blank?
      redirect_to action: :index
    end
  end
end
