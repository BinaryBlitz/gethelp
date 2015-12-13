require 'test_helper'

class UsersTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:foo)
  end

  test 'get' do
    get '/user.json', api_token: api_token
    assert_response :success
  end

  test 'destroy' do
    delete '/user.json', api_token: api_token
    assert_response :no_content
  end
end
