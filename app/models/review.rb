class Review < ApplicationRecord
  belongs_to :video
  belongs_to :user

  validates :kill_rating, presence: true
  # validates :content, presence: true
  validates :content, length: 20..500, allow_blank: true

  def self.postable
    self.all.select do |review|
      review.content.length > 20
    end
  end
end
