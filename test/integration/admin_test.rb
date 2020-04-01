require 'test_helper'

class AdminTest < ActionDispatch::IntegrationTest
  # test "should be redirected if user not sign in" do
  #   get '/madmin'
  #   assert_response :redirect
  # end
  #
  # test "should be redirected if user is not admin" do
  #   get '/users/sign_in'
  #   assert_response :success
  #   post '/users/sign_in', user: {email: users(:user).email, password: 'password123'}
  #
  #   get '/madmin'
  #   assert_response :redirect
  # end
  #
  # test "should not be redirected if user is admin" do
  #   get '/users/sign_in'
  #   assert_response :success
  #   post '/users/sign_in', user: {email: users(:admin).email, password: 'password123'}
  #
  #   get '/madmin'
  #   assert_response :success
  # end
end
