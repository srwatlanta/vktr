class Video < ApplicationRecord
  belongs_to :artist
  belongs_to :director
  belongs_to :genre

  has_many :reviews
  has_many :users, through: :reviews

  def video_url_id
    x = self.video_url.split("=")
    return x[1]
  end

  def average_rating
    kill = self.reviews.map(&:kill_rating)
    kill_total = kill.inject { |sum, el| sum + el }.to_f / kill.size
    (kill_total * 100).to_i
  end

  def self.highest_rated
    self.all.sort_by do |video|
      -video.average_rating
    end
  end

  def self.lowest_rated
    self.all.sort_by do |video|
      video.average_rating
    end
  end

  def self.highest_view_count
    self.all.sort_by do |video|
      -video.count
    end
  end

  def self.most_reviewed
    self.all.sort_by do |video|
      -video.reviews.count
    end
  end
end
