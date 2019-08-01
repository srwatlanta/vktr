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

  def artist_count
    self.artists.count
  end

  def video_count
    self.videos.count
  end

  def genre_count
    self.genres.count
  end

  # def highest_rated
  #   self.videos.each do |video|
  #     video.kill_rating
  #   end
  # end
end
