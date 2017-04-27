require 'test_helper'

class Web::CallbackRequestsControllerTest < ActionController::TestCase
  setup do
    @callback_request = callback_requests(:callback_request)
  end

  test 'should create callback request' do
    @callback_request.destroy

    assert_difference 'CallbackRequest.count' do
      post :create, callback_request: @callback_request.attributes
    end
  end
end
