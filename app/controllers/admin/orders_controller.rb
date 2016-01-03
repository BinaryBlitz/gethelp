class Admin::OrdersController < Admin::AdminController
  before_action :set_order, only: [:show, :update, :reject]

  def index
    @orders = Order.all.order(created_at: :desc).page(params[:page])
  end

  def show
  end

  def update
    if @order.update(order_params)
      redirect_to [:admin, @order], notice: 'Заказ успешно принят.'
    else
      render :show
    end
  end

  def reject
    @order.update(status: 'rejected')
    redirect_to [:admin, @order], notice: 'Отказ произведен.'
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:sum)
  end
end
