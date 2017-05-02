require 'test_helper'

class MessagesTest < ActionDispatch::IntegrationTest
  setup do
    @message = messages(:message)
    @operator_message = messages(:operator_message)
    @complaint = messages(:complaint)

    @order = orders(:order)
  end

  test 'create' do
    assert_difference 'Message.count' do
      post order_messages_path(@order, api_token: api_token), params: {
        message: { content: 'Test' }
      }
      assert_response :created
    end
  end

  test 'list' do
    get order_messages_path(@order, api_token: api_token)
    assert_response :success
    assert json_response.size > 0
  end
end
