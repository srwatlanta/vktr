class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :videos, through: :reviews
  has_secure_password
  validates_uniqueness_of :username, :password, :email, :img_url
  # validates :username, presence: true
  # validates :password_digest, presence: true
  # validates :email, presence: true
  # validates :img_url, presence: true
  validates :username, :password, :email, :presence => {:message => "cannot be blank"}
  validates_length_of :password, :minimum => 7

end
