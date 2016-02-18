# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  phone_number :string
#  api_token    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  device_token :string
#  platform     :string
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:foo)
  end

  test 'valid' do
    assert @user.valid?
  end

  test 'phone number is normalized' do
    @user.phone_number = '7 123 456 78 90'
    @user.valid?
    assert_equal '+71234567890', @user.phone_number
  end

  test 'phone number uniqueness' do
    user = users(:baz)
    user.phone_number = @user.phone_number + ' '
    assert user.invalid?
  end

  test 'validates platform if device token is present' do
    @user.device_token = nil
    assert @user.valid?

    @user.device_token = 'token'
    assert @user.invalid?

    @user.platform = 'ios'
    assert @user.valid?
  end

  test 'phone number normalization' do
    @user.phone_number = '89998887766'
    @user.valid?

    assert_equal '+79998887766', @user.phone_number
  end
end
