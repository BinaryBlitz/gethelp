# == Schema Information
#
# Table name: verification_tokens
#
#  id           :integer          not null, primary key
#  token        :string
#  phone_number :string
#  code         :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  verified     :boolean          default("false")
#

require 'test_helper'

class VerificationTokenTest < ActiveSupport::TestCase
  setup do
    @verification_token = verification_tokens(:verification_token)
  end

  test 'invalid without phone number' do
    @verification_token.phone_number = nil
    assert @verification_token.invalid?
  end

  test 'generates code and token before creation' do
    token = VerificationToken.new(phone_number: @verification_token.phone_number)
    token.save
    assert_not_nil token.code
    assert_not_nil token.token
  end
end
