class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :videos, through: :reviews
  has_secure_password
  validates_uniqueness_of :username, :email
  validates :username, :email, :presence => { :message => "cannot be blank" }

  def self.most_reviews
    self.all.sort_by do |user|
      -user.reviews.count
    end
  end

  def self.most_reviews_top_five
    self.top_five(self.most_reviews)
  end

  def self.highest_ratings
    self.all.sort_by do |user|
      -user.average_rating
    end
  end

  def self.highest_ratings_top_five
    self.top_five(self.highest_ratings)
  end

  def self.lowest_ratings
    self.all.sort_by do |user|
      user.average_rating
    end
  end

  def self.lowest_ratings_top_five
    self.top_five(self.lowest_ratings)
  end

  def average_rating
    if self.reviews.exists?
      kill = self.reviews.map(&:kill_rating)
      kill_total = kill.inject { |sum, el| sum + el }.to_f / kill.size
      (kill_total * 100).to_i
    else
      return 0
    end
  end

  def review_count
    self.reviews.count
  end

  def video_count
    self.videos.count
  end

  def postable
    self.reviews.select do |review|
      review.content.length > 20
    end
  end
end
