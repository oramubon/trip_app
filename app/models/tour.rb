class Tour < ApplicationRecord
  belongs_to       :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :country

  with_options presence: true do
    validates :image
    validates :title
    validates :start_on
    validates :end_on
    validates :description
    with_options format: { with: /\A[\d]+\z/, message: 'Half-width number' } do
      validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000, message: 'Out of setting range' }
    end
  end

  with_options numericality: { other_than: 1, message: 'select' } do
    validates :country_id
  end
end
