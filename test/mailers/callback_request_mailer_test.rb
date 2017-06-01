require 'test_helper'

class CallbackRequestMailerTest < ActionMailer::TestCase
  setup do
    @callback_request = callback_requests(:callback_request)
  end

  test 'new callback_request' do
    email = CallbackRequestMailer.new_callback_request(@callback_request)

    assert_emails 1 do
      email.deliver_now
    end

    assert_equal ['orders@gethelp24.ru'], email.from
    assert_equal ['foo@bar.com'], email.to
    assert_equal "Заказ на обратный звонок №#{@callback_request.id}", email.subject
  end
end
