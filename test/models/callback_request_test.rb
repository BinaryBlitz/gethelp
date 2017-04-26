# == Schema Information
#
# Table name: callback_requests
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  phone_number :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class CallbackRequestTest < ActiveSupport::TestCase
  setup do
    @callback_request = callback_requests(:callback_request)
  end

  test 'valid' do
    assert @callback_request.valid?
  end
end
