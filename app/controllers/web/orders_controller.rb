class Web::OrdersController < Web::WebController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to new_web_order_path, notice: 'Спасибо, за вашу заявку, в ближайшее время мы свяжемся с вами.'
    else
      render :new
    end
  end

  private

  def order_params
    params
      .require(:order)
      .permit(
        :name, :phone_number, :course, :category, :grade,
        :faculty, :university, :email, :site, :description, :from_web
      )
  end
end
