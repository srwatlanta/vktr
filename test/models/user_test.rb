require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
    @user = User.new(username: "a_user", email: "user@gmail.com")
  end

  test 'valid user' do
    @user = User.new()
    refute @user.valid?
  end

  test 'invalid without username' do
    @user.username = nil
    refute @user.valid?, 'saved user without a username'
  end

  test 'invalid without email' do
    @user.email = nil
    refute @user.valid?, 'saved user without an email'
  end

end
