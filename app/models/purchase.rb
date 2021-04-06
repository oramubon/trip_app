class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :tour
  has_one    :information
end
