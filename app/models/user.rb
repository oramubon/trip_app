class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  has_one          :area

  with_options presence: true do
    validates :first_name
    validates :last_name
    validates :birthday
  end

  with_options numericality: { other_than: '--', message: 'select' } do
    validates :gender
  end
end
