class Video < ApplicationRecord
  belongs_to :artist
  belongs_to :director
  belongs_to :genre

  has_many :reviews
  has_many :users, through: :reviews

  def self.highest_rated
    self.all.sort_by do |video|
      -video.average_rating
    end
  end

  def self.highest_rated_top_five
    self.top_five(self.highest_rated)
  end

  def self.lowest_rated
    self.all.sort_by do |video|
      video.average_rating
    end
  end

  def self.lowest_rated_top_five
    self.top_five(self.lowest_rated)
  end

  def self.highest_view_count
    self.all.sort_by do |video|
      -video.count
    end
  end

  def self.highest_view_count_top_five
    self.top_five(self.highest_view_count)
  end

  def self.most_reviewed
    self.all.sort_by do |video|
      -video.reviews.count
    end
  end

  def self.most_reviewed_top_five
    self.top_five(self.most_reviewed)
  end

  def video_url_id
    x = self.video_url.split("=")
    return x[1]
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

  def total_reviews
    self.reviews.count
  end

  def postable
    self.reviews.select do |review|
      review.content.length > 20
    end
  end
end
