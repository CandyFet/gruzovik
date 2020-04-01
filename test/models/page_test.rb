require 'test_helper'

class PageTest < ActiveSupport::TestCase
  test "should be valid first fixture" do
    page = pages(:first)
    assert page.valid?
  end

  test "should be invalid without slug" do
    page = pages(:first)
    assert page.valid?
    page.slug = nil
    assert page.invalid?
  end
end
