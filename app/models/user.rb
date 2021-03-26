class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :area
  has_one :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :gender

  with_options presence: true do
    validates :first_name
    validates :last_name
    validates :birthday
  end

  with_options numericality: { other_than: 1, message: 'select' } do
    validates :gender_id
  end
end
