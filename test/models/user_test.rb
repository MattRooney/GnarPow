require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'guest with valid attributes can create user' do
    user = User.new(username: 'Matt', password: 'password')

    assert user.valid?
  end

  test 'a user is not created without a username' do
    user = User.new(password: 'password')

    refute user.valid?
  end

  test 'a user is not created without a password' do
    user = User.new(username: 'Matt')

    refute user.valid?
  end
end
