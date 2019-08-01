require "pry"

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.top_five(list)
    @result = list[0..4]
  end
end
