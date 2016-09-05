class OrdersController < ApplicationController
  before_action :set_order, only: [:update]

  def index
    @orders = current_user.orders.order(created_at: :desc)
  end

  def create
    @order = current_user.orders.build(order_params)

    if @order.save
      render :show, status: :created, location: @order
    else
      render json: @order.errors, status: 422
    end
  end

  def update
    if @order.update(order_params)
      head :ok
    else
      render json: @order.errors, status: 422
    end
  end

  private

  def set_order
    @order = current_user.orders.find(params[:id])
  end

  def order_params
    params.require(:order).permit(
      :course, :grade, :category, :university, :faculty, :email, :starts_at, :due_by, :description,
      :activity_type
    )
  end
end
