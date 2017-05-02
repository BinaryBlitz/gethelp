require 'test_helper'

class OrdersTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:order)
  end

  test 'list' do
    get orders_path(api_token: api_token)
    assert_response :success
    assert json_response.count > 0
  end

  test 'create' do
    assert_difference 'Order.count' do
      post orders_path(api_token: api_token), params: {
        order: {
          course: @order.course,
          grade: @order.grade,
          category: @order.category,
          university: @order.university,
          faculty: @order.faculty,
          email: @order.email,
          starts_at: @order.starts_at,
          due_by: @order.due_by,
          description: @order.description
        }
      }
      assert_response :success
    end
  end

  test 'update' do
    attributes = { description: 'New description.' }
    patch order_path(@order, api_token: api_token), params: {
      order: attributes
    }
    assert_response :ok
    assert_equal attributes[:description], @order.reload.description
  end
end
