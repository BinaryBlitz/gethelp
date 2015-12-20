class Web::OrdersController < Web::WebController
  before_action :authenticate
  before_action :set_order, only: [:edit, :update, :destroy]

  def index
    @orders = @user.orders
  end

  def new
    @order = @user.orders.build
  end

  def create
    @order = @user.orders.build(order_params)

    if @order.save
      redirect_to web_orders_path, notice: 'Заказ успешно создан.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @order.update(order_params)
      redirect_to web_orders_path, notice: 'Заказ успешно обновлен.'
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to web_orders_path, notice: 'Заказ успешно удален.'
  end

  private

  def authenticate
    @user = User.find(session[:user_id])
  end

  def set_order
    @order = @user.orders.find(params[:id])
  end

  def order_params
    params.require(:order).permit(
      :course, :grade, :category, :university, :faculty, :email, :starts_at, :due_by, :description
    )
  end
end
