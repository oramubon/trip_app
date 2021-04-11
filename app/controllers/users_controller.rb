class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show

  def index
    @users = User.order("created_at DESC").page(params[:page]).per(5)
  end

  def show
    @user = User.find(params[:id])
  end

  def search
    @users = User.search(params[:keyword]).page(params[:page]).per(5)
  end
end