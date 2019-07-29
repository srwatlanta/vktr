class Video < ApplicationRecord
    belongs_to :artist
    belongs_to :director
    belongs_to :genre

    has_many :reviews
    has_many :users, through: :reviews
end
