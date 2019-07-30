class User < ApplicationRecord
    has_many :reviews
    has_many :videos, through: :reviews

    validates_uniqueness_of :username
    validates :username, presence: true

end
