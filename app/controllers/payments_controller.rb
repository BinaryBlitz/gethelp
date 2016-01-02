class PaymentsController < ApplicationController
  def index
    @payments = current_user.payments
  end

  def create
    @payment = current_user.payments.build(payment_params)

    if @payment.save
      render json: { url: @payment.pay_url }, status: :created
    else
      render json: @payment.errors, status: 422
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:sum)
  end
end
