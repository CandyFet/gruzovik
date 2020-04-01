require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "should be valid first fixture" do
    user = users(:user)
    assert user.valid?
  end
end
