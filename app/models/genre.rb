class Genre < ApplicationRecord
  has_many :videos
  has_many :artists, through: :videos
  has_many :directors, through: :videos

  def artist_count
    self.artists.count
  end

  def video_count
    self.videos.count
  end

  def director_count
    self.directors.count
  end
end
