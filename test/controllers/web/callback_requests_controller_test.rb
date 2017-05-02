require 'test_helper'

class Web::CallbackRequestsControllerTest < ActionController::TestCase
  setup do
    @callback_request = callback_requests(:callback_request)
  end

  test 'should create callback request' do
    @callback_request.destroy

    assert_difference 'CallbackRequest.count' do
      post :create, params: { callback_request: @callback_request.attributes }
    end

    new_callback_request_email = ActionMailer::Base.deliveries.last

    assert_equal ['orders@gethelp24.ru'], new_callback_request_email.from
    assert_equal ['foo@bar.com'], new_callback_request_email.to
    assert_equal "Заказ на обратный звонок №#{CallbackRequest.last.id}", new_callback_request_email.subject
  end
end
