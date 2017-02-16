# == Schema Information
#
# Table name: payments
#
#  id         :integer          not null, primary key
#  sum        :integer
#  paid       :boolean          default("false")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :integer
#

require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  setup do
    @payment = payments(:payment)
  end

  test 'valid' do
    assert @payment.valid?
  end
end
