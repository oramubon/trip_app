class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_tour
  before_action :move_to_index

  def new
    @purchase_information = PurchaseInformation.new
  end

  def create
    @purchase_information = PurchaseInformation.new(purchase_params)
    if @purchase_information.valid?
      pay_product
      @purchase_information.save
    else
      render new
    end
  end

  private

  def purchase_params
    params.require(:purchase_information).permit(:phone_number, :other).merge(user_id: current_user.id, tour_id: @tour.id, token: params[:token])
  end

  def set_tour
    @tour = Tour.find(params[:tour_id])
  end

  def pay_product
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @tour.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if @tour.purchase.present? || current_user.id == @tour.user_id
      redirect_to tours_path
    end
  end
end
