class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :videos, through: :reviews
  has_secure_password
  validates_uniqueness_of :username, :password_digest, :email, :img_url
  # validates :username, presence: true
  # validates :password_digest, presence: true
  # validates :email, presence: true
  # validates :img_url, presence: true
  validates :username, :password, :email, :img_url, :presence => {:message => "cannot be blank"}

end
