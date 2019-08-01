class Director < ApplicationRecord
  has_many :videos
  has_many :artists, through: :videos
  has_many :genres, through: :videos
  has_many :reviews, through: :videos

  def self.alphabetize
    self.all.sort_by do |director|
      director.name
    end
  end

  def self.most_viewed
    self.all.sort_by do |director|
      -director.total_views
    end
  end

  def self.most_viewed_top_five
    self.top_five(self.most_viewed)
  end
  def self.best_reviewed
    self.all.sort_by do |director|
      -director.average_review
    end
  end

  def self.best_reviewed_top_five
    self.top_five(self.best_reviewed)
  end

  def self.worst_reviewed
    self.all.sort_by do |director|
      director.average_review
    end
  end

  def self.worst_reviewed_top_five
    self.top_five(self.worst_reviewed)
  end

  def artist_count
    self.artists.uniq.count
  end

  def video_count
    self.videos.count
  end

  def genre_count
    self.genres.count
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
    a.inject { |sum, el| sum + el }.to_i / a.size
  end
end
