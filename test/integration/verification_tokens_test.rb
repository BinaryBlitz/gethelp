require 'test_helper'

class VerificationTokensTest < ActionDispatch::IntegrationTest
  setup do
    @verification_token = verification_tokens(:verification_token)
    @user = users(:foo)
  end

  test 'create' do
    assert_difference 'VerificationToken.count' do
      post '/verification_tokens.json', phone_number: @user.phone_number
      assert_response :created
    end
  end

  test 'validate' do
    patch "/verification_tokens/#{@verification_token.token}", phone_number: @user.phone_number
    assert_response :success
    assert_not_nil json_response[:id]
    assert_not_nil json_response[:first_name]
  end
end
