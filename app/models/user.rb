class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :videos, through: :reviews
  has_secure_password
  validates_uniqueness_of :username, :email
  validates :username, :email, :presence => { :message => "cannot be blank" }

  def average_rating
    kill = self.reviews.map(&:kill_rating)
    kill_total = kill.inject { |sum, el| sum + el }.to_f / kill.size
    (kill_total * 100).to_i
  end

  def review_count
    self.reviews.count
  end

  def video_count
    self.videos.count
  end

  def self.most_reviews
    self.all.sort_by do |user|
      -user.reviews.count
    end
  end

  def postable
    self.reviews.select do |review|
      review.content.length > 20
    end
  end
end
