require 'test_helper'

class VerificationTokensTest < ActionDispatch::IntegrationTest
  setup do
    @verification_token = verification_tokens(:verification_token)
    @user = users(:foo)
  end

  test 'create' do
    assert_difference 'VerificationToken.count' do
      post verification_tokens_path, params: { phone_number: @user.phone_number }
      assert_response :created
    end
  end

  test 'validate' do
    patch verification_token_path(@verification_token.token), params: {
      phone_number: @user.phone_number,
      code: @verification_token.code
    }
    assert_response :success
    assert_not_nil json_response[:api_token]
  end
end
