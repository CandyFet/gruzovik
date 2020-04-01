require 'test_helper'

class MainTextTest < ActiveSupport::TestCase
  test "should be valid first fixture" do
    main_text = main_texts(:phone)
    assert main_text.valid?
  end
end
