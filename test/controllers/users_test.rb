require 'test_helper'

class UsersTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:foo)
    @verification_token = verification_tokens(:verified)
  end

  test 'create' do
    post user_path, params: {
      user: {
        phone_number: @verification_token.phone_number,
        verification_token: @verification_token.token
      }
    }
    assert_response :created
    assert_not_nil json_response[:api_token]
  end

  test 'get' do
    get user_path(api_token: api_token)
    assert_response :success
  end

  test 'update' do
    patch user_path(api_token: api_token), params: {
      user: { device_token: 'foobar', platform: 'ios' }
    }
    assert_response :ok
  end

  test 'destroy' do
    delete user_path(api_token: api_token)
    assert_response :no_content
  end
end
