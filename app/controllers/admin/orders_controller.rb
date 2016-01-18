class Admin::OrdersController < Admin::AdminController
  before_action :set_order, only: [:show, :edit, :update, :reject]

  def index
    if current_admin.admin?
      @orders = Order.all.order(created_at: :desc).page(params[:page])
    else
      @orders = current_admin.orders.page(params[:page])
    end
    @orders = @orders.where(user_id: params[:user_id]) if params[:user_id].present?
  end

  def show
    @order.view_as_operator
  end

  def edit
  end

  def update
    if @order.update(order_params)
      redirect_to [:admin, @order], notice: 'Заказ обновлен.'
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
    params.require(:order).permit(:sum, :email, :operator_id)
  end
end
