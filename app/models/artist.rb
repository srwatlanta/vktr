class Artist < ApplicationRecord
  has_many :videos
  has_many :genres, through: :videos
  has_many :directors, through: :videos
  has_many :reviews, through: :videos

  def self.alphabetize
    self.all.sort_by do |artist|
      artist.name
    end
  end

  def genre_count
    self.genres.count
  end

  def video_count
    self.videos.count
  end

  def director_count
    self.directors.count
  end
end
