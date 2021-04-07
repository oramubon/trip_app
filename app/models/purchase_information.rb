class PurchaseInformation
  include ActiveModel::Model
  attr_accessor :user_id, :tour_id, :phone_number, :other, :purchase_id, :token

  with_options presence: true do
    validates :user_id
    validates :tour_id
    validates :token
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/, message: "Input only number"}
  end

  def save
    purchase = Purchase.create(user_id: user_id, tour_id: tour_id)
    Information.create(phone_number: phone_number, other: other, purchase_id: purchase.id)
  end
end