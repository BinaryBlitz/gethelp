# == Schema Information
#
# Table name: messages
#
#  id         :integer          not null, primary key
#  content    :text
#  category   :string
#  user_id    :integer
#  order_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  image      :string
#

require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  setup do
    @message = messages(:message)
    @operator_message = messages(:operator_message)
    @complaint = messages(:complaint)
  end

  test 'invalid without content' do
    @message.content = ''
    assert @message.invalid?
  end

  test 'invalid without user unless it is an operator message' do
    @message.user = nil
    assert @message.invalid?

    @operator_message.user = nil
    assert @operator_message.valid?
  end

  test 'invalid without order' do
    @message.order = nil
    assert @message.invalid?
  end

  test 'category values are user, operator or complaint' do
    valid_categories = %i(user complaint operator)
    valid_categories.each do |category|
      @message.category = category
      @message.user = nil if category == :operator
      assert @message.valid?
    end
    @message.category = 'test'
    assert @message.invalid?
  end

  test 'cannot be an operator message if user is present' do
    @message.category = 'operator'
    assert @message.invalid?

    @operator_message.user = nil
    assert @operator_message.valid?
  end
end
