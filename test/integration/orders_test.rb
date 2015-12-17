require 'test_helper'

class OrdersTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:order)
  end

  test "create" do
    assert_difference 'Order.count' do
      post '/orders.json', api_token: api_token, order: {
        user_id: @order.user_id,
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
      assert_response :success
    end
  end
end
