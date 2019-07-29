class Genre < ApplicationRecord
    has_many :videos
    has_many :artists, through: :videos
    has_many :directors, through: :videos 
    
end
