class Review < ApplicationRecord
  belongs_to :video
  belongs_to :user

  validates :kill_rating, presence: true
  validates :content, presence: true
end
