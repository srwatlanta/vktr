class Artist < ApplicationRecord
    has_many :videos
    has_many :genres, through: :videos
    has_many :directors, through: :videos
end
