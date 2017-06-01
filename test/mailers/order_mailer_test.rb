require 'test_helper'

class OrderMailerTest < ActionMailer::TestCase
  setup do
    @order = orders(:order)
  end

  test 'new order' do
    email = OrderMailer.new_order(@order)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['orders@gethelp24.ru'], email.from
    assert_equal ['foo@bar.com'], email.to
    assert_equal "Заказ №#{@order.id}", email.subject
  end
end
