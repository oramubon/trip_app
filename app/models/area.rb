class Area < ApplicationRecord
  belongs_to :user, optional: true
end
