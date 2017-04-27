require 'test_helper'

class Web::OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:web_order)
  end

  test 'should create order' do
    @order.destroy

    assert_difference 'Order.count' do
      post :create, order: @order.attributes
    end
  end
end
