class Admin::MessagesController < Admin::AdminController
  before_action :set_order, only: [:create]

  def create
    @message = @order.messages.build(message_params)
    @message.category = 'operator'
    @message.save

    if @message.save
      redirect_to [:admin, @order]
    else
      render 'admin/orders/show'
    end
  end

  private

  def set_order
    @order = Order.find(params[:order_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
