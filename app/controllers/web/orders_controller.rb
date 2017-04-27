class Web::OrdersController < Web::WebController
  skip_before_action :authenticate_user!

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to web_orders_path, notice: 'Спасибо, за вашу заявку, в ближайшее время мы свяжемся с вами.'
    else
      render :new
    end
  end

  private

  def order_params
    params
      .require(:order)
      .permit(
        :name, :phone_number, :course, :activity_type, :grade,
        :faculty, :university, :email, :site, :description
      )
  end
end
