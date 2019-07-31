class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :videos, through: :reviews
  has_secure_password
  validates_uniqueness_of :username, :email
  validates :username, :email, :presence => {:message => "cannot be blank"}

end
