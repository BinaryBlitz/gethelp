require 'test_helper'

class Web::OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:web_order)
  end

  test 'should create order' do
    @order.destroy

    assert_difference 'Order.count' do
      post :create, params: {
        order: @order.attributes.merge(due_by_date: 1.day.from_now, due_by_time: '12:00')
      }
    end

    new_order_email = ActionMailer::Base.deliveries.last

    assert_equal ['orders@gethelp24.ru'], new_order_email.from
    assert_equal ['foo@bar.com'], new_order_email.to
    assert_equal "Заказ №#{Order.last.id}", new_order_email.subject
  end
end
