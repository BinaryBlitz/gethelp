# == Schema Information
#
# Table name: call_backs
#
#  id           :integer          not null, primary key
#  name         :string           not null
#  phone_number :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class CallBackTest < ActiveSupport::TestCase
  setup do
    @call_back = call_backs(:call_back)
  end

  test 'valid' do
    assert @call_back.valid?
  end
end
