require 'test_helper'

class UsersTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:foo)
  end

  test 'get' do
    get '/user.json', api_token: api_token
    assert_response :success
  end

  test 'update' do
    patch '/user.json', api_token: api_token, user: { first_name: 'John' }
    assert_response :ok
  end

  test 'destroy' do
    delete '/user.json', api_token: api_token
    assert_response :no_content
  end
end
