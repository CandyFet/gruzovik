ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  CarrierWave.root = 'test/fixtures/files'

  def after_teardown
    super
    CarrierWave.clean_cached_files!(0)
  end
  # Add more helper methods to be used by all tests here...
end

module FixtureFileHelpers
  def user_encrypted_password(password = 'password123')
    User.new.send(:password_digest, password)
  end
end

ActiveRecord::FixtureSet.context_class.send :include, FixtureFileHelpers
