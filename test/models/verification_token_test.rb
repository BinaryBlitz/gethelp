require 'test_helper'

class VerificationTokenTest < ActiveSupport::TestCase
  setup do
    @verification_token = verification_tokens(:verification_token)
  end

  test 'generates code and token before creation' do
    token = VerificationToken.new(phone_number: @verification_token.phone_number)
    token.valid?
    assert_not_nil token.code
    assert_not_nil token.token
  end

  test 'sends SMS with verification code' do
    token = VerificationToken.new(phone_number: @verification_token.phone_number)
    token.mock(:send_verification_code, nil)
    token.save
    token.verify
  end
end
