class Area < ApplicationRecord
  belongs_to :user, optional: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :country_id
  belongs_to :language_id

  with_options presence: true do
    validates :state
  end

  with_options numericality: { other_than: 1, message: 'select' } do
    validates :country_id
    validates :language_id
  end
end
