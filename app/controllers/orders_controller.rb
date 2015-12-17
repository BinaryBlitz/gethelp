class OrdersController < ApplicationController
  def create
    @order = current_user.orders.build(order_params)

    if @order.save
      render :show, status: :created, location: @order
    else
      render json: @order.errors, status: 422
    end
  end

  private

  def order_params
    params.require(:order).permit(
      :course, :grade, :category, :university, :faculty, :email, :starts_at, :due_by
    )
  end
end
