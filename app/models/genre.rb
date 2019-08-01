class Genre < ApplicationRecord
  has_many :videos
  has_many :artists, through: :videos
  has_many :directors, through: :videos
  has_many :reviews, through: :videos

  def self.most_viewed
    self.all.sort_by do |genre|
      -genre.total_views
    end
  end

  def self.most_viewed_top_five
    self.top_five(self.most_viewed)
  end

  def self.best_reviewed
    self.all.sort_by do |genre|
      -genre.average_review
    end
  end

  def self.best_reviewed_top_five
    self.top_five(self.best_reviewed)
  end

  def self.worst_reviewed
    self.all.sort_by do |genre|
      genre.average_review
    end
  end

  def self.worst_reviewed_top_five
    self.top_five(self.worst_reviewed)
  end

  def artist_count
    self.artists.count
  end

  def video_count
    self.videos.count
  end

  def director_count
    self.directors.count
  end

  def total_views
    a = 0
    self.videos.each do |video|
      a += video.count
    end
    a
  end

  def average_review
    a = []
    self.videos.each do |video|
      a << video.average_rating
    end
    a.inject { |sum, el| sum + el }.to_f / a.size
  end
end
