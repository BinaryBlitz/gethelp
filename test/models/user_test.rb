# == Schema Information
#
# Table name: users
#
#  id           :integer          not null, primary key
#  first_name   :string
#  last_name    :string
#  email        :string
#  phone_number :string
#  api_token    :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:foo)
  end

  test 'email is downcased before validations' do
    @user.email = 'FOO@BAR.COM'
    @user.valid?
    assert_equal 'foo@bar.com', @user.email
  end

  test 'email uniqueness' do
    dup = @user.dup
    assert @user.invalid?
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
end
