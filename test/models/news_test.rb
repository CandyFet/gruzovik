require 'test_helper'

class NewsTest < ActiveSupport::TestCase
  test "should be valid first fixture" do
    news = news(:first)
    assert news.valid?
  end
end
