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

  # def self.highest_rated
  #   self.all.each do |genre|
  #     genre.videos.each do |video|
  #       x = video.average_rating.inject { |sum, el| sum + el }.to_f / videos.size
  #       "#{genre}: #{x}"
  #     end
  #   end
  # end
end

# genre videos average rating sum and average
