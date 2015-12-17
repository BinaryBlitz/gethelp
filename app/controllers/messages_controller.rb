class MessagesController < ApplicationController
  before_action :set_order, only: [:index, :create]

  def index
    @messages = @order.messages
  end

  def create
    @message = @order.messages.build(message_params)
    @message.user = current_user

    if @message.save
      render :show, status: :created
    else
      render json: @message.errors, status: 422
    end
  end

  private

  def set_order
    @order = current_user.orders.find(params[:order_id])
  end

  def message_params
    params.require(:message).permit(:content, :category, :image)
  end
end
