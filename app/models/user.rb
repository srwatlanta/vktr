class User < ApplicationRecord
    has_many :reviews
    has_many :videos, through: :reviews
end
