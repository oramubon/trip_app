class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one  :area
  has_one  :image
  has_many :tweets
  has_many :reviewer_reviews, class_name: 'Review', :foreign_key => 'reviewer_id'
  has_many :reviewee_reviews, class_name: 'Review', :foreign_key => 'reviewee_id'
  has_many :tours

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

  ASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  with_options format: { with: ASSWORD_REGEX, message: 'Include both letters and numbers' } do
    validates :password
  end

  def avg_score
    unless self.reviewee_reviews.empty?
      reviewee_reviews.average(:score).round(1).to_f
    else
      0.0
    end
  end

  def review_score_percentage
    unless self.reviewee_reviews.empty?
      reviewee_reviews.average(:score).round(1).to_f*100/5
    else
      0.0
    end
  end
end
