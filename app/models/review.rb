class Review < ApplicationRecord
    belongs_to :video
    belongs_to :user

    validates :kill_rating, presence: true
    validates :content, presence: true
    validates :content, length: 20..500, allow_blank: true
end
