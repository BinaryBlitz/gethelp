class PaymentsController < ApplicationController
  before_action :set_order, only: [:create]

  def create
    payment = @order.payment || @order.build_payment

    if payment.save
      render json: { url: payment.pay_url }, status: :created
    else
      render json: payment.errors, status: 422
    end
  end

  private

  def set_order
    @order = current_user.orders.find(params[:order_id])
  end
end
