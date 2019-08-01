require 'test_helper'
#*Ideally, you would like to include a test for everything which could possibly break. It’s a good practice to have at least one test for each of your validations and at least one test for every method in your model.
class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
 
  def setup
    @review = Review.new(kill_rating: 1)
  end

  test 'valid review' do
    @review = Review.new()
    refute @review.valid?
  end

  test 'invalid without kill_rating' do
    @review.kill_rating = nil
    refute @review.valid?, 'saved review without a kill_rating'
  end

end
