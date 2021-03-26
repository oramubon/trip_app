class Image < ApplicationRecord
  belongs_to       :user, optional: true
  has_one_attached :image

  with_options presence: true do
    validates :image
  end
end
