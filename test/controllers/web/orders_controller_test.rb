require 'test_helper'

class Web::OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:web_order)
  end

  test 'should create order' do
    @order.destroy

    assert_difference 'Order.count' do
      post :create, order: @order.attributes.merge(
        due_by_date: 1.day.from_now, due_by_time: '12:00'
      )
    end
  end
end
