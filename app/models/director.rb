class Director < ApplicationRecord
    has_many :videos
    has_many :artists, through: :videos
    has_many :genres, through: :videos
end
