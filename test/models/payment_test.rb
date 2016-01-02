# == Schema Information
#
# Table name: payments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  sum        :integer
#  paid       :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  setup do
    @payment = payments(:payment)
  end

  test 'valid' do
    assert @payment.valid?
  end

  test 'accepts only predefined sum options' do
    Payment::PAYMENT_OPTIONS.each do |option|
      @payment.sum = option
      assert @payment.valid?
    end

    @payment.sum = 0
    assert @payment.invalid?
  end
end
